import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import './router_handler.dart';

class Routes{
  static String root = "/";
  static String categoryListItemPage = "/categoryListItem";
  static String detailsPage = "/detailsPage";
  static void configureRoutes(Router router){
    router.notFoundHandler = new Handler(
         //找不到对应界面:
         handlerFunc: (BuildContext context,Map<String,List<String>> params){
             print("ERROR===Route was not found");
          }
    );
    //配置分类列表路由
    router.define(categoryListItemPage,handler:categoryListItemHandler);
    router.define(detailsPage,handler: detailsHandler);
  }
}