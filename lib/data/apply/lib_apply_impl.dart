import 'dart:convert';
import 'package:stream_transform/stream_transform.dart';
import 'package:lib_app/data/vos/home_screen_vo/books_vo.dart';
import 'package:lib_app/data/vos/home_screen_vo/list_vo.dart';
import '../../network/data_agent/lib_data_agent.dart';
import '../../network/data_agent/lib_data_agent_impl.dart';
import '../../persistent/dao/overall_storage_dao/overall_storage_dao.dart';
import '../../persistent/dao/overall_storage_dao/overall_storage_dao_impl.dart';
import '../../persistent/dao/search_history_dao/search_history_dao.dart';
import '../../persistent/dao/search_history_dao/search_history_dao_impl.dart';
import '../../persistent/dao/shelf_books_dao/shelf_books_dao.dart';
import '../../persistent/dao/shelf_books_dao/shelf_books_dao_impl.dart';
import '../vos/search_history_vo/search_history_vo.dart';
import '../vos/search_vo/item_vo.dart';
import '../vos/shelf_book_vo/shelf_book_vo.dart';
import 'lib_apply.dart';

class LIBApplyImpl extends LIBApply {
  LIBApplyImpl._();

  static final _singleton = LIBApplyImpl._();

  factory LIBApplyImpl() => _singleton;

  final LibDataAgent _dataAgent = LibDataAgentImpl();
  final OverallStorageDAO _dao = OverallStorageDAOImpl();
  final ShelfBooksDAO _shelfDAO=ShelfBooksDAOImpl();
  final SearchHistoryDAO _searchHistoryDAO=SearchHistoryDAOImpl();

  @override

  Future<List<ListsVO>?> getBooksFromNetwork() async {
    final books = await _dataAgent.getBooks();
    final bookList = books ?? [];

    final favBookList = _dao.getBooksFromBox()?.where((element) => element.favoriteBook).toList() ?? [];
    final decodedFavBookList = jsonDecode(jsonEncode(favBookList));
    final transformedFavBookList = List<ListsVO>.from(decodedFavBookList.map((e) => ListsVO.fromJson(e)));

    overallBooksToBox(bookList);
    overallBooksToBox(transformedFavBookList);

    return bookList;
  }

  @override
  Future<List<ItemsVO>?> getSearchItemsFromNetwork(String searchItem) async {
    final value = await _dataAgent.getSearch(searchItem);
    final itemsList = value ?? [];

    return itemsList;
  }

  @override
  void overallBooksToBox(List<ListsVO> bookLists) =>
      _dao.saveBooks(bookLists);

  @override
  void shelfBooksToBox(ShelfBookVO shelfBooksVO)=>_shelfDAO.shelfBooksToBox(shelfBooksVO);

  @override
  void searchHistoryToBox(SearchHistoryVO searchHistory)=>_searchHistoryDAO.searchHistoryFromBox();


  @override
  Stream<List<ListsVO>?> overallBooksFromBoxAsStream() {
    return _dao.watchBox().asyncExpand((_) {
      return _dao.getBookListsFromBoxStream().map<List<ListsVO>?>((_) => _dao.getBooksFromBox());
    });
  }


  @override
  Stream<List<ShelfBookVO>?> shelfBooksFromBoxAsStream()=>_shelfDAO
      .watchBox()
      .startWith(_shelfDAO.shelfBooksFromBoxAsStream())
      .map((event) => _shelfDAO.shelfBooksFromBox());

  @override
  Stream<List<SearchHistoryVO>?> searchHistoryFromBoxAsStream()=>_searchHistoryDAO
      .watchBox()
      .startWith(_searchHistoryDAO.searchHistoryFromBoxAsStream())
      .map((event) => _searchHistoryDAO.searchHistoryFromBox());



  @override
  void modifyFavoriteValue(int id, int bookIndex) =>
      _dao.modifyFavoriteValue(id, bookIndex);

  @override
  void createShelfBooks(String shelfName, {BooksVO? book})=>_shelfDAO.createShelfBooks(shelfName,book: book);

  @override
  void deleteBookFromShelf(String shelfName, BooksVO? book)=>_shelfDAO.deleteShelfBook(shelfName, book);

  @override
  void deleteShelf(String shelfName)=>_shelfDAO.deleteShelf(shelfName);

  @override
  void clearSearchHistoryBox()=>_searchHistoryDAO.clearSearchHistoryBox();

  @override
  void clearOverallBox() => _dao.clearOverallBox();

  @override
  void clearShelfBox()=>_shelfDAO.clearShelfBox();

  @override
  void createSearchHistory(String searchTitle, String searchItems)=>_searchHistoryDAO.createSearchHistory(searchTitle, searchItems);

  @override
  void deleteSearchHistory(String searchTitle)=>_searchHistoryDAO.deleteSearchHistory(searchTitle);

}


