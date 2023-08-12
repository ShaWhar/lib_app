import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../constant/hive_constant.dart';

part 'reading_modes_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: kHiveTypeIDForReadingModesVO)
class ReadingModes {
  @HiveField(0)
  @JsonKey(name: 'text')
  bool? text;

  @HiveField(1)
  @JsonKey(name: 'image')
  bool? image;

  ReadingModes({this.text, this.image});

  factory ReadingModes.fromJson(Map<String, dynamic> json) =>
      _$ReadingModesFromJson(json);

  @override
  String toString() {
    return '{text: $text, image: $image}';
  }
}
