import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:lib_app/constant/hive_constant.dart';

part 'buy_links_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: kHiveTypeIDForBuyLinksVO)
class BuyLinks {
  @HiveField(0)
  @JsonKey(name: 'name')
  String? name;

  @HiveField(1)
  @JsonKey(name: 'url')
  String? url;

  BuyLinks({this.name, this.url});

  factory BuyLinks.fromJson(Map<String, dynamic> json) => _$BuyLinksFromJson(json);

  @override
  String toString() {
    return '{name: $name, url: $url}';
  }
}
