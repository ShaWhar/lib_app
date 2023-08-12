import 'package:flutter/material.dart';
import 'package:lib_app/utils/extension.dart';
import 'package:provider/provider.dart';
import '../bloc/shelf_bloc.dart';
import '../constant/dimens.dart';
import '../constant/strings.dart';
import '../data/vos/home_screen_vo/books_vo.dart';
import '../data/vos/shelf_book_vo/shelf_book_vo.dart';
import '../easy_widgets/cached_network_image.dart';
import '../easy_widgets/easy_text_widget.dart';
import '../easy_widgets/floating_action_button_extended_widget.dart';
import '../easy_widgets/leading_widget.dart';
import '../easy_widgets/list_tile_widget.dart';

class AddToShelfPage extends StatelessWidget {
  const AddToShelfPage({Key? key, required this.book}) : super(key: key);

  final BooksVO book;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ShelfBooksBloc(),
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            title: const EasyTextWidget(
              text: kAddToShelfText,
              color: Colors.white,
              fontSize: kFZ25,
            ),
          ),
          body: Selector<ShelfBooksBloc, List<ShelfBookVO>>(
            selector: (_, obj) => obj.shelfBooksCollections,
            shouldRebuild: (previous, next) => previous != next,
            builder: (context, shelves, _) {
              return (shelves.isEmpty)
                  ? Center(
                      child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: const Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.library_add,
                                size: kFZ90,
                              ),
                              SizedBox(
                                height: kSP20x,
                              ),
                              EasyTextWidget(
                                text: kNoShelfText,
                                color: Colors.white,
                              )
                            ],
                          )))
                  : ListView.builder(
                      itemCount: shelves.length,
                      itemBuilder: (context, index) {
                        return ListTileWidget(
                          title: shelves[index].shelfName ?? '',
                          subTitle: shelves[index].books?.length.toString().checkCount() ?? kEmptyText,
                          onTapListTile: () {context.getShelvesTabBlocInstance().createShelfBooks(
                              shelves[index].shelfName ?? '',
                              book: book);
                          },
                          leading: (shelves[index].books?.isEmpty ?? true)
                              ? LeadingImageWidget(
                                  imgWidget: Image.network(
                                  'https://climate.onep.go.th/wp-content/uploads/2020/01/default-image.jpg',
                                  fit: BoxFit.fill,
                                ))
                              : LeadingImageWidget(
                                  imgWidget: EasyCachedNetworkImage(
                                  img: shelves[index].books?.first.bookImage ??
                                      '',
                                  fit: BoxFit.fill,
                                )),
                        );
                      },
                    );
            },
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: const FloatingActionButtonExtended(),
        );
      },
    );
  }
}
