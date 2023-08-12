import 'package:hive/hive.dart';
import 'package:lib_app/data/vos/search_history_vo/search_history_vo.dart';
import 'package:lib_app/persistent/dao/search_history_dao/search_history_dao.dart';

import '../../../constant/hive_constant.dart';

class SearchHistoryDAOImpl extends SearchHistoryDAO{
  SearchHistoryDAOImpl._();

  static final _singleton=SearchHistoryDAOImpl._();

  factory SearchHistoryDAOImpl()=>_singleton;

  Box<SearchHistoryVO> _getSearchHistoryBox()=>Hive.box<SearchHistoryVO>(kBoxNameForSearchHistory);

  @override
  void clearSearchHistoryBox()=>_getSearchHistoryBox().clear();


  @override
  void searchHistoryToBox(SearchHistoryVO searchHistory){
    _getSearchHistoryBox().put(searchHistory.searchTitle, searchHistory);
  }

  @override
  Stream watchBox()=>_getSearchHistoryBox().watch();

  @override
  List<SearchHistoryVO>? searchHistoryFromBox()=>_getSearchHistoryBox().values.toList();

  @override
  Stream<List<SearchHistoryVO>?>? searchHistoryFromBoxAsStream()=>Stream.value(searchHistoryFromBox());

  @override
  void createSearchHistory(String searchTitle, String item) {
    final searchHistory = SearchHistoryVO(searchTitle, item);
    final box = _getSearchHistoryBox();
    box.put(searchHistory.searchTitle, searchHistory);
  }


  @override
  void deleteSearchHistory(String searchTitle) {
    _getSearchHistoryBox().delete(searchTitle);
  }

  @override
  void updateSearchHistory(SearchHistoryVO searchHistory) {
    final box = _getSearchHistoryBox();
    if (box.containsKey(searchHistory.searchTitle)) {
      box.put(searchHistory.searchTitle, searchHistory);
    }
  }


}