import '../model/categoryPage_model_entity.dart';
import "package:flutter/material.dart";
import 'package:flutter/widgets.dart';
import '../service/service_http_method.dart';
import 'dart:convert';

class CategoryPageProvide with ChangeNotifier {
  
  CategoryModelEntity categoryModelEntity;
  int currentIndex = 0;//当前点击的大分类



  //分类界面数据获取
  getCategoryPageData()async{
     await requestPost("classesIndex").then((val){
         var responseData = json.decode(val.toString());
         categoryModelEntity = CategoryModelEntity.fromJson(responseData);
     });
      notifyListeners();
  }

  //点击切换分类了:
  switchCategory(int index){
     currentIndex = index;
     notifyListeners();
  }


}