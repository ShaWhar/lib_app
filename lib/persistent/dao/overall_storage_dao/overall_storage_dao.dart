import '../../../data/vos/home_screen_vo/list_vo.dart';

abstract class OverallStorageDAO{
  void saveBooks(List<ListsVO>? bookLists);

  List<ListsVO> ? getBooksFromBox();

  Stream<List<ListsVO>?> getBookListsFromBoxStream();

  void modifyFavoriteValue(int id,int bookIndex);

  List<ListsVO>? searchBookLists(String keyword);

  Stream watchBox();

  void clearOverallBox();

  List<ListsVO>? getFavoriteBookLists();

  ListsVO? getBookListById(int id);

  void updateBookList(ListsVO bookList);
}