import '../model/categoryItemList_model_entity.dart';
import "package:flutter/material.dart";
import 'package:flutter/widgets.dart';
import '../service/service_http_method.dart';
import 'dart:convert';


class CategoryListItemProvide with ChangeNotifier {
  
  ItemListModelEntity itemListModelEntity;
  String pageTitle;
  String typeCode = "aiqing";
  String currentText = "筛选";
  int pageIndex = 1;
  int orderby = 0;
  
 //分类界面数据获取
  getCategoryListItemData({String typeCode = "aiqing",int pageIndex = 1,int orderby = 0})async{
     var formData = {
         "pageIndex":pageIndex,
         "orderby":orderby,
         "typeCode":typeCode
     };
     await requestPost("itemList",formData: formData).then((val){
         var responseData = json.decode(val.toString());
         itemListModelEntity = ItemListModelEntity.fromJson(responseData);
         pageTitle = itemListModelEntity.datas.pageTitle;
     });
      notifyListeners();
  }

  //更改typeCode
  changeText(String currentText){
      currentText = currentText;
      
  }



}