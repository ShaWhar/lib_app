import 'package:flutter/material.dart';
import 'easy_text_widget.dart';

class ListTileWidget extends StatelessWidget {
  const ListTileWidget({
    super.key,
    required this.title,
    required this.subTitle,
    required this.leading,
    required this.onTapListTile,
    this.trailing,
  });

  final String title;
  final String subTitle;
  final Widget leading;
  final Function onTapListTile;
  final Widget ? trailing;



  @override
  Widget build(BuildContext context) {
    return  Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        isThreeLine: true,
        title: EasyTextWidget(
          text: title,
          color: Colors.white,
          fontSize: 20,
        ),
        leading:leading,
        subtitle: EasyTextWidget(
          text: subTitle,
          color: Colors.grey,
        ),
        onTap: () {
          onTapListTile();
        },
        trailing: trailing,
      ),
    );
  }
}