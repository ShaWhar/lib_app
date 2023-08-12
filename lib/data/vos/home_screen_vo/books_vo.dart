import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:lib_app/data/vos/home_screen_vo/buy_links_vo.dart';

import '../../../constant/hive_constant.dart';
import 'list_vo.dart';

part 'books_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: kHiveTypeIDForBooksVO)
class BooksVO {
  @HiveField(0)
  @JsonKey(name: 'age_group')
  String? ageGroup;

  @HiveField(1)
  @JsonKey(name: 'amazon_product_url')
  String? amazonProductUrl;

  @HiveField(2)
  @JsonKey(name: 'article_chapter_link')
  String? articleChapterLink;

  @HiveField(3)
  @JsonKey(name: 'author')
  String? author;

  @HiveField(4)
  @JsonKey(name: 'book_image')
  String? bookImage;

  @HiveField(5)
  @JsonKey(name: 'book_image_width')
  int? bookImageWidth;

  @HiveField(6)
  @JsonKey(name: 'book_image_height')
  int? bookImageHeight;

  @HiveField(7)
  @JsonKey(name: 'book_review_link')
  String? bookReviewLink;

  @HiveField(8)
  @JsonKey(name: 'contributor')
  String? contributor;

  @HiveField(9)
  @JsonKey(name: 'contributor_note')
  String? contributorNote;

  @HiveField(10)
  @JsonKey(name: 'created_date')
  String? createdDate;

  @HiveField(11)
  @JsonKey(name: 'description')
  String? description;

  @HiveField(12)
  @JsonKey(name: 'first_chapter_link')
  String? firstChapterLink;

  @HiveField(13)
  @JsonKey(name: 'price')
  String? price;

  @HiveField(14)
  @JsonKey(name: 'primary_isbn10')
  String? primaryIsbn10;

  @HiveField(15)
  @JsonKey(name: 'primary_isbn13')
  String? primaryIsbn13;

  @HiveField(16)
  @JsonKey(name: 'book_uri')
  String? bookUri;

  @HiveField(17)
  @JsonKey(name: 'publisher')
  String? publisher;

  @HiveField(18)
  @JsonKey(name: 'rank')
  int? rank;

  @HiveField(19)
  @JsonKey(name: 'rank_last_week')
  int? rankLastWeek;

  @HiveField(20)
  @JsonKey(name: 'sunday_review_link')
  String? sundayReviewLink;

  @HiveField(21)
  @JsonKey(name: 'title')
  String? title;

  @HiveField(22)
  @JsonKey(name: 'updated_date')
  String? updatedDate;

  @HiveField(23)
  @JsonKey(name: 'weeks_on_list')
  int? weeksOnList;

  @HiveField(24)
  @JsonKey(name: 'buy_links')
  List<BuyLinks>? buyLinks;

  @JsonKey(name: 'is_favorite')
  @HiveField(25)
  bool ? isFavorite;

  @JsonKey(name: 'date_time')
  @HiveField(26)
  DateTime ? dateTime;

  @JsonKey(name:'book_index')
  @HiveField(27)
  int ? bookIndex;

  @HiveField(28)
  @JsonKey(name: 'fromListsVO')
  String? fromListsVO;


  BooksVO(
    this.ageGroup,
    this.amazonProductUrl,
    this.articleChapterLink,
    this.author,
    this.bookImage,
    this.bookImageWidth,
    this.bookImageHeight,
    this.bookReviewLink,
    this.contributor,
    this.contributorNote,
    this.createdDate,
    this.description,
    this.firstChapterLink,
    this.price,
    this.primaryIsbn10,
    this.primaryIsbn13,
    this.bookUri,
    this.publisher,
    this.rank,
    this.rankLastWeek,
    this.sundayReviewLink,
    this.title,
    this.updatedDate,
    this.weeksOnList,
    this.buyLinks,
  this.fromListsVO,
  [this.isFavorite=false,
  this.dateTime,
  this.bookIndex]
  ): super(
    // existing parameter assignments
  );

  factory BooksVO.fromJson(Map<String, dynamic> json) => _$BooksVOFromJson(json);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    // existing property assignments
    data['fromListsVO'] = fromListsVO;
    return data;
  }


  @override
  String toString() {
    return 'Books{ageGroup: $ageGroup, '
        'amazonProductUrl: $amazonProductUrl, '
        'articleChapterLink: $articleChapterLink, '
        'author: $author, '
        'bookImage: $bookImage, '
        'bookImageWidth: $bookImageWidth, '
        'bookImageHeight: $bookImageHeight, '
        'bookReviewLink: $bookReviewLink, '
        'contributor: $contributor, '
        'contributorNote: $contributorNote, '
        'createdDate: $createdDate, '
        'description: $description, '
        'firstChapterLink: $firstChapterLink, '
        'price: $price, '
        'primaryIsbn10: $primaryIsbn10, '
        'primaryIsbn13: $primaryIsbn13'
        'bookUri: $bookUri'
        'publisher: $publisher'
        'rankLastWeek:$rankLastWeek'
        'sundayReviewLink:$sundayReviewLink'
        'title:$title'
        'updatedDate:$updatedDate'
        'weeksOnList:$weeksOnList'
        'buyLinks:$buyLinks'
    ;}
}
