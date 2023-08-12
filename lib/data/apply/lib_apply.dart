import 'package:lib_app/data/vos/home_screen_vo/books_vo.dart';
import 'package:lib_app/data/vos/home_screen_vo/list_vo.dart';

import '../vos/search_history_vo/search_history_vo.dart';
import '../vos/search_vo/item_vo.dart';
import '../vos/shelf_book_vo/shelf_book_vo.dart';

abstract class LIBApply{

  // to retrieve books from a network source,
  Future<List<ListsVO>?> getBooksFromNetwork();

  //retrieving a list of ItemsVO from the network based on a search item.
  Future<List<ItemsVO>?> getSearchItemsFromNetwork(String searchItem);

  //a list of ListsVO objects representing book lists and saves them to a storage container.
  void overallBooksToBox(List<ListsVO> bookLists);

  // save a collection of books in a shelf, to a storage container.
  void shelfBooksToBox(ShelfBookVO shelfBooksVO);

  //saves a SearchHistoryVO object, representing a search history entry, to a storage container.
  void searchHistoryToBox(SearchHistoryVO searchHistory);

  //returns a stream of book lists from the storage container, allowing for real-time updates.
  Stream<List<ListsVO>?> overallBooksFromBoxAsStream();

  //returns a stream of ShelfBooksVO from the storage container, enabling real-time updates.
  Stream<List<ShelfBookVO>?> shelfBooksFromBoxAsStream();

  //a stream of SearchHistoryVO objects representing search history entries from the storage container.
  Stream<List<SearchHistoryVO>?>  searchHistoryFromBoxAsStream();

  //updates the favorite status of a book in the overall box based on the provided ID and book index.
  void modifyFavoriteValue(int id,int bookIndex);

  //creates a new shelf with the given shelf name and an optional book object to add to the shelf.
  void createShelfBooks(String shelfName, {BooksVO? book});

  //creates a new search history entry with the provided search title and search items.
  void createSearchHistory(String searchTitle,String searchItems);

  //removes a book from a specific shelf identified by the shelf name.
  void deleteBookFromShelf(String shelfName,BooksVO ? book);

  //deletes a shelf with the given shelf name.
  void deleteShelf(String shelfName);

  //removes a search history entry with the provided search title.
  void deleteSearchHistory(String searchTitle);

  ///clear
  void clearOverallBox();
  void clearShelfBox();
  void clearSearchHistoryBox();


}



