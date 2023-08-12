import 'package:json_annotation/json_annotation.dart';
import 'package:lib_app/constant/hive_constant.dart';
import 'package:hive/hive.dart';

part 'sale_info_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: kHiveTypeIDForSaleInfoVO)
class SaleInfo {
@HiveField(0)
@JsonKey(name: 'country')
String? country;

@HiveField(1)
@JsonKey(name: 'saleability')
String? saleability;

@HiveField(2)
@JsonKey(name: 'isEbook')
bool? isEbook;

SaleInfo({this.country, this.saleability, this.isEbook});

factory SaleInfo.fromJson(Map<String, dynamic> json) => _$SaleInfoFromJson(json);


@override
String toString() {
return '{country: $country, saleability: $saleability, isEbook: $isEbook}';
}
}