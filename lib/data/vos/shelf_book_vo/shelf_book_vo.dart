import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../constant/hive_constant.dart';
import '../home_screen_vo/books_vo.dart';

part 'shelf_book_vo.g.dart';
@JsonSerializable()
@HiveType(typeId: kHiveTypeIDForShelfBookVO)
class ShelfBookVO{
  @JsonKey(name: 'shelf_name')
  @HiveField(0)
  String ? shelfName;
  @JsonKey(name: 'books')
  @HiveField(1)
  List<BooksVO> ? books;

  ShelfBookVO(this.shelfName, this.books);

  factory ShelfBookVO.fromJson(Map<String,dynamic>json)=>_$ShelfBookVOFromJson(json);
  Map<String,dynamic> toJson()=>_$ShelfBookVOToJson(this);
}