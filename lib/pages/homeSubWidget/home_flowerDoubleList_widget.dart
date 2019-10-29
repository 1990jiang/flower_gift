import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../model/homePage_model_entity.dart';
import 'package:provide/provide.dart';
import '../../provide/homePage_provide.dart';

class HomeFlowerDoubleList extends StatelessWidget {
  final int sectionIndex;
  HomeFlowerDoubleList(this.sectionIndex);

  @override
  Widget build(BuildContext context) {
    return Provide<HomePageProvide>(
       
        builder: (context,child,val){
          var sectionData;
          if(sectionIndex == 3){
            sectionData = val.homePageModelEntity.section3;
          }else if(sectionIndex == 4){
            sectionData = val.homePageModelEntity.section4;
          }else if(sectionIndex == 5){
            sectionData = val.homePageModelEntity.section5;
          }else{
            sectionData = val.homePageModelEntity.section6;
          }   
            return Container(
              color: Color.fromRGBO(240, 240, 245, 1.0),
              child: Column(
                children: <Widget>[
                  _titleWidget(sectionData),
                  _listView(sectionData),
                  _moreBtnWidget(sectionData)
                ],
              )
            );
      }
    );
  }

  //标题
  Widget _titleWidget(HomePageModelSection sectionData){
      
      return Container(
         color:Colors.white,
         margin: EdgeInsets.only(top: 10.0),
         height: ScreenUtil().setHeight(80.0),
         alignment: Alignment.center,
         child: Text(
            sectionData.title,
            style: TextStyle(
              fontSize: ScreenUtil().setSp(30.0),
              fontWeight: FontWeight.w600
            ),
         ),
      );
  }

 //查看更多按钮
 Widget _moreBtnWidget(HomePageModelSection sectionData){
     return Container(
         color:Colors.white,
         margin: EdgeInsets.only(top: 10.0),
         height: ScreenUtil().setHeight(100.0),
         alignment: Alignment.center,
         child: RaisedButton(
           onPressed: (){
             print("查看更多...");
           },
           child: Text("查看更多"),
         )
      );
 }

  //listView
  Widget _listView(HomePageModelSection sectionData){
     
      return Container(
         color:Color.fromRGBO(240, 240, 245, 1.0),
         
         child: Wrap(
            children:_listViewLists(sectionData)
         )
      );
  }

  List<Widget> _listViewLists(HomePageModelSection sectionData){
       List<Widget> list = new List();
     for(var i = 0; i < sectionData.xList.length; i++){
       list.add(
          _listItem(sectionData.xList[i]) 
       ); 
       
     }
     return list;

  }

  Widget _listItem(HomePageModelSectionList sectionListItem){
     return InkWell(
        onTap: (){
          print("点击了列表Item");
        },
        
          child: Container(
              color: Colors.white,
              padding: EdgeInsets.all(10.0),
              margin: EdgeInsets.only(top: 5.0),
              height: ScreenUtil().setHeight(600.0),
              child: Column(
                  children: <Widget>[
                    _topImage(sectionListItem),
                    Stack(
                       alignment: const FractionalOffset(1, 1),
                       children: <Widget>[
                           _bottomText(sectionListItem),
                           InkWell(
                             onTap: (){
                               print("点击加入购物车");
                             },
                            child:Icon(Icons.shopping_cart)
                           )
                       ],
                    )
                    
                  ],
              ),
          )
         
     );
  }
 //左边图片
  Widget _topImage(HomePageModelSectionList sectionListItem){
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Container(
            width: ScreenUtil().setWidth(330),
            child: Image.network(sectionListItem.image,
            fit: BoxFit.fitWidth,
            width: ScreenUtil().setWidth(330),
            ),
        ),
    );
    
    
  }
  //右边文字布局
  Widget _bottomText(HomePageModelSectionList sectionListItem){
         bool isShowLabel;
         isShowLabel = sectionListItem.label.length > 0 ? true : false;
        return Container(
           // padding: EdgeInsets.only(left: 30.0,right: 20.0,top: 10.0),
            width: ScreenUtil().setWidth(330.0),
            child: Column(
               children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 5.0),
                    alignment: Alignment.centerLeft,
                    child:Text(sectionListItem.detail,
                        textAlign: TextAlign.left,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style:TextStyle(fontSize: ScreenUtil().setSp(28.0),
                          fontWeight: FontWeight.w300,
                         )
                      ),
                  ),
                  //是否显示小标签
                  isShowLabel ? ClipRRect(
                     borderRadius: BorderRadius.circular(20.0),
                     child: Container(
                          padding: EdgeInsets.all(5.0),
                          alignment: Alignment.center,
                          width: ScreenUtil().setWidth(160.0),
                          height: ScreenUtil().setHeight(50.0),
                          margin: EdgeInsets.only(top: 10.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.orange,width: 1.0)
                          ),
                          child: Text(sectionListItem.label.first,
                           style: TextStyle(color: Colors.orange,fontSize: ScreenUtil().setSp(22.0)),
                          ),
                      ) ,
                    )
                  : Container(
                     height: ScreenUtil().setHeight(5.0),
                     color: Colors.white,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10.0),
                    child: Row(
                      children: <Widget>[
                        Text("￥${sectionListItem.price}",
                         style: TextStyle(color: Colors.orange,fontSize: ScreenUtil().setSp(35.0)),
                        ),
                        Container(
                           margin: EdgeInsets.only(left: 10.0),
                           child:  Text("￥${sectionListItem.linePrice}",
                                style: TextStyle(
                                    color: Colors.black26,
                                    decoration: TextDecoration.lineThrough
                                ),
                            ) ,
                        ),
                        
                      ],
                    ),
                  ),
                  
                   Container(
                     alignment: Alignment.centerLeft,
                     margin: EdgeInsets.only(top: 10.0),
                     child: Text("已销售${sectionListItem.salesRank}件",
                        style: TextStyle(
                          color: Colors.black12,
                          fontSize: ScreenUtil().setSp(22.0)
                        ),
                      ),
                   )  
                  

               ],
            ),
        );
  }

}