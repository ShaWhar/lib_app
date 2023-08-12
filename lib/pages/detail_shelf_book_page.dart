import 'package:flutter/material.dart';
import 'package:lib_app/utils/extension.dart';
import 'package:provider/provider.dart';
import '../bloc/shelf_bloc.dart';
import '../constant/dimens.dart';
import '../constant/strings.dart';
import '../data/vos/shelf_book_vo/shelf_book_vo.dart';
import '../easy_widgets/cached_network_image.dart';
import '../easy_widgets/easy_text_widget.dart';
import '../easy_widgets/leading_widget.dart';
import 'detail_page.dart';

class DetailShelfBookPage extends StatelessWidget {
  const DetailShelfBookPage({Key? key, required this.shelf}) : super(key: key);

  final ShelfBookVO shelf;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ShelfBooksBloc>(
      create: (context) => ShelfBooksBloc(shelf: shelf),
      builder: (context, child) {
        return Selector<ShelfBooksBloc, ShelfBookVO?>(
          selector: (_, obj) => obj.shelf,
          shouldRebuild: (previous, next) => previous == next,
          builder: (context, shelf, _) {
            return Scaffold(
                appBar: AppBar(
                  actions: const [
                    Icon(
                      Icons.book,
                    ),
                    SizedBox(
                      width: kSP20x,
                    ),
                    Icon(Icons.search),
                    SizedBox(
                      width: kSP10x,
                    ),
                  ],
                  bottom: PreferredSize(
                    preferredSize: const Size.fromHeight(shelfBooksViewTitleHeight),
                    child: ListTile(
                      isThreeLine: true,
                      title: EasyTextWidget(
                        text: shelf?.shelfName ?? '',
                        color: Colors.white,
                        fontSize: kFZ30,
                      ),
                      subtitle: EasyTextWidget(
                        text: shelf?.books?.length.toString().checkCount() ??
                            kEmptyText,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                body: Selector<ShelfBooksBloc, ShelfBookVO?>(
                  selector: (_, obj) => obj.shelf,
                  shouldRebuild: (previous, next) => previous == next,
                  builder: (context, shelf, _) {
                    return (shelf?.books?.isEmpty ?? true)
                        ?const Center(
                        child: Column(
                          children: [
                            Icon(
                              Icons.library_books,
                              size: kFZ90,
                            ),
                            EasyTextWidget(
                                text:kNoBooInTheCollectionText)
                          ],
                        ))
                        : ListView.builder(
                      itemCount: shelf?.books?.length ?? 0,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: kSP20x),
                          child: ListTile(
                            title: EasyTextWidget(
                              text: shelf?.books?[index].title ?? '',
                              color: Colors.white,
                            ),
                            leading: LeadingImageWidget(
                                imgWidget:EasyCachedNetworkImage(img: shelf?.books?[index].bookImage ?? '',fit: BoxFit.fill,)
                            ),
                            trailing: PopupMenuButton(
                              position: PopupMenuPosition.over,
                              onSelected: (selected) {
                                if (selected == kDeleteText) {
                                  context
                                      .getShelvesTabBlocInstance()
                                      .deleteShelf(
                                      shelf?.shelfName ?? '',
                                      shelf?.books![index]
                                  );
                                }
                              },
                              itemBuilder: (context) {
                                return [
                                  const PopupMenuItem(
                                    value: kDeleteText,
                                    child: EasyTextWidget(text:kDeleteText),
                                  )
                                ];
                              },
                            ),
                            onTap: () {
                              context.navigateToNextScreen(context, DetailPage(title: shelf?.books?[index].title ?? '', img: shelf?.books?[index].bookImage ?? ''));
                            },
                          ),
                        );
                      },
                    );
                  },
                ));
          },
        );
      },
    );
  }
}

