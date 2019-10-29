import 'package:flutter/material.dart';
import '../../model/homePage_model_entity.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../provide/homePage_provide.dart';
import 'package:provide/provide.dart';
import '../../routers/application.dart';

class HomeNavtop extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    
    return Provide<HomePageProvide>(
        builder: (context,child,val){
          var  navtop = val.homePageModelEntity.navtop;
          return Container(
            margin: EdgeInsets.only(top: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: _createWidget(context,navtop),
            ),
          );
        }
     );  
  }
 
 List<Widget> _createWidget(BuildContext context, List<HomePageModelNavtop> navtop){
     List<Widget> list = new List();
     for(var i = 0; i < navtop.length; i++){
       list.add(
           Container(
             width: ScreenUtil().setWidth(70),
             child: InkWell(
               onTap: (){
                 print("点击顶部导航item");
                 Application.router.navigateTo(context, "/categoryListItem?typeCode=${navtop[i].typeCode}");
               },
               child: Column(
                 children: <Widget>[
                   Image.network(navtop[i].image),
                   Container(
                      margin: EdgeInsets.only(top: 5.0),
                      child:Text("${navtop[i].title}",
                            style: TextStyle(fontSize: ScreenUtil().setSp(22),
                            ),
                      ) ,
                   )
                   
                ],
              ), 
             )
          )
       );
     }
     return list;
  }

}