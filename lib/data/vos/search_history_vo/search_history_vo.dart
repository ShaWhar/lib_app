import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../constant/hive_constant.dart';

part 'search_history_vo.g.dart';
@JsonSerializable()
@HiveType(typeId: kHiveTypeForSearchHistory)
class SearchHistoryVO{
  @JsonKey(name: 'search_title')
  @HiveField(0)
  String ? searchTitle;

  @JsonKey(name: 'search_items')
  @HiveField(1)
  String ? searchItems;

  SearchHistoryVO(this.searchTitle, this.searchItems);

  factory SearchHistoryVO.fromJson(Map<String,dynamic>json)=>_$SearchHistoryVOFromJson(json);
  Map<String,dynamic> toJson()=>_$SearchHistoryVOToJson(this);
}