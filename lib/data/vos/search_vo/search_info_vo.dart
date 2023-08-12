import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:lib_app/constant/hive_constant.dart';

part 'search_info_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: kHiveTypeIDForSearchInfoVO)
class SearchInfo {
  @HiveField(0)
  @JsonKey(name: 'textSnippet')
  String? textSnippet;

  SearchInfo({this.textSnippet});

  factory SearchInfo.fromJson(Map<String, dynamic> json) =>
      _$SearchInfoFromJson(json);

  @override
  String toString() {
    return '{textSnippet: $textSnippet}';
  }
}
