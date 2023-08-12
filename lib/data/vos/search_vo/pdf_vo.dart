import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../constant/hive_constant.dart';

part 'pdf_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: kHiveTypeIDForPdfVO)
class Pdf {
  @HiveField(0)
  @JsonKey(name: 'isAvailable')
  bool? isAvailable;

  @HiveField(1)
  @JsonKey(name: 'acsTokenLink')
  String? acsTokenLink;

  Pdf({this.isAvailable, this.acsTokenLink});

  factory Pdf.fromJson(Map<String, dynamic> json) => _$PdfFromJson(json);

  @override
  String toString() {
    return '{isAvailable: $isAvailable, acsTokenLink: $acsTokenLink}';
  }
}
