import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/cartInfo_model_entity.dart';

//购物车简单逻辑:
/*
 * 因为我们这边购物车就不去和后台交互了，这样比较简单，我们就采用这个本地存储数据
 * 的方式来做。
 * 大概思路也就是在加入购物车的时候将商品的几个关键数据，先做成数据字典，然后加入到
 * 购物车List中，最后将这个List转化为String存储，取出的时候，先将String转为List来进行操作
 * 
 */

final cartInfoKey = "cartInfo";

class CartProvide with ChangeNotifier{
    String cartString = "[]";
    List<CartInfoModel> cartList = [];
    double allPrice = 0;//总价格
    int allGoodsCount = 0;//商品总数量
    bool isAllSelect = true;//是否全选
    
    //存储商品
    saveGoods(goodsId,goodsName,count,price,images) async{
       SharedPreferences prefs = await SharedPreferences.getInstance();
       //首先获取数据库中的数据(String 类型)
       cartString = prefs.getString(cartInfoKey);
       //类型转换
       var temp = cartString==null?[]:json.decode(cartString.toString());
       List<Map> tempList = (temp as List).cast();

       //加入购物车，判断购物车是否已有当前商品，有count++,没有就添加整个商品
       bool isExist = false;//是否存在
       int ival = 0;//临时索引
       allPrice = 0;
       allGoodsCount = 0;
       tempList.forEach((item){
           if(item["goodsId"] == goodsId){
             //已经存在
             tempList[ival]["count"] = item["count"]+1;
             cartList[ival].count++;//数据模型++
             isExist = true;
           }
           //判断商品否是选中状态
           if(item["isCheck"]){
             //商品数量和商品总价格计算
             allPrice += (cartList[ival].price * cartList[ival].count);
             allGoodsCount += cartList[ival].count;
           }

       });
       //如果商品不存在
       if(!isExist){
          Map<String,dynamic> newGoods = {
               "goodsId":goodsId,
               "goodsName":goodsName,
               "count":count,
               "price":price,
               "images":images,
               "isCheck":true//默认加入购物车是选中的
          };
          tempList.add(newGoods);
          cartList.add(
             CartInfoModel.fromJson(newGoods)
          );
          allPrice += count * price;
          allGoodsCount += count;

       }
       //持久化
       cartString = json.encode(tempList).toString();//List=>String
       print("购物车数据是:$cartString");
       prefs.setString(cartInfoKey, cartString);
       notifyListeners();
       

    }

    
    //清空购物车
    removeCart() async{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.remove(cartInfoKey);
      print("购物车已经清空");
      notifyListeners();
    }

    //查询购物车
    getCartInfo() async {
       SharedPreferences prefs = await SharedPreferences.getInstance();
       cartString = prefs.getString(cartInfoKey);
       cartList = [];
       if(cartString == null){
          cartList = [];
       }else{
           List<Map> tempList = (json.decode(cartString.toString()) as List).cast();
           allPrice = 0;
           allGoodsCount = 0;
           isAllSelect = true;
           tempList.forEach((item){
                if(item["isCheck"]){
                   allPrice += (item["count"] * item["price"]);
                   allGoodsCount += item["count"];
                }else{
                   isAllSelect = false;
                }
                cartList.add(CartInfoModel.fromJson(item));
           });
       }
       notifyListeners();

    }


    //删除购物车商品
    deleteSingleGoods(String goodsId) async{
        SharedPreferences prefs = await SharedPreferences.getInstance();
        cartString = prefs.getString(cartInfoKey);
        List<Map> tempList = (json.decode(cartString.toString()) as List).cast();
        int tempIndex = 0;
        int delIndex = 0;
        //这个遍历只是获取这个要删除商品的索引，因为dart在循环中不能取修改List的内容
        tempList.forEach((item){
            if(item["goodsId"] == goodsId){
                delIndex = tempIndex;
            }
            tempIndex++;
        });
        tempList.removeAt(delIndex);
        cartString = json.encode(tempList).toString();
        prefs.setString(cartInfoKey, cartString);
        //重新获取购物车数据，刷新购物车界面
        await getCartInfo();

    }

   //改变单个商品的选中状态
   changeSelectState(CartInfoModel cartItem) async{
       SharedPreferences prefs = await SharedPreferences.getInstance();
       cartString = prefs.getString(cartInfoKey);
       List<Map> tempList = (json.decode(cartString.toString()) as List).cast();
       int tempIndex = 0;
       int changeIndex = 0;
       tempList.forEach((item){
              if(item["goodsId"] == cartItem.goodsId){
                  changeIndex = tempIndex;
              }
              tempIndex++;
       });
       //这里没有进行属性改变，是因为在点击勾选按钮的时候，已经对cartItem中的isCheck属性进行了改变
       tempList[changeIndex] = cartItem.toJson();
       cartString = json.encode(tempList).toString();
       prefs.setString(cartInfoKey, cartString);
       await getCartInfo();
   }


  //全选按钮操作
  changeAllCheckBtnState(bool isSelect) async{
        SharedPreferences prefs = await SharedPreferences.getInstance();
        cartString = prefs.getString(cartInfoKey);
        List<Map> tempList = (json.decode(cartString.toString()) as List).cast();
        List<Map> newList = [];
        for(var item in tempList){
           var newItem = item;
           newItem["isCheck"] = isSelect;
           newList.add(newItem);
        }
        cartString = json.encode(newList).toString();
        prefs.setString(cartInfoKey, cartString);
        await getCartInfo();

  }

  //商品数量加减
  addOrReduceAction(CartInfoModel cartItem,String todo) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      cartString = prefs.getString(cartInfoKey);
      List<Map> tempList = (json.decode(cartString.toString()) as List).cast();
      int tempIndex = 0;
      int changeIndex = 0;
      tempList.forEach((item){
          if(item["goodsId"] == cartItem.goodsId){
               changeIndex = tempIndex;
          }
          tempIndex++;
      });
      if(todo == "add"){
          cartItem.count++;
      }else if(cartItem.count > 1){
          cartItem.count--;
      }
      tempList[changeIndex] = cartItem.toJson();
      cartString = json.encode(tempList).toString();
      prefs.setString(cartInfoKey, cartString);
      await getCartInfo();
  }


}