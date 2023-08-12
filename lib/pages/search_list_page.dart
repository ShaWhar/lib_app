import 'package:flutter/material.dart';
import 'package:lib_app/utils/extension.dart';
import 'package:provider/provider.dart';
import '../bloc/search_bloc.dart';
import '../constant/dimens.dart';
import '../data/vos/search_vo/item_vo.dart';
import '../easy_widgets/cached_network_image.dart';
import '../easy_widgets/easy_text_widget.dart';
import 'detail_page.dart';

class SearchListPage extends StatelessWidget {
  const SearchListPage({Key? key,required
  this.searchTitle}) : super(key: key);

  final String searchTitle;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SearchPageBloc>(
      create: (context) => SearchPageBloc(searchKeyword: searchTitle),
      child: Scaffold(
        appBar: AppBar(
          title: EasyTextWidget(text: searchTitle,color: Colors.white,fontSize: kFZ25,),
        ),
        body: Selector<SearchPageBloc,List<ItemsVO>?>(
            selector:(_,obj)=>obj.getSearchItems,
            builder:(context,items,_){
              return ListView.builder(
                itemCount: items?.length??0,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: (){
                      context.navigateToNextScreen(context, DetailPage(title: items?[index].volumeInfo?.title??'', img: items?[index].volumeInfo?.imageLinks?.thumbnail??''));
                    },
                    child: Card(
                      elevation: 5,
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: kSP20x),
                        width: double.infinity,
                        height: searchResultBookHeight,
                        child: Row(
                          children: [
                            SizedBox(
                              width: searchResultBookWidth,
                              height: double.infinity,
                              child: ClipRRect(borderRadius:
                              BorderRadius.circular(kSP10x),
                                  child: EasyCachedNetworkImage(
                                    img: items?[index].
                                    volumeInfo?.imageLinks?.
                                    thumbnail??'',)),
                            ),
                            Expanded(child: Padding(
                              padding: const EdgeInsets.all(kSP10x),
                              child: EasyTextWidget(text: items?[index].volumeInfo?.title??'',fontSize: kFZ20,color: Colors.white,maxLines: 6,),
                            ))
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }
        ),
      ),
    );
  }
}
