import 'package:flutter/material.dart';
import '../data/apply/lib_apply.dart';
import '../data/apply/lib_apply_impl.dart';
import '../data/vos/home_screen_vo/books_vo.dart';
import '../data/vos/shelf_book_vo/shelf_book_vo.dart';

class ShelfBooksBloc extends ChangeNotifier {
  /// Instances
  final LIBApply _libraryApply = LIBApplyImpl();
  final TextEditingController _textEditingController = TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  /// Attributes
  bool _dispose = false;
  List<ShelfBookVO> _shelfBooksCollections = [];
  ShelfBookVO? _shelf;

  /// Getters
  GlobalKey<FormState> get globalFormKey => _globalKey;
  TextEditingController get textEditingController => _textEditingController;
  List<ShelfBookVO> get shelfBooksCollections => _shelfBooksCollections;
  ShelfBookVO? get shelf => _shelf;

  /// Methods
  // Create shelf books with an optional book
  void createShelfBooks(String shelfName, {BooksVO? book}) {
    if (book == null) {
      _libraryApply.createShelfBooks(shelfName, book: book);
      return;
    }
    _libraryApply.createShelfBooks(shelfName, book: book);
    notifyListeners();
  }

  // Delete a book from a shelf
  void deleteBookFromShelf(String shelfName, BooksVO? book) {
    _libraryApply.deleteBookFromShelf(shelfName, book);
  }

  // Delete an entire shelf
  void deleteShelf(String shelfName, BooksVO? booksVO) => _libraryApply.deleteShelf(shelfName);

  /// Constructor
  ShelfBooksBloc({ShelfBookVO? shelf}) {
    if (shelf != null) {
      _shelf = shelf;
    }
    _libraryApply.shelfBooksFromBoxAsStream().listen((event) {
      final temp = event ?? [];
      _shelfBooksCollections = temp;
      notifyListeners();
    });
  }

  // Overridden methods
  @override
  void notifyListeners() {
    if (!_dispose) {
      super.notifyListeners();
    }
  }

  @override
  void dispose() {
    _dispose = true;
    _textEditingController.dispose();
    super.dispose();
  }
}
