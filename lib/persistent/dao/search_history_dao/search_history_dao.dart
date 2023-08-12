import '../../../data/vos/search_history_vo/search_history_vo.dart';

abstract class SearchHistoryDAO{
  void searchHistoryToBox(SearchHistoryVO searchHistory);

  List<SearchHistoryVO>?  searchHistoryFromBox();

  Stream<List<SearchHistoryVO>?> ? searchHistoryFromBoxAsStream();

  void clearSearchHistoryBox();

  Stream watchBox();

  void createSearchHistory(String searchTitle,String item);

  void deleteSearchHistory(String searchTitle);

  void updateSearchHistory(SearchHistoryVO searchHistory);

}