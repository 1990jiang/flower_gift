import 'package:flutter/widgets.dart';

class TabBarTapProvide with ChangeNotifier{
   int currentTabIndex = 0;
   bottomTabBarTap(tapIndex){
     currentTabIndex = tapIndex;
     //通知
     notifyListeners();
   }
}

