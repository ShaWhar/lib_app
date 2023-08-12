import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../constant/hive_constant.dart';
import 'image_links_vo.dart';

part 'volume_info_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: kHiveTypeIDForVolumeInfoVO)
class VolumeInfo {
  @HiveField(0)
  @JsonKey(name: 'title')
  String? title;

  @HiveField(1)
  @JsonKey(name: 'authors')
  List<String>? authors;

  @HiveField(2)
  @JsonKey(name: 'publisher')
  String? publisher;

  @HiveField(3)
  @JsonKey(name: 'publishedDate')
  String? publishedDate;

  @HiveField(4)
  @JsonKey(name: 'description')
  String? description;

  @HiveField(5)
  @JsonKey(name: 'industryIdentifiers')
  List<String>? industryIdentifiers;

  @HiveField(6)
  @JsonKey(name: 'readingModes')
  String? readingModes;

  @HiveField(7)
  @JsonKey(name: 'pageCount')
  int? pageCount;

  @HiveField(8)
  @JsonKey(name: 'printType')
  String? printType;

  @HiveField(9)
  @JsonKey(name: 'categories')
  List<String>? categories;

  @HiveField(10)
  @JsonKey(name: 'averageRating')
  int? averageRating;

  @HiveField(11)
  @JsonKey(name: 'ratingsCount')
  int? ratingsCount;

  @HiveField(12)
  @JsonKey(name: 'maturityRating')
  String? maturityRating;

  @HiveField(13)
  @JsonKey(name: 'allowAnonLogging')
  bool? allowAnonLogging;

  @HiveField(14)
  @JsonKey(name: 'contentVersion')
  String? contentVersion;

  @HiveField(15)
  @JsonKey(name: 'panelizationSummary')
  String? panelizationSummary;

  @HiveField(16)
  @JsonKey(name: 'imageLinks')
  ImageLinks? imageLinks;

  @HiveField(17)
  @JsonKey(name: 'language')
  String? language;

  @HiveField(18)
  @JsonKey(name: 'previewLink')
  String? previewLink;

  @HiveField(19)
  @JsonKey(name: 'infoLink')
  String? infoLink;

  @HiveField(20)
  @JsonKey(name: 'canonicalVolumeLink')
  String? canonicalVolumeLink;

  @HiveField(21)
  @JsonKey(name: 'subtitle')
  String? subtitle;

  VolumeInfo({
    this.title,
    this.authors,
    this.publisher,
    this.publishedDate,
    this.description,
    this.industryIdentifiers,
    this.readingModes,
    this.pageCount,
    this.printType,
    this.categories,
    this.averageRating,
    this.ratingsCount,
    this.maturityRating,
    this.allowAnonLogging,
    this.contentVersion,
    this.panelizationSummary,
    this.imageLinks,
    this.language,
    this.previewLink,
    this.infoLink,
    this.canonicalVolumeLink,
    this.subtitle,
  });

  factory VolumeInfo.fromJson(Map<String, dynamic> json) =>
      _$VolumeInfoFromJson(json);

  @override
  String toString() {
    return '{'
        'title: $title'
    'authors: $authors'
    'publisher: $publisher'
    'publishedDate: $publishedDate'
    'description: $description'
    'industryIdentifiers: $industryIdentifiers'
    'readingModes: $readingModes'
    'pageCount:$pageCount'
    'printType:$printType'
    'categories:$categories'
    'averageRating:$averageRating'
    'ratingsCount:$ratingsCount'
    'maturityRating:$maturityRating'
    'allowAnonLogging:$allowAnonLogging'
    'contentVersion:$contentVersion'
    'panelizationSummary:$panelizationSummary'
    'imageLinks:$imageLinks'
    'language:$language'
    'previewLink:$previewLink'
    'infoLink:$infoLink'
    'canonicalVolumeLink:$canonicalVolumeLink'
    'subtitle:$subtitle';}

}

