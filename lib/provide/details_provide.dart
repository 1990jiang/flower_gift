import '../model/details_model.entity.dart';
import "package:flutter/material.dart";
import 'package:flutter/widgets.dart';
import '../service/service_http_method.dart';
import 'dart:convert';

class DetailsPageProvide with ChangeNotifier {
   DetailsModelDatas datas;
   //分类界面数据获取
  getDetailsPageData(String itemCode)async{
   var formData = {
      "itemCode":itemCode
   };
     await requestPost("itemDetails",formData: formData).then((val){
         var responseData = json.decode(val.toString());
         DetailsModelEntity entity = DetailsModelEntity.fromJson(responseData);
         datas = entity.datas;
     });
      notifyListeners();
  }


}