import 'package:flutter/material.dart';
import 'cached_network_image.dart';
import 'easy_text_widget.dart';

class BookWidget extends StatelessWidget {
  const BookWidget({
    Key? key,
    required this.bookImage,
    required this.bookTitle,
    required this.bookListName,
    required this.onPressedFavIcon,
    required this.isFavorite,
    required this.onTapAddToShelf,
    required this.onTap,
  }) : super(key: key);

  final String bookImage;
  final String bookTitle;
  final String bookListName;
  final Function onPressedFavIcon;
  final bool isFavorite;
  final Function onTapAddToShelf;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap as void Function()?,
      onLongPress: () {
        showModalBottomSheet(
          context: context,
          builder: (context) => SizedBox(
            height: 300,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Card(
                  elevation: 10,
                  child: ListTile(
                    leading: EasyCachedNetworkImage(img: bookImage),
                    title: EasyTextWidget(
                      text: bookTitle,
                      color: Colors.white,
                      fontSize: 18,
                    ),
                    subtitle: EasyTextWidget(
                      text: bookListName,
                      color: Colors.white,
                    ),
                  ),
                ),
                const ListTile(
                  leading: Icon(Icons.remove_circle),
                  title: EasyTextWidget(
                    text: 'Remove Download',
                    fontSize: 17,
                    color: Colors.white,
                  ),
                ),
                const ListTile(
                  leading: Icon(Icons.delete),
                  title: EasyTextWidget(
                    text: 'Delete From Library',
                    fontSize: 17,
                    color: Colors.white,
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.add),
                  title: const EasyTextWidget(
                    text: 'Add to Shelf',
                    fontSize: 17,
                    color: Colors.white,
                  ),
                  onTap: onTapAddToShelf as void Function()?,
                ),
              ],
            ),
          ),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.38, //scroll height
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Stack(
                children: [
                  EasyCachedNetworkImage(
                    img: bookImage,
                    height: 0.38,
                  ),
                  Positioned(
                    top: 4,
                    right: 4,
                    child: IconButton(
                      onPressed: onPressedFavIcon as void Function()?,//to define the callback function when the IconButton is pressed or tapped.
                      icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_outline,
                        size: 35,
                        color: isFavorite ? Colors.red : null,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            EasyTextWidget(
              text: bookTitle,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
