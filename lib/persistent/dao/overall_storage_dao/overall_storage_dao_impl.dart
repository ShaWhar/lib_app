import 'package:hive/hive.dart';
import '../../../data/vos/home_screen_vo/list_vo.dart';
import 'overall_storage_dao.dart';


class OverallStorageDAOImpl implements OverallStorageDAO {
  OverallStorageDAOImpl._();

  static final _singleton = OverallStorageDAOImpl._();
  factory OverallStorageDAOImpl() => _singleton;

  Box<ListsVO> _getOverallBox() => Hive.box<ListsVO>('overall_box');

  @override
  void saveBooks(List<ListsVO>? bookLists) {
    for (var element in bookLists!) {
      _getOverallBox().put(element.listId, element);
    }
  }

  @override
  List<ListsVO>? getBooksFromBox() {
    return _getOverallBox().values.toList();
  }

  @override
  Stream<List<ListsVO>?> getBookListsFromBoxStream() {
    return Stream.value(getBooksFromBox());
  }

  @override
  Stream watchBox() {
    return _getOverallBox().watch();
  }

  @override
  void clearOverallBox() {
    _getOverallBox().clear();
  }

  @override
  void modifyFavoriteValue(int id, int bookIndex) {
    final selectedBooks = _getOverallBox().get(id);

    // Check if the selectedBooks is not null
    if (selectedBooks != null) {
      selectedBooks.favoriteBook = true; // Set favoriteBook to true

      // Retrieve the book with specified index
      final book = selectedBooks.books?[bookIndex];

      // Check if the book is not null
      if (book != null) {
        book.isFavorite = !book.isFavorite!; // unselected the isFavorite
        //If the book was not marked as a favorite, it is now marked as a favorite, and vice versa.


        // Update the dateTime based on the isFavorite value
        ///If the book is marked as a favorite, it sets the current date and time; otherwise, it sets it to null.
        if (!book.isFavorite!) {
          book.dateTime = null;
        } else {
          book.dateTime = DateTime.now();
        }

        // Filter the books to find the ones marked as favorite
        final filterFavBook = selectedBooks.books?.where((element) => element.isFavorite ?? false).toList() ?? [];

        // Update the filterFavoriteBook based on whether any favorite books are present
        selectedBooks.favoriteBook = filterFavBook.isNotEmpty;
      }

      // Store the updated selectedBooks back into box
      _getOverallBox().put(id, selectedBooks);
    }
  }

  @override
  List<ListsVO>? searchBookLists(String keyword) {

      final bookLists = getBooksFromBox();

      if (bookLists != null) {
        final matchingLists = bookLists
            .where((lists) => lists.title?.toLowerCase().contains(keyword.toLowerCase()) ?? false)
            .toList();
        return matchingLists;
      }

      return null;
    }



  @override
  void updateBookList(ListsVO bookList) {
    final bookLists = getBooksFromBox();

    if (bookLists != null) {
      final index = bookLists.indexWhere((list) => list.id == bookList.id);
      if (index != -1) {
        bookLists[index] = bookList;
        saveBooks(bookLists);
      }
    }
  }

  @override
  ListsVO? getBookListById(int id) {
    final bookLists = getBooksFromBox();

    if (bookLists != null) {
      return bookLists.firstWhere((list) => list.id == list.id,
          //orElse: () => null
      );
    }

    return null;
  }

  @override
  List<ListsVO>? getFavoriteBookLists() {
    final bookLists = getBooksFromBox();

    if (bookLists != null) {
      return bookLists.where((list) => list.favoriteBook).toList();
    }

    return null;
  }





}


