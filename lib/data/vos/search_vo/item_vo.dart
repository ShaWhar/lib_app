import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:lib_app/data/vos/search_vo/volume_info_vo.dart';

import '../../../constant/hive_constant.dart';

part 'item_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: kHiveTypeIDForItemsVO)
class ItemsVO {
  @JsonKey(name: 'kind')
  @HiveField(0)
  String? kind;

  @JsonKey(name: 'id')
  @HiveField(1)
  String? id;

  @JsonKey(name: 'etag')
  @HiveField(2)
  String? etag;

  @JsonKey(name: 'selfLink')
  @HiveField(3)
  String? selfLink;

  @JsonKey(name: 'volumeInfo')
  @HiveField(4)
  VolumeInfo? volumeInfo;

  @JsonKey(name: 'saleInfo')
  @HiveField(5)
  String? saleInfo;

  @JsonKey(name: 'accessInfo')
  @HiveField(6)
  String? accessInfo;

  @JsonKey(name: 'searchInfo')
  @HiveField(7)
  String? searchInfo;

  ItemsVO({
    this.kind,
    this.id,
    this.etag,
    this.selfLink,
    this.volumeInfo,
    this.saleInfo,
    this.accessInfo,
    this.searchInfo,
  });

  factory ItemsVO.fromJson(Map<String, dynamic> json) => _$ItemsVOFromJson(json);

  @override
  String toString() {
    return 'Items{kind: $kind, id: $id, etag: $etag, selfLink: $selfLink, volumeInfo: $volumeInfo, saleInfo: $saleInfo, accessInfo: $accessInfo, searchInfo: $searchInfo}';
  }
}