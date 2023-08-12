
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../constant/hive_constant.dart';

part 'e_pub_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: kHiveTypeIDForEpubVO)
class Epub {
  @HiveField(0)
  @JsonKey(name: 'isAvailable')
  bool? isAvailable;

  Epub({this.isAvailable});

  factory Epub.fromJson(Map<String, dynamic> json) => _$EpubFromJson(json);

  @override
  String toString() {
    return '{isAvailable: $isAvailable,}';
  }
}