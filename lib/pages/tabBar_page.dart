import "package:flutter/material.dart";
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './home_page.dart';
import './category_page.dart';
import './flower_find_page.dart';
import './car_shop_page.dart';
import './mine_page.dart';
import 'package:provide/provide.dart';
import '../provide/tabBarTap_provide.dart';

class TabBarPage extends StatelessWidget {
 
 //tabBar子界面
 final List<BottomNavigationBarItem> bottomTabs = [
       BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.home),
          title: Text("首页")
       ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.collections),
          title: Text("分类")
       ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.share),
          title: Text("花现")
       ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.shopping_cart),
          title: Text("购物车")
       ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.profile_circled),
          title: Text("我的")
       ),
 ];
 //对应的tabBar子页面
 final List<Widget> tabBarSubPages = [
    HomePage(),
    CategoryPage(),
    FlowerFindPage(),
    CarShopPage(),
    MinePage()
 ];

  @override
  Widget build(BuildContext context) {
   //界面适配
    ScreenUtil.instance = ScreenUtil(width: 750.0,height: 1334.0)..init(context);//给定初始尺寸，也就是基本尺寸，其余的都在此基础上缩放
    
    return Scaffold(
       backgroundColor: Colors.white,
       bottomNavigationBar: Provide<TabBarTapProvide>(
          builder: (context,child,tabBarTap){
             return BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                currentIndex: tabBarTap.currentTabIndex,
                fixedColor: Color.fromRGBO(255, 95, 63, 1.0),
                items: bottomTabs,
                onTap: (index){
                      Provide.value<TabBarTapProvide>(context).bottomTabBarTap(index);
                },
             );
          },
       ),
       body: Provide<TabBarTapProvide>(
          builder: (context,child,tabBarTap){
            return IndexedStack(
              index: tabBarTap.currentTabIndex,
              children: tabBarSubPages,
            );
          },
       )
     );
  }
}


