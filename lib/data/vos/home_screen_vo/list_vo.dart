import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:lib_app/constant/hive_constant.dart';
import 'package:lib_app/data/vos/home_screen_vo/books_vo.dart';

part 'list_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: kHiveTypeIDForListsVO)

class ListsVO {
  @JsonKey(name: 'list_id')
  @HiveField(0)
  int? listId;

  @JsonKey(name: 'list_name')
  @HiveField(1)
  String? listName;

  @JsonKey(name: 'list_name_encoded')
  @HiveField(2)
  String? listNameEncoded;

  @JsonKey(name: 'display_name')
  @HiveField(3)
  String? displayName;

  @JsonKey(name: 'updated')
  @HiveField(4)
  String? updated;

  @JsonKey(name: 'list_image')
  @HiveField(5)
  String? listImage;

  @JsonKey(name: 'list_image_width')
  @HiveField(6)
  String? listImageWidth;

  @JsonKey(name: 'list_image_height')
  @HiveField(7)
  String? listImageHeight;

  @JsonKey(name: 'books')
  @HiveField(8)
  List<BooksVO>? books;

  bool favoriteBook;

  @JsonKey(name: 'title')
  @HiveField(9)
  String? title;

  @JsonKey(name: 'id')
  @HiveField(10)
  String? id;



  ListsVO(
    this.listId,
    this.listName,
    this.listNameEncoded,
    this.displayName,
    this.updated,
    this.listImage,
    this.listImageWidth,
    this.listImageHeight,
    this.books,
      this.title,
      this.id,
   {this.favoriteBook = false}
  );

  factory ListsVO.fromJson(Map<String, dynamic> json) =>
      _$ListsVOFromJson(json);






  @override
  String toString() {
    return 'ListsVO{listId: $listId, listName: $listName, listNameEncoded: $listNameEncoded, displayName: $displayName, updated: $updated, '
        'listImage: $listImage, listImageWidth: $listImageWidth, listImageHeight: $listImageHeight, books: $books}';
  }
}

