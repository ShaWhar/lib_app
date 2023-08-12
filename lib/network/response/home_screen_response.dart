import 'package:json_annotation/json_annotation.dart';
part 'home_screen_response.g.dart';

@JsonSerializable()


class HomeScreenResponse {
  @JsonKey(name: 'status')
  String? status;
  @JsonKey(name: 'copyright')
  String? copyright;
  @JsonKey(name: 'numResults')
  int? numResults;
  @JsonKey(name: 'results')
  String? results;

  HomeScreenResponse({this.status, this.copyright, this.numResults, this.results});

  factory HomeScreenResponse.fromJson(Map<String, dynamic> json) => _$HomeScreenResponseFromJson(json);
}
