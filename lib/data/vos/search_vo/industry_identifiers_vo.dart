import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../constant/hive_constant.dart';

part 'industry_identifiers_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: kHiveTypeIDForIndustryIdentifiersVO)
class IndustryIdentifiers {
  @HiveField(0)
  @JsonKey(name: 'type')
  String? type;

  @HiveField(1)
  @JsonKey(name: 'identifier')
  String? identifier;

  IndustryIdentifiers({this.type, this.identifier});

  factory IndustryIdentifiers.fromJson(Map<String, dynamic> json) =>
      _$IndustryIdentifiersFromJson(json);

  @override
  String toString() {
    return '{type: $type, identifier: $identifier}';
  }
}
