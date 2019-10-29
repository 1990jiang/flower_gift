import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../model/homePage_model_entity.dart';
import 'package:provide/provide.dart';
import '../../provide/homePage_provide.dart';
import '../../routers/application.dart';

class HomeFlowerCategroy extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    return Provide<HomePageProvide>(
        builder: (context,child,val){
          var homePageModelEntity = val.homePageModelEntity;
            return Container(
              margin: EdgeInsets.only(top: 10.0),
              child: Column(
                children: <Widget>[
                  _titleWidget(homePageModelEntity),
                  _firstFlowerCategory(context,homePageModelEntity.flowercategory),
                  _twoFlowerCategory(homePageModelEntity.flowercategory2),
                  _oneRecommend(homePageModelEntity.recommend2),
                  _twoRecommend(homePageModelEntity.recommend3)
                ],
              ),
            );
        }
    );     
  }
  

  //标题组件>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  Widget _titleWidget(HomePageModelEntity entity){
    return Container(
        padding: EdgeInsets.only(left: 15.0),
        alignment: Alignment.centerLeft,
        child: Text(
          entity.recommendTitle,
          style: TextStyle(
            color: Colors.orange
          ),
        ),
    );
  }

  //flowerCategory one 组件>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  Widget _firstFlowerCategory(BuildContext context, List<HomePageModelFlowercategory> flowerCategory){
    return Container(
       margin: EdgeInsets.only(top: 10.0),
       child: Row(
         //mainAxisAlignment: MainAxisAlignment.spaceAround,
         children: _firstFlowerCategoryList(context,flowerCategory),
       ),
    );
  }

  List<Widget> _firstFlowerCategoryList(BuildContext context,List<HomePageModelFlowercategory> flowerCategory){
      List<Widget> list = new List();
     for(var i = 0; i < flowerCategory.length; i++){
       list.add(
          _firstFlowerCategoryItem(context,flowerCategory[i])
       );
     }
     return list;
  }
  Widget _firstFlowerCategoryItem(BuildContext context,HomePageModelFlowercategory flowerCategoryItem){
      return  Expanded(
             flex: 1,
             child: AspectRatio(
                aspectRatio: 1.0,
                child:  Container(
                    color: Colors.transparent,
                    padding: EdgeInsets.only(left: 10.0,right: 10.0),
                    child: ClipRRect(
                       borderRadius: BorderRadius.circular(8.0),
                       child:  Container(
                        child: InkWell(
                            onTap: (){
                              print("点击了flowerCategoryItem...");
                              Application.router.navigateTo(context, "/categoryListItem?typeCode=${flowerCategoryItem.typeCode}");
                            },
                            child: Stack(
                                  alignment: const FractionalOffset(0.5, 0.1),
                                  children: <Widget>[
                                    Image.network(flowerCategoryItem.image),
                                    Text(flowerCategoryItem.title),
                                    
                                  ],
                              ),
                          )
                          
                        ),
                    ),
                ),
             )
          );
      
      
  }


  //flowerCategory two 组件>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  Widget _twoFlowerCategory(List<HomePageModelFlowercategory2> flowerCategory2){
    return Container(
       margin: EdgeInsets.only(top: 5.0),
       child: Row(
         mainAxisAlignment: MainAxisAlignment.spaceAround,
         children: _twoFlowerCategoryList(flowerCategory2),
       ),
    );
  }

  List<Widget> _twoFlowerCategoryList(List<HomePageModelFlowercategory2> flowerCategory2){
      List<Widget> list = new List();
     for(var i = 0; i < flowerCategory2.length; i++){
       list.add(
          _twoFlowerCategoryItem(flowerCategory2[i])
       );
     }
     return list;
  }
  Widget _twoFlowerCategoryItem(HomePageModelFlowercategory2 flowerCategoryItem){
      return Container(
        
        width:ScreenUtil().setWidth(160.0),
        //  height: 120.0,
         child: InkWell(
           onTap: (){
             print("点击了flowerCategoryItem2...");
           },
           child: Stack(
                alignment: const FractionalOffset(0.5, 0.1),
                children: <Widget>[
                  Image.network(flowerCategoryItem.image),
                  Text(flowerCategoryItem.title),
                ],
            ),
         )
         
      );
  }
   //recommend one 组件>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    Widget _oneRecommend(List<HomePageModelRecommand2> recommend2){
    return Container(
       margin: EdgeInsets.only(top: 15.0),
       child: Row(
        
         children: _oneRecommendList(recommend2),
       ),
    );
  }

  List<Widget> _oneRecommendList(List<HomePageModelRecommand2> recommend2){
      List<Widget> list = new List();
     for(var i = 0; i < recommend2.length; i++){
       list.add(
          _oneRecommendItem(recommend2[i])
       );
     }
     return list;
  }
  Widget _oneRecommendItem(HomePageModelRecommand2 recommendItem){
      return Expanded(
        child: Container(
         decoration: BoxDecoration(
            border: Border.all(width: 0.5,color: Colors.black12)
         ),
        //  width:ScreenUtil().setWidth(360.0),
         child: InkWell(
           onTap: (){
             print("点击了recommendItem2...");
           },
           child: Row(
             children: <Widget>[
                Expanded(
                  flex: 1,
                  child:AspectRatio(
                     aspectRatio: 0.9,
                     child:_oneRecommendItemLeft(recommendItem),
                  )
                  
                ),
                Expanded(
                  flex: 1,
                  child:AspectRatio(
                     aspectRatio: 0.9,
                     child:_oneRecommendItemRight(recommendItem),
                  )
                )
                // _oneRecommendItemLeft(recommendItem),
                // _oneRecommendItemRight(recommendItem)
             ],
           )
         
         ) 
       ),
      );
      
      
  }
  Widget _oneRecommendItemLeft(HomePageModelRecommand2 recommendItem){
        return Container(
          //  width: ScreenUtil().setWidth(180.0),
           child: Column(
              children: <Widget>[
                Text("${recommendItem.title}"),
                Container(
                  margin: EdgeInsets.only(top: 5.0),
                  child: Text("${recommendItem.desc}",
                  style: TextStyle(color: Colors.black26,fontSize: ScreenUtil().setSp(22.0)), 
                )
               ),
                Container(
                  margin: EdgeInsets.only(top: 38.0),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Container(
                          width: ScreenUtil().setWidth(160.0),
                          height: ScreenUtil().setHeight(30.0),
                          color: Colors.orange,
                          alignment: Alignment.center,
                          child: Text("${recommendItem.redWord}",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: ScreenUtil().setSp(22.0)
                          ),
                          ),
                        ),
                    ),
                )
                
                
              ],
           ),
        );
  } 
  Widget _oneRecommendItemRight(HomePageModelRecommand2 recommendItem){
    bool isSales;
    isSales = recommendItem.sales.length > 0 ? true : false;
    return Container(
      //  width: ScreenUtil().setWidth(180.0),
       child: Column(
          children: <Widget>[
             Image.network(recommendItem.image),
             isSales ? Text("热销${recommendItem.sales}束") : Row(
               children: <Widget>[
                 Text("￥${recommendItem.price}"),
                 Text("￥${recommendItem.linePrice}",
                 style: TextStyle(
                    color: Colors.black26,
                    decoration: TextDecoration.lineThrough
                 ),
                 )
               ],
             )
          ],
       ),
    );

  }
  

  
   //recommend two 组件>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
   Widget _twoRecommend(List<HomePageModelRecommand3> recommend2){
    return Container(
       margin: EdgeInsets.only(top: 15.0),
       child: Row(
         mainAxisAlignment: MainAxisAlignment.spaceAround,
         children: _twoRecommendList(recommend2),
       ),
    );
  }

  List<Widget> _twoRecommendList(List<HomePageModelRecommand3> recommend2){
      List<Widget> list = new List();
     for(var i = 0; i < recommend2.length; i++){
       list.add(
          _twoRecommendItem(recommend2[i])
       );
     }
     return list;
  }
  Widget _twoRecommendItem(HomePageModelRecommand3 recommandItem){
      return Container(
        
         width:ScreenUtil().setWidth(220.0),
        //  height: 160.0,
         child: InkWell(
           onTap: (){
             print("点击了recommendItem2...");
           },
           child: Stack(
                alignment: const FractionalOffset(0, 1),
                children: <Widget>[
                   
                  Image.network(recommandItem.image),
                  Container(
                    width:ScreenUtil().setWidth(220.0),
                    height: ScreenUtil().setHeight(48.0),
                    alignment: Alignment.center,
                    color: Colors.black38,
                    child: Text(recommandItem.title,
                    
                    style:TextStyle(
                      color: Colors.white
                    )
                  ),
                  )
                  
                 
                  
                ],
            ),
         )
         
      );
  }
}

