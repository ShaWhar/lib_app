import 'package:dio/dio.dart';
import 'package:lib_app/data/vos/home_screen_vo/list_vo.dart';
import 'package:lib_app/data/vos/search_vo/item_vo.dart';
import 'package:lib_app/network/api/search_api.dart';
import 'package:lib_app/network/data_agent/lib_data_agent.dart';
import '../../constant/api_constant.dart';
import '../api/home_screen_api.dart';


class LibDataAgentImpl extends LibDataAgent{
  late HomeScreenApi _homeScreenApi;
  late SearchApi _searchApi;//for making API calls to the home screen and search endpoints,
  LibDataAgentImpl._(){
    final dio=Dio();// to create instances of the respective API classes.
    _homeScreenApi = HomeScreenApi(Dio());
    _searchApi=SearchApi(dio);
  }

  static final LibDataAgentImpl _singleton = LibDataAgentImpl._();

  factory LibDataAgentImpl() => _singleton;//allows the class to be instantiated using LibDataAgentImpl() and always return the same instance.

  @override
  Future<List<ListsVO>?> getBooks() => _homeScreenApi
      .getBookResponse(kApiToken, kPublishedDate)
      .asStream()
      .map((event) => List<ListsVO>.from(event.results as Iterable))
      .first;

  @override
  Future<List<ItemsVO>?> getSearch(String searchID) => _searchApi
      .getSearchResponse(searchID)
      .asStream()
      .map((event) => List<ItemsVO>.from(event.items as Iterable))
      .first;

}

