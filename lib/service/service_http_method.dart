import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:io';
import '../config/service_url_config.dart';

//抽取公共的网络请求方法

Future requestGet(url,{formData}) async{
  try{
     print("开始获取网络数据...");
     Response response;
     Dio dio = new Dio();
     dio.options.responseType = ResponseType.plain;//不整这个就会报Unexpected character错误
     dio.options.contentType = ContentType.parse("application/x-www-form-urlencoded");
     if(formData == null){
       //无参
       response = await dio.post(requestUrl[url]);
     }else{
       response = await dio.post(requestUrl[url],data:formData);
     }
     if(response.statusCode == 200){
        return response.data;
      }else{
        throw Exception("<<<<<<请求失败,检查接口或者参数>>>>>>");
      }

  }catch(e){
     return print("HTTPERROR: ============> ${e}");
  }
}

//Post
Future requestPost(url,{formData}) async{
  try{
     print("开始获取网络数据...");
     Response response;
     Dio dio = new Dio();
     dio.options.responseType = ResponseType.plain;//不整这个就会报Unexpected character错误
     dio.options.contentType = ContentType.parse("application/x-www-form-urlencoded");
     if(formData == null){
       //无参
       response = await dio.post(requestUrl[url]);
     }else{
       response = await dio.post(requestUrl[url],data:formData);
     }
     if(response.statusCode == 200){
        return response.data;
      }else{
        throw Exception("<<<<<<请求失败,检查接口或者参数>>>>>>");
      }

  }catch(e){
     return print("HTTPERROR: ============> ${e}");
  }
}