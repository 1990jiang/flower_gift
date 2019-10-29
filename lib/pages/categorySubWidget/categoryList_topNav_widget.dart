import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import '../../model/categoryItemList_model_entity.dart';
import '../../provide/categoryListItem_provide.dart';

class CategoryListTopNav extends StatelessWidget {
  
  final GlobalKey<ScaffoldState> scaffoldKey;

  CategoryListTopNav(this.scaffoldKey);
  List<Map<String,String>> orderByList = [
     {
       "name":"综合",
       "orderby":"0"
     },
     {
       "name":"销量",
       "orderby":"4"
     },
     {
       "name":"价格",
       "orderby":"1"//1:是从低到高,2就是从高到低
     },
     {
       "name":"最新",
       "orderby":"3"
     },
     
  ];
  
  List<Map<String,String>> categoryList = [
      {
       "name":"送女友",
       "typeCode":"songnvyou"
     },
     {
       "name":"送男友",
       "typeCode":"songnanyou"
     },
     {
       "name":"送朋友",
       "typeCode":"youqing"
     },
     {
       "name":"送长辈",
       "typeCode":"songzhangbei"
     },
      {
       "name":"筛选",
       "typeCode":""
     },
  ];


  @override
  Widget build(BuildContext context) {
    return Provide<CategoryListItemProvide>(
       builder: (context,child,val){
         return Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _buildOrder(context),
                  _buildCategory(context)
                ],
              ),
          );
       },
    );
    
  }

  //第一排排序
  Widget _buildOrder(BuildContext context){
     return Padding(
       padding: const EdgeInsets.fromLTRB(30.0, 15.0, 30.0, 10.0),
       child: Container(
          child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: _orderList(context)
          ),
       ),
     );
  }
  List<Widget> _orderList(BuildContext context){
       List<Widget> list = new List();
     for(var i = 0; i < orderByList.length; i++){
       list.add(
         Container(
            alignment: Alignment.center,
             width: (MediaQuery.of(context).size.width - 120.0)/4,
             child: Text(
                orderByList[i]["name"]
             ),
          )
       ); 
       
     }
     return list;
   }

  //第二排筛选
  Widget _buildCategory(BuildContext context){
   
    return  Padding(
       padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
       child: Container(
          child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: _categoryList(context)
          ),
       ),
     );
  }
  List<Widget> _categoryList(BuildContext context){
       List<Widget> list = new List();
     for(var i = 0; i < categoryList.length; i++){
       list.add(
          Container(
             alignment: Alignment.center,
             width: (MediaQuery.of(context).size.width - 52.0)/5,
             height: 35.0,
             color: Colors.black12,
             child: InkWell(
                onTap: (){
                   scaffoldKey.currentState.openEndDrawer();
                },
                child:(i == 4) ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                   children: <Widget>[
                        Text(
                          "筛选",
                          
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(20.0)
                          ),
                        ),
                        Icon(Icons.arrow_drop_down)
                   ],
                ) :  Text(
                          categoryList[i]["name"],
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(20.0)
                          ),
                        ),
                
             ) 
             
          )
       ); 
       
     }
     return list;
   }


}



