import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import '../provide/cart_provide.dart';
import './cartSubWidget/cart_bottom.dart';
import './cartSubWidget/cart_item.dart';


class CarShopPage extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("购物车"),
        ),
        body: FutureBuilder(
          future: _getCartInfo(context),
          builder: (context,snapshot){
             if(snapshot.hasData){
                List cartList = Provide.value<CartProvide>(context).cartList;
                return Stack(
                    children: <Widget>[
                        Provide<CartProvide>(
                          builder: (context,child,value){
                              cartList = Provide.value<CartProvide>(context).cartList;
                              return ListView.builder(
                                itemCount: cartList.length,
                                itemBuilder: (context,index){
                                   return CartItem(cartList[index]);
                                },
                              );
                          },
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          child: CartBottom(),
                        )
                    ],
                );
             }else{
                return Text("购物车是空的哦!");
             }
          },
        ),

    );
    
  }
  

  //数据加载(本地获取)
  Future<String> _getCartInfo(BuildContext context) async{
    await Provide.value<CartProvide>(context).getCartInfo();
    return "加载成功";
  }

}