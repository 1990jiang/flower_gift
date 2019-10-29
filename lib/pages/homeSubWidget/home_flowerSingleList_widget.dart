import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../model/homePage_model_entity.dart';
import 'package:provide/provide.dart';
import '../../provide/homePage_provide.dart';
import '../../routers/application.dart';

class HomeFlowerSingleList extends StatelessWidget {
  final int sectionIndex;
  HomeFlowerSingleList(this.sectionIndex);
  @override
  Widget build(BuildContext context) {
   return Provide<HomePageProvide>(
       
        builder: (context,child,val){
          var sectionData;
          if(sectionIndex == 1){
            sectionData = val.homePageModelEntity.section1;
          }else{
            sectionData = val.homePageModelEntity.section2;
          }   
            return Container(
              color: Color.fromRGBO(240, 240, 245, 1.0),
              child: Column(
                children: <Widget>[
                  _titleWidget(sectionData),
                  SizedBox(height: 10.0,),
                  _listView(sectionData,context),
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
  Widget _listView(HomePageModelSection sectionData,BuildContext context){
     
      return Padding(
        padding: const EdgeInsets.only(left: 5.0,right: 5.0),
        child: Container(
            color:Color.fromRGBO(240, 240, 245, 1.0),
            child:Container(
                color: Colors.white,
                child: Column(
                    children:_listViewLists(sectionData,context)
                ) ,
              ) 
              
            ),
      ); 
      
  }

  List<Widget> _listViewLists(HomePageModelSection sectionData,BuildContext context){
       List<Widget> list = new List();
     for(var i = 0; i < sectionData.xList.length; i++){
       list.add(
          _listItem(sectionData.xList[i],context) 
       ); 
       
     }
     return list;

  }

  Widget _listItem(HomePageModelSectionList sectionListItem,BuildContext context){
     return InkWell(
       onTap: (){
          Application.router.navigateTo(context, "/detailsPage?itemCode=${sectionListItem.productCode}");
       },
     
     child: Container(
        decoration: BoxDecoration(
           border: Border(bottom: BorderSide(width: 0.5,color: Colors.black26))
        ),
        child: Padding(
       padding: const EdgeInsets.only(top: 10.0,bottom: 15.0),
       child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
             SizedBox(width: 10.0,),
             //左边图片
             Container(
               height: MediaQuery.of(context).size.width / 3 + 30.0,
               width: MediaQuery.of(context).size.width / 3 + 10.0,
               child: ClipRRect(
                 borderRadius: BorderRadius.circular(8.0),
                 child: Image.network(sectionListItem.image,fit: BoxFit.cover,),
               ) 
               
             ),
             SizedBox(width: 25.0,),
             //右边文字
             Container(
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: <Widget>[
                    //标题
                    Container(
                        width: MediaQuery.of(context).size.width/2 - 20.0,
                        child: Text(sectionListItem.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                              style:TextStyle(fontSize: ScreenUtil().setSp(40.0),
                              fontWeight: FontWeight.w300,
                            )
                          ),
                    ),
                    
                      SizedBox(height: 10.0,),
                      //详情
                      Container(
                        width: MediaQuery.of(context).size.width/2 - 20.0,
                        child: Text(sectionListItem.detail,
                            maxLines:2,
                            overflow:TextOverflow.ellipsis
                          ),
                      ),
                       SizedBox(height: 10.0,),
                      //评语
                      Container(
                        width: MediaQuery.of(context).size.width/2 - 20.0,
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        decoration: BoxDecoration(
                          //只添加上下边框
                          border: Border(top: BorderSide(width: 0.5,color: Colors.black26),bottom: BorderSide(width: 0.5,color: Colors.black26))
                        ),
                          child: Text(sectionListItem.info,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                      SizedBox(height: 10.0,),
                      //价格：
                      Row(
                          children: <Widget>[
                            Text("￥${sectionListItem.price}",
                            style: TextStyle(color: Colors.orange,fontSize: ScreenUtil().setSp(36.0)),
                            ),
                            SizedBox(width: 10.0,),
                            Text("￥${sectionListItem.linePrice}",
                                    style: TextStyle(
                                        color: Colors.black26,
                                        decoration: TextDecoration.lineThrough
                                    ),
                             ),
                          ],
                       ),
                       SizedBox(height: 10.0,),
                       //销量和购物车
                       Container(
                         width: MediaQuery.of(context).size.width/2,
                         child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("已销售${sectionListItem.salesRank}件",
                                          style: TextStyle(
                                          color: Colors.black26,
                                      ),
                              ),
                              InkWell(
                                onTap: (){
                                  print("点击加入购物车");
                                },
                                child:Icon(Icons.shopping_cart)
                              )
                            ],
                          ),
                       )
                       


                 ],
               ),
             )
          ],
       ),
     ),
  )
  ); 
      
     
    
  }
 //左边图片
  Widget _leftImage(HomePageModelSectionList sectionListItem){
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Container(
            width: 100.0,
            child: Image.network(sectionListItem.image,
            fit: BoxFit.cover,
            
            ),
        ),
    );
    
    
  }
  //右边文字布局
  Widget _rightText(HomePageModelSectionList sectionListItem){
        return Container(
            padding: EdgeInsets.only(left: 30.0,right: 20.0,top: 10.0),
            width: ScreenUtil().setWidth(400.0),
            child: AspectRatio(
              aspectRatio: 0.9,
              child: Column(
               children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    child:Text(sectionListItem.title,
                        textAlign: TextAlign.left,
                        style:TextStyle(fontSize: ScreenUtil().setSp(36.0),
                          fontWeight: FontWeight.w300,
                         )
                      ),
                  ),
                  
                  Container(
                    margin: EdgeInsets.only(top: 15.0),
                    child:  Text(sectionListItem.detail,
                        maxLines:2,
                        overflow:TextOverflow.ellipsis
                      ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10.0),
                    padding: EdgeInsets.only(top: 12.0,bottom: 12.0),
                    decoration: BoxDecoration(
                      //只添加上下边框
                      border: Border(top: BorderSide(width: 0.5,color: Colors.black26),bottom: BorderSide(width: 0.5,color: Colors.black26))
                    ),
                     alignment: Alignment.centerLeft,
                     child: Text(sectionListItem.info,
                       maxLines: 1,
                       overflow: TextOverflow.ellipsis,
                       style: TextStyle(fontWeight: FontWeight.w600),
                     ),
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
            ) 
            
        );
  }

}