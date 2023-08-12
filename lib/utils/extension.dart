import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../bloc/e_books_bloc.dart';
import '../bloc/home_page_bloc.dart';
import '../bloc/search_bloc.dart';
import '../bloc/shelf_bloc.dart';



extension Navigation on BuildContext{
  EBooksBloc getEbooksYourBooksPageBlocInstance()=>read<EBooksBloc>();

  HomePageBloc getHomePageBlocInstance()=>read<HomePageBloc>();

  ShelfBooksBloc getShelvesTabBlocInstance()=>read<ShelfBooksBloc>();

  SearchPageBloc getSearchPageBlocInstance()=>read<SearchPageBloc>();

  void navigateBack(BuildContext context)=>Navigator.of(context).pop();

  Future navigateToNextScreen(BuildContext context,Widget nextScreen)=>
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => nextScreen));

  Future navigateToNextScreenReplace(BuildContext context,Widget nextScreen)=>
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => nextScreen,));
}

extension TextCorrection on String{
  String checkCount(){
    if(this=='0'){
      return 'Empty';
    }else if(this=='1'){
      return '$this book';
    }
    else{
      return '$this books';
    }
  }

  String  nullDefaultImage(){
    if(isEmpty){
      return 'https://climate.onep.go.th/wp-content/uploads/2020/01/default-image.jpg';
    }
    return this;
  }
}