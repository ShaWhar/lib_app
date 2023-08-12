import 'package:flutter/cupertino.dart';

class HomePageBloc extends ChangeNotifier{

 ///Properties
  int _index=0; //holds the current index of the bottom navigation bar

  ///Getter
  int get getBottomNavBarIndex=>_index;//returns the current value of the _index property

  ///Method
  void changeBottomNavBarIndex(int index) {
    _index=index;
    notifyListeners();// to update the _index property with a new value passed
  }

}