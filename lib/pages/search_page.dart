import 'package:flutter/material.dart';
import 'package:lib_app/pages/search_list_page.dart';
import 'package:lib_app/utils/extension.dart';
import 'package:lib_app/view_items/search_bar_with_mic.dart';
import 'package:provider/provider.dart';
import '../../data/vos/search_history_vo/search_history_vo.dart';
import '../bloc/search_bloc.dart';
import '../constant/dimens.dart';
import '../data/vos/search_vo/item_vo.dart';
import '../easy_widgets/cached_network_image.dart';
import '../easy_widgets/easy_text_widget.dart';
import '../easy_widgets/leading_widget.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SearchPageBloc>(
      create: (context) => SearchPageBloc(),
      builder: (context, child) {
        return Scaffold(
            appBar: AppBar(
              actions: const [
                Icon(Icons.mic),
              ],
              title:const SearchBarWithMic(),
            ),
            body: Selector<SearchPageBloc, bool>(
              selector: (_, obj) => obj.getIsSearching,
              shouldRebuild: (previous, next) => previous != next,
              builder: (context, isSearching, _) {
                return (isSearching)
                    ? Selector<SearchPageBloc, List<ItemsVO>?>(
                  selector: (_, obj) => obj.getSearchItems,
                  shouldRebuild: (previous, next) => previous != next,
                  builder: (context, items, _) {
                    return ListView.builder(
                      itemCount: items?.length ?? 0,
                      itemBuilder: (context, index) {
                        return ListTile(
                          isThreeLine: true,
                          title: EasyTextWidget(
                            text: items?[index].volumeInfo?.title ?? '',
                            color: Colors.white,
                            fontSize: kFZ20,
                          ),
                          subtitle: EasyTextWidget(
                            text:
                            items?[index].volumeInfo?.printType ?? '',
                            color: Colors.white,
                          ),
                          leading: LeadingImageWidget(
                              imgWidget: EasyCachedNetworkImage(
                                img: items?[index]
                                    .volumeInfo
                                    ?.imageLinks
                                    ?.thumbnail ??
                                    '',
                                fit: BoxFit.fill,
                              )),
                        );
                      },
                    );
                  },
                )
                    : Selector<SearchPageBloc, List<SearchHistoryVO>?>(
                  selector: (_, obj) => obj.getSearchHistory,
                  shouldRebuild: (previous, next) => previous != next,
                  builder: (context, searchHistory, _) {
                    return ListView.builder(
                      itemCount: searchHistory?.length ?? 0,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: EasyTextWidget(
                              text:
                              searchHistory?[index].searchTitle ?? '',
                              fontSize: kFZ20,
                              color: Colors.white),
                          leading: const Icon(Icons.search),
                          trailing: IconButton(
                            onPressed: () {
                              context
                                  .getSearchPageBlocInstance()
                                  .deleteSearchHistory(
                                  searchHistory?[index].searchTitle ??
                                      '');
                            },
                            icon: const Icon(Icons.delete),
                          ),
                          onTap: () {
                            context.navigateToNextScreen(
                                context,
                                SearchListPage(
                                    searchTitle: searchHistory?[index]
                                        .searchTitle ??
                                        ''));
                          },
                        );
                      },
                    );
                  },
                );
              },
            ));
      },
    );
  }
}


