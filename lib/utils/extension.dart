import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../bloc/e_books_bloc.dart';
import '../bloc/home_page_bloc.dart';
import '../bloc/search_bloc.dart';
import '../bloc/shelf_bloc.dart';

// Extension for common navigation-related operations
extension Navigation on BuildContext {
  // Method to retrieve an instance of EBooksBloc from the widget tree
  EBooksBloc getEbooksYourBooksPageBlocInstance() => read<EBooksBloc>();

  // Method to retrieve an instance of HomePageBloc from the widget tree
  HomePageBloc getHomePageBlocInstance() => read<HomePageBloc>();

  // Method to retrieve an instance of ShelfBooksBloc from the widget tree
  ShelfBooksBloc getShelvesTabBlocInstance() => read<ShelfBooksBloc>();

  // Method to retrieve an instance of SearchPageBloc from the widget tree
  SearchPageBloc getSearchPageBlocInstance() => read<SearchPageBloc>();

  // Method to navigate back to the previous screen
  void navigateBack(BuildContext context) => Navigator.of(context).pop();

  // Method to navigate to the next screen and push it onto the navigation stack
  Future navigateToNextScreen(BuildContext context, Widget nextScreen) =>
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => nextScreen));

  // Method to navigate to the next screen and replace the current screen
  Future navigateToNextScreenReplace(BuildContext context, Widget nextScreen) =>
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => nextScreen));
}

// Extension for common text manipulation and correction operations
extension TextCorrection on String {
  // Method to check the count and return a modified string based on the value
  String checkCount() {
    if (this == '0') {
      return 'Empty';
    } else if (this == '1') {
      return '$this book';
    } else {
      return '$this books';
    }
  }

  // Method to provide a default image URL if the string is empty
  String nullDefaultImage() {
    if (isEmpty) {
      return 'https://climate.onep.go.th/wp-content/uploads/2020/01/default-image.jpg';
    }
    return this;
  }
}
