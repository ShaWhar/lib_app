import 'package:flutter/material.dart';
import 'package:lib_app/pages/first_page.dart';
import 'package:lib_app/pages/second_page.dart';
import 'package:provider/provider.dart';

import '../bloc/home_page_bloc.dart';
import '../constant/strings.dart';
import '../view_items/search_bar_with_circle_avarter.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider<HomePageBloc>(
        create: (context)=>HomePageBloc(),
        builder: (context, child) =>Scaffold(
          body: NestedScrollView (
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  const SearchBarWithCircleAvatar()
                ];
              },
              body:Consumer<HomePageBloc>(
                builder: (context, obj, child){
                  Widget selectedPage;
                  switch(obj.getBottomNavBarIndex){
                    case 0:
                      selectedPage = const FirstPage();
                      break;
                    case 1:
                      selectedPage = const SecondPage();
                      break;
                    default:
                      selectedPage =  Container();
                  }
                  return selectedPage;
                },
              )
          ),
          bottomNavigationBar: Consumer<HomePageBloc>(
            builder: (context, obj, _) {
              return  BottomNavigationBar(
                currentIndex:obj.getBottomNavBarIndex,
                onTap: (index){
                  obj.changeBottomNavBarIndex(index);
                },
                items: const [
                  BottomNavigationBarItem(icon: Icon(Icons.home),label: kHomeText),
                  BottomNavigationBarItem(icon: Icon(Icons.my_library_books),label: kLibraryText),
                ],
              );
            },
          ),// to switch between different navigation items by tapping on them.
        )
    );
  }
}





