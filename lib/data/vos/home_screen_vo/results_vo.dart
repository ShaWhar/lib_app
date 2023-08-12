

import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../constant/hive_constant.dart';
part 'results_vo.g.dart';
@JsonSerializable()
@HiveType(typeId: kHiveTypeIDForHomeScreenVO)
class ResultsVO {
  @JsonKey(name: 'bestsellersDate')
  @HiveField(0)
  String? bestsellersDate;

  @JsonKey(name: 'publishedDate')
  @HiveField(1)
  String? publishedDate;

  @JsonKey(name: 'publishedDateDescription')
  @HiveField(2)
  String? publishedDateDescription;

  @JsonKey(name: 'previousPublishedDate')
  @HiveField(3)
  String? previousPublishedDate;

  @JsonKey(name: 'nextPublishedDate')
  @HiveField(4)
  String? nextPublishedDate;

  @JsonKey(name: 'lists')
  @HiveField(5)
  List<String>? lists;

  ResultsVO(
      {this.bestsellersDate,
        this.publishedDate,
        this.publishedDateDescription,
        this.previousPublishedDate,
        this.nextPublishedDate,
        this.lists});

  factory ResultsVO.fromJson(Map<String, dynamic> json) =>
      _$ResultsVOFromJson(json);

  @override
  String toString() {
    return 'HomeScreenVO{bestsellersDate: $bestsellersDate, publishedDate: $publishedDate, publishedDateDescription: $publishedDateDescription,'
        ' previousPublishedDate: $previousPublishedDate, nextPublishedDate: $nextPublishedDate,lists: $lists,}';
  }



}