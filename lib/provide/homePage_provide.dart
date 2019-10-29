import 'package:flower_gift/model/homePage_model_entity.dart';
import "package:flutter/material.dart";
import 'package:flutter/widgets.dart';
import '../service/service_http_method.dart';
import 'dart:convert';

class HomePageProvide with ChangeNotifier {
  HomePageModelEntity homePageModelEntity;
 
  //后台获取数据
  getHomePageData() async{
   await requestGet("shouye").then((val){
       var responseData = json.decode(val.toString());
       homePageModelEntity = HomePageModelEntity.fromJson(responseData);
       notifyListeners();
    });
  }




}