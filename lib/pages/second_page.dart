import 'package:flutter/material.dart';
import 'package:lib_app/easy_widgets/book_list_view.dart';
import 'package:lib_app/pages/your_shelves_page.dart';
import 'package:lib_app/utils/extension.dart';
import 'package:provider/provider.dart';
import '../bloc/e_books_bloc.dart';
import '../constant/dimens.dart';
import '../constant/strings.dart';
import '../data/vos/home_screen_vo/list_vo.dart';
import '../easy_widgets/book_widget.dart';
import '../easy_widgets/easy_text_widget.dart';
import 'add_to_shelf_page.dart';
import 'detail_page.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<EBooksBloc>(
      create: (context) => EBooksBloc(),
      builder: (context, child) {
        return DefaultTabController(
          length: 2,
          child: Column(
            children: [
              const SizedBox(
                height: kSP20x,
              ),
              const TabBar(
                indicatorColor: Colors.blue,
                labelColor: Colors.blue,
                unselectedLabelColor: Colors.grey,
                indicatorSize: TabBarIndicatorSize.label,
                tabs: [
                  Tab(
                    text: kYourBookText,
                  ),
                  Tab(
                    text: kShelvesText,
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    Selector<EBooksBloc, List<ListsVO>?>(
                      selector: (_, obj) => obj.favBooksList,
                      builder: (context, favBooksList, child) {
                        return (favBooksList?.isEmpty ?? true)
                            ? Center(
                                child: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Icon(
                                        Icons.book,
                                        size: kFZ90,
                                      ),
                                      const SizedBox(
                                        height: kSP20x,
                                      ),
                                      const EasyTextWidget(
                                        text: kStartYourCollectionText,
                                        fontSize: kFZ21,
                                        color: Colors.white,
                                      ),
                                      const SizedBox(
                                        height: kSP20x,
                                      ),
                                      const EasyTextWidget(
                                        text: kDescriptionOne,
                                        color: Colors.grey,
                                      ),
                                      const EasyTextWidget(
                                        text: kDescriptionTwo,
                                        color: Colors.grey,
                                      ),
                                      const SizedBox(
                                        height: kSP20x,
                                      ),
                                      MaterialButton(
                                        color: Colors.blue,
                                        onPressed: () {
                                          context
                                              .getHomePageBlocInstance()
                                              .changeBottomNavBarIndex(0);
                                        },
                                        child: const EasyTextWidget(
                                          text: kShopForBooksText,
                                          fontSize: kFZ16,
                                          color: Colors.white,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            : ListView.separated(
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: favBooksList?.length ?? 0,
                                separatorBuilder: (context, index) =>
                                    const SizedBox(
                                  height: kSP30x,
                                ),
                                itemBuilder: (context, listIndex) {
                                  return SizedBox(
                                    height: overviewBooksSectionHeight,
                                    child: BookListView(
                                      bookListName: favBooksList?[listIndex]
                                              .displayName ??
                                          '',
                                      bookListLength: favBooksList?[listIndex]
                                              .books
                                              ?.length ??
                                          0,
                                      itemCount: favBooksList?[listIndex]
                                              .books
                                              ?.length ??
                                          0,
                                      itemBuilder: (_, booksIndex) {
                                        return BookWidget(
                                          bookImage: favBooksList?[listIndex]
                                                  .books?[booksIndex]
                                                  .bookImage ??
                                              '',
                                          bookListName: favBooksList?[listIndex]
                                                  .displayName ??
                                              '',
                                          bookTitle: favBooksList?[listIndex]
                                                  .books?[booksIndex]
                                                  .title ??
                                              '',
                                          isFavorite: favBooksList?[listIndex]
                                                  .books?[booksIndex]
                                                  .isFavorite ??
                                              false,
                                          onPressedFavIcon: () {
                                            context
                                                .getEbooksYourBooksPageBlocInstance()
                                                .modifyFavoriteBookValue(
                                                    favBooksList?[listIndex]
                                                            .listId ??
                                                        -1,
                                                    favBooksList?[listIndex]
                                                            .books?[booksIndex]
                                                            .bookIndex ??
                                                        -1);
                                          },
                                          onTapAddToShelf: () {
                                            context.navigateToNextScreen(
                                                context,
                                                AddToShelfPage(
                                                  book: favBooksList![listIndex]
                                                      .books![booksIndex],
                                                ));
                                          },
                                          onTap: () {
                                            context.navigateToNextScreen(
                                                context,
                                                DetailPage(
                                                    title: favBooksList?[
                                                                listIndex]
                                                            .books?[booksIndex]
                                                            .title ??
                                                        '',
                                                    img: favBooksList?[
                                                                listIndex]
                                                            .books?[booksIndex]
                                                            .bookImage ??
                                                        ''));
                                          },
                                        );
                                      },
                                    ),
                                  );
                                },
                              );
                      },
                    ),
                    const YourShelvesPage()
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
