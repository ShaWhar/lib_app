import 'package:lib_app/data/vos/home_screen_vo/books_vo.dart';
import 'package:lib_app/data/vos/search_vo/access_info_vo.dart';
import 'package:lib_app/data/vos/search_vo/item_vo.dart';

import '../../data/vos/home_screen_vo/list_vo.dart';

abstract class LibDataAgent{
  Future<List<ListsVO>?> getBooks();

  Future<List<ItemsVO>?> getSearch(String searchID);

}