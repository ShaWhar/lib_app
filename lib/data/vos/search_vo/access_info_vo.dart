import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../constant/hive_constant.dart';

part 'access_info_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: kHiveTypeIDForAccessInfoVO)
class AccessInfo {
  @HiveField(0)
  @JsonKey(name: 'country')
  String? country;

  @HiveField(1)
  @JsonKey(name: 'viewability')
  String? viewability;

  @HiveField(2)
  @JsonKey(name: 'embeddable')
  bool? embeddable;

  @HiveField(3)
  @JsonKey(name: 'publicDomain')
  bool? publicDomain;

  @HiveField(4)
  @JsonKey(name: 'textToSpeechPermission')
  String? textToSpeechPermission;

  @HiveField(5)
  @JsonKey(name: 'epub')
  String? epub;

  @HiveField(6)
  @JsonKey(name: 'pdf')
  String? pdf;

  @HiveField(7)
  @JsonKey(name: 'webReaderLink')
  String? webReaderLink;

  @HiveField(8)
  @JsonKey(name: 'accessViewStatus')
  String? accessViewStatus;

  @HiveField(9)
  @JsonKey(name: 'quoteSharingAllowed')
  bool? quoteSharingAllowed;

  AccessInfo({
    this.country,
    this.viewability,
    this.embeddable,
    this.publicDomain,
    this.textToSpeechPermission,
    this.epub,
    this.pdf,
    this.webReaderLink,
    this.accessViewStatus,
    this.quoteSharingAllowed,
  });

  factory AccessInfo.fromJson(Map<String, dynamic> json) =>
      _$AccessInfoFromJson(json);


  @override
  String toString() {
    return '{country: $country,'
        ' viewability: $viewability,'
        ' embeddable: $embeddable,'
        ' publicDomain: $publicDomain, '
        'textToSpeechPermission: $textToSpeechPermission,'
        ' epub: $epub, pdf: $pdf,'
        ' webReaderLink: $webReaderLink,'
        ' accessViewStatus: $accessViewStatus, '
        'quoteSharingAllowed: $quoteSharingAllowed}';
  }
}
