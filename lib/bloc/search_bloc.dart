import 'package:flutter/cupertino.dart';
import '../data/apply/lib_apply.dart';
import '../data/apply/lib_apply_impl.dart';
import '../data/vos/search_history_vo/search_history_vo.dart';
import '../data/vos/search_vo/item_vo.dart';
import '../utils/debouncer_utils.dart';

class SearchPageBloc extends ChangeNotifier{


  ///Properties
  final LIBApply _libraryApply= LIBApplyImpl();//to interact with and manage search-related data
  final TextEditingController _userInputController= TextEditingController(); //to control the text input widget in the search page
  final Debouncer _debouncer= Debouncer(milliseconds: 1000); //It delays the search request by a specific duration to reduce unnecessary API calls and improve search performance

  bool? _dispose; // to track whether the class has been disposed of.

  List<ItemsVO> ? _searchItems=[]; //representing the search results retrieved from the network.


  List<SearchHistoryVO> ? _searchHistory=[];//representing the search history saved locally.

  bool _isSearching=false; //to indicate whether the user is currently searching

  ///Getter Methods
  List<ItemsVO> ? get getSearchItems=>_searchItems;

  Debouncer get getDebouncer=>_debouncer;

  List<SearchHistoryVO> ? get getSearchHistory=>_searchHistory;

  TextEditingController get getTextController=>_userInputController;

  bool get getIsSearching=>_isSearching;


 ///Methods
  void getSearchItemFromNetwork(String searchItem,{bool ? isSubmitted}){
    _libraryApply.getSearchItemsFromNetwork(searchItem).then((value){
      _searchItems=value??[];
      if(isSubmitted==null){
        createSearchHistory(searchItem, searchItem);
      }
      notifyListeners();
    });
  } //creates search history for non-submitted search items.

  void searchHistoryToBox(SearchHistoryVO searchHistory)=>_libraryApply.searchHistoryToBox(searchHistory);// to save a SearchHistoryVO object to the local storage using the _libraryApply object.

  void createSearchHistory(String searchTitle,String searchItems)=>_libraryApply.createSearchHistory(searchTitle, searchItems);// to create and save a new search history item to local storage using the _libraryApply object.

  void deleteSearchHistory(String searchTitle)=>_libraryApply.deleteSearchHistory(searchTitle);// to delete a search history item from local storage

  void updateIsSearchingValue() {
    _isSearching = _userInputController.text.isNotEmpty;
    notifyListeners();
  } // Updates _isSearching based on text input

  SearchPageBloc({String ? searchKeyword}){

    //constructor
    if(searchKeyword!=null){
      getSearchItemFromNetwork(searchKeyword);
    } //to perform a network request to retrieve search results based on a keyword.

    _libraryApply.searchHistoryFromBoxAsStream().listen((event) {
      final temp=event??[];
      _searchHistory=temp;
      notifyListeners();
    });
  }



  @override
  void notifyListeners() {
    if(!_dispose!){
      super.notifyListeners();
    }
  }
  @override
  void dispose() {
    _dispose=true;
    _userInputController.dispose();
    super.dispose();
  }
}

