import 'package:json_annotation/json_annotation.dart';
import 'package:lib_app/constant/hive_constant.dart';
import 'package:hive/hive.dart';

part 'image_links_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: kHiveTypeIDForImageLinksVO)
class ImageLinks {
  @HiveField(0)
  @JsonKey(name: 'smallThumbnail')
  String? smallThumbnail;

  @HiveField(1)
  @JsonKey(name: 'thumbnail')
  String? thumbnail;

  ImageLinks({this.smallThumbnail, this.thumbnail});

  factory ImageLinks.fromJson(Map<String, dynamic> json) => _$ImageLinksFromJson(json);

  @override
  String toString() {
    return '{smallThumbnail: $smallThumbnail, thumbnail: $thumbnail}';
  }
}