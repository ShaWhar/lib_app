import 'package:flutter/material.dart';

import 'easy_text_widget.dart';

class BookListView extends StatelessWidget {
  const BookListView({Key? key, required this.bookListName, required this.bookListLength, required this.itemBuilder, required this.itemCount}) : super(key: key);

  final String bookListName;
  final int bookListLength;
  final IndexedWidgetBuilder itemBuilder;
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, bottom: 10),
          child: EasyTextWidget(
            text: bookListName,
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: bookListLength,
            itemBuilder: itemBuilder,
          ),
        ),
      ],
    );
  }
}
