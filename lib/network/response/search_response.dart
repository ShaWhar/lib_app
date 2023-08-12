
import 'package:json_annotation/json_annotation.dart';
part 'search_response.g.dart';

@JsonSerializable()
class SearchResponse {
  @JsonKey(name: 'kind')
  String? kind;

  @JsonKey(name: 'totalItems')
  int? totalItems;

  @JsonKey(name: 'items')
  List<String>? items;

  SearchResponse({this.kind, this.totalItems, this.items});

  factory SearchResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchResponseFromJson(json);

}
