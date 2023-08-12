
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../data/apply/lib_apply.dart';
import '../data/apply/lib_apply_impl.dart';
import '../data/vos/home_screen_vo/books_vo.dart';
import '../data/vos/home_screen_vo/list_vo.dart';

class EBooksBloc extends ChangeNotifier {

  ///Class Properties
  final LIBApply _apply = LIBApplyImpl(); //to interact with and manage the data related to books and favorites.
  bool _dispose = false; // to track whether the class has been disposed of.
  bool _isFavorite = false; //A boolean variable that stores whether the currently viewed item is a favorite or not.
  List<ListsVO>? _overallBooks = []; // that represents the overall list of books.
  List<BooksVO> _favBooks = []; // representing the user's favorite books.
  List<ListsVO>? _favBookList = []; //representing the favorite book lists


  ///Getter Methods
  bool get isFavorite => _isFavorite;
  List<ListsVO>? get overviewBooks => _overallBooks;
  List<ListsVO>? get favBooksList => _favBookList;
  List<BooksVO>? get favBooks => _favBooks;


 ///methods
  void modifyFavorite(bool favValue) {
    _isFavorite = favValue;
    notifyListeners();
  }

  void modifyFavoriteBookValue(int id, int bookIndex) {
    _apply.modifyFavoriteValue(id, bookIndex);
  }


  EBooksBloc() {

    _apply.getBooksFromNetwork(); //to fetch books data from the network

    _apply.overallBooksFromBoxAsStream().listen((event) {

      _favBooks.clear();

      _overallBooks = event ?? [];

      _favBookList = _overallBooks
          ?.where((element) => element.favoriteBook ?? false)
          .toList() ?? [];

      _favBooks = _favBookList
          ?.expand((element) => element.books ?? [])
          .where((element) => element.isFavorite ?? false)
          .toList()
          .cast<BooksVO>() ?? [];


      _favBooks.sort((a, b) => b.dateTime?.compareTo(a.dateTime!) ?? 0);

      notifyListeners();
    });
  }

  @override
  void notifyListeners() => !_dispose ? super.notifyListeners() : null; //to avoid notifying listeners after the class has been disposed of


  @override
  void dispose() {
    _dispose = true;
    super.dispose(); //clean up any resources before disposing of the class
    // cleaning up resources before disposing of a class is crucial for efficient memory management
  }
}
