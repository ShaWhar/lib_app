import '../../constant/api_constant.dart';
import '../response/home_screen_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'home_screen_api.g.dart';

@RestApi(baseUrl: kHomeScreenBaseURL )
abstract class HomeScreenApi {
  factory HomeScreenApi(Dio dio) => _HomeScreenApi(dio);

  @GET(kHomeScreenEndPoint)
  Future<HomeScreenResponse> getBookResponse(
      @Query(kQueryParamsApiKey) String apiKey,
      @Query(kPublishedDateKey) String publishedDate,
      );

}