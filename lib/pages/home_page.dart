import 'package:flower_gift/pages/homeSubWidget/home_flowerSingleList_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import '../provide/homePage_provide.dart';
import './homeSubWidget/home_topSwiper_widget.dart';//轮播
import './homeSubWidget/home_smallTag_widget.dart';//小标签
import './homeSubWidget/home_navtopWidget.dart';//导航栏
import './homeSubWidget/home_flowerCategoryWidget.dart';//分类
import './homeSubWidget/home_flowerDoubleList_widget.dart';//第二种list布局
import 'package:flutter_spinkit/flutter_spinkit.dart';//loading提示加载器

class HomePage extends StatelessWidget {
  
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text("花礼网",
           style: TextStyle(
             color: Color.fromRGBO(255, 95, 63, 1.0),
             fontSize: ScreenUtil().setSp(45.0) 
            ),
         ),
      ),
      body: FutureBuilder(
        future: _getHomePage(context),
        builder: (context,snapshot){
          if(snapshot.hasData){
             return Container(
                child: ListView(
                  children: <Widget>[
                      HomeSwiper(),
                      HomeSmallTag(),
                      HomeNavtop(),
                      HomeFlowerCategroy(),
                      HomeFlowerSingleList(1),
                      HomeFlowerSingleList(2),
                      HomeFlowerDoubleList(3),
                      HomeFlowerDoubleList(4),
                      HomeFlowerDoubleList(5),
                      HomeFlowerDoubleList(6),

                  ],
                ),
             );
          }else{
             return Center(
               child: SpinKitWave(
                  color: Colors.orangeAccent,
                  size: 40.0,
               )
             );
          }
        },
      )
    );
  }
 
  Future _getHomePage(BuildContext context) async{
     await Provide.value<HomePageProvide>(context).getHomePageData();
     return "完成加载....";
  }
  

}