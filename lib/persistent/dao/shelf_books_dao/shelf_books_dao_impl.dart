import 'package:hive/hive.dart';
import 'package:lib_app/persistent/dao/shelf_books_dao/shelf_books_dao.dart';
import '../../../constant/hive_constant.dart';
import '../../../data/vos/home_screen_vo/books_vo.dart';
import '../../../data/vos/shelf_book_vo/shelf_book_vo.dart';

class ShelfBooksDAOImpl extends ShelfBooksDAO {

  ShelfBooksDAOImpl._();
  static final _singleton=ShelfBooksDAOImpl._();
  factory ShelfBooksDAOImpl()=>_singleton;


  final Box<ShelfBookVO> _shelfBooksBox = Hive.box<ShelfBookVO>(kBoxNameForShelfBooks);

  @override
  void clearShelfBox() {
    _shelfBooksBox.clear();
  }

  @override
  List<ShelfBookVO>? shelfBooksFromBox() {
    return _shelfBooksBox.values.toList();
  }

  @override
  Stream<List<ShelfBookVO>?> shelfBooksFromBoxAsStream() {
    return Stream.value(shelfBooksFromBox());
  }

  @override
  void shelfBooksToBox(ShelfBookVO shelfBooksVO) {
    _shelfBooksBox.put(shelfBooksVO.shelfName, shelfBooksVO);
  }

  @override
  Stream watchBox() {
    return _shelfBooksBox.watch();
  }

  @override
  void createShelfBooks(String shelfName, {BooksVO? book}) {
    final temp = _shelfBooksBox.get(shelfName) ?? ShelfBookVO(shelfName, []);
    if (book != null) {
      temp.books?.add(book);
    }
    shelfBooksToBox(temp);
  }

  @override
  void deleteShelfBook(String shelfName, BooksVO? book) {
    final temp = _shelfBooksBox.get(shelfName);
    temp?.books?.remove(book);
    _shelfBooksBox.put(shelfName, temp ?? ShelfBookVO(shelfName, []));
  }

  @override
  void deleteShelf(String shelfName) {
    _shelfBooksBox.delete(shelfName);
  }

  @override
  void updateShelfBook(ShelfBookVO shelfBook) {
    _shelfBooksBox.put(shelfBook.shelfName, shelfBook);
  }

}
