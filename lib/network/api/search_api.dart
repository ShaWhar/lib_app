import '../../constant/api_constant.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../response/search_response.dart';

part 'search_api.g.dart';

@RestApi(baseUrl: kSearchBaseURL )
abstract class SearchApi {
  factory SearchApi(Dio dio) => _SearchApi(dio);

@GET(kSearchEndPoint)
Future<SearchResponse>  getSearchResponse(
    @Query(kQKey) String qKey,
    );

}