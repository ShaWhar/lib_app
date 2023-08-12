import 'package:lib_app/data/vos/shelf_book_vo/shelf_book_vo.dart';

import '../../../data/vos/home_screen_vo/books_vo.dart';

abstract class ShelfBooksDAO{
  void shelfBooksToBox(ShelfBookVO shelfBooksVO);

  List<ShelfBookVO> ? shelfBooksFromBox();

  Stream watchBox();

  Stream<List<ShelfBookVO>?> shelfBooksFromBoxAsStream();

  void createShelfBooks(String shelfName, {BooksVO? book});

  void deleteShelfBook(String shelfName,BooksVO ? book);

  void deleteShelf(String shelfName);

  void clearShelfBox();

  void updateShelfBook(ShelfBookVO shelfBook);
}