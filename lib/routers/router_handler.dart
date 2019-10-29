import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import '../pages/categoryListItem_page.dart';//路由目的界面
import '../pages/details_page.dart';//商品详情页面

//分类列表路由管理
Handler categoryListItemHandler = Handler(
   handlerFunc: (BuildContext context,Map<String,List<String>> params){
      String typeCode = params["typeCode"].first;//传递请求参数
      print("传递的typeCode是: ${typeCode}");
      return CategoryListItem(typeCode);
   }
);

Handler detailsHandler = Handler(
   handlerFunc: (BuildContext context,Map<String,List<String>> params){
      String itemCode = params["itemCode"].first;//传递请求参数
      print("传递的itemCode是: ${itemCode}");
      return DetailsPage(itemCode);
   }
);