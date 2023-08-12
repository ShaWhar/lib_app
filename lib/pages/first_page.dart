import 'package:flutter/material.dart';
import 'package:lib_app/easy_widgets/book_list_view.dart';
import 'package:lib_app/utils/extension.dart';
import 'package:provider/provider.dart';
import '../../view_items/carousel_slider_view.dart';
import '../bloc/e_books_bloc.dart';
import '../constant/dimens.dart';
import '../constant/strings.dart';
import '../data/vos/home_screen_vo/list_vo.dart';
import '../easy_widgets/book_widget.dart';
import 'add_to_shelf_page.dart';
import 'detail_page.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<EBooksBloc>(
      create: (context) => EBooksBloc(),
      builder: (context, child) => DefaultTabController(
        length: tabBarLength,
        child: ListView(scrollDirection: Axis.vertical, children: [
          const SizedBox(height: kSP20x),
          const CarouselSliderView(),
          const SizedBox(height: kSP20x),
           const TabBar(
            indicatorColor: Colors.blue,
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.grey,
            indicatorSize: TabBarIndicatorSize.label,
            tabs: [
              Tab(
                text: kEbooksText,
              ),
              Tab(
                text: kAudiobooksText,
              ),
            ],
          ),
          const SizedBox(height: kSP20x),
          Selector<EBooksBloc, List<ListsVO>?>(
              selector: (context, obj) => obj.overviewBooks,
              shouldRebuild: (pre, next) => pre != next,
              builder: (context, overviewBooks, _) {
                int size = overviewBooks?.length ?? 1;
                return SizedBox(
                  height: size * overviewBooksSectionHeight + (size) * kSP30x,
                  child: TabBarView(
                    children: [
                      ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: overviewBooks?.length ?? 0,
                        separatorBuilder: (context, index) => const SizedBox(
                          height: kSP30x,
                        ),
                        itemBuilder: (context, listIndex) {
                          return SizedBox(
                            height: overviewBooksSectionHeight,
                            child: BookListView(
                              bookListName:
                              overviewBooks?[listIndex].displayName ?? '',
                              bookListLength:
                              overviewBooks?[listIndex].books?.length ?? 0,
                              itemCount:
                              overviewBooks?[listIndex].books?.length ?? 0,
                              itemBuilder: (_, booksIndex) {
                                return BookWidget(
                                  bookImage: overviewBooks?[listIndex]
                                      .books?[booksIndex]
                                      .bookImage ??
                                      '',
                                  bookListName:
                                  overviewBooks?[listIndex].displayName ??
                                      '',
                                  bookTitle: overviewBooks?[listIndex]
                                      .books?[booksIndex]
                                      .title ??
                                      '',
                                  isFavorite: overviewBooks?[listIndex]
                                      .books?[booksIndex]
                                      .isFavorite ??
                                      false,
                                  onPressedFavIcon: () {
                                    overviewBooks?[listIndex]
                                        .books?[booksIndex]
                                        .bookIndex = booksIndex;
                                    context
                                        .getEbooksYourBooksPageBlocInstance()
                                        .modifyFavoriteBookValue(
                                        overviewBooks?[listIndex].listId ??
                                            -1,
                                        booksIndex);
                                  },
                                  onTapAddToShelf: () {
                                    context.navigateToNextScreen(
                                        context,
                                        AddToShelfPage(
                                          book: overviewBooks![listIndex]
                                              .books![booksIndex],
                                        ));
                                  },
                                  onTap: () {
                                    context.navigateToNextScreen(
                                        context,
                                        DetailPage(
                                            title: overviewBooks?[listIndex]
                                                .books?[booksIndex]
                                                .title ??
                                                '',
                                            img: overviewBooks?[listIndex]
                                                .books?[booksIndex]
                                                .bookImage ??
                                                ''));
                                  },
                                );
                              },
                            ),
                          );
                        },
                      ),
                      Container(),
                    ],
                  ),
                );
              }),
        ]),
      ),
    );
  }
}
