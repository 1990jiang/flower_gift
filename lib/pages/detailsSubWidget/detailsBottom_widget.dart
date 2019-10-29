import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import '../../provide/tabBarTap_provide.dart';
import '../../provide/cart_provide.dart';
import '../../provide/details_provide.dart';

class DetailsBottom extends StatelessWidget {
  const DetailsBottom({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var itemW = MediaQuery.of(context).size.width / 6;
    //准备当前商品数据
    var datas = Provide.value<DetailsPageProvide>(context).datas;
    var goodsId = datas.itemCode;
    var goodsName = datas.itemName;
    var count = 1;
    var price = datas.price.toDouble();
    var images = datas.coverImages[0];


    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      height: 60.0,
      child: Row(
          children: <Widget>[
             //客服
             InkWell(
               onTap: (){
                 print("点击了客服");
               },
               child: Container(
                      width: itemW,
                      decoration: BoxDecoration(
                        border: Border(
                            right: BorderSide(width: 1,color: Colors.black38)
                        )
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.phone_iphone,
                            color: Colors.black45,
                            size: 30.0,
                          ),
                          Text("客服")
                        ],
                      ),
                  ),
             ),
            Stack(
               children: <Widget>[
                     InkWell(
                      onTap: (){
                        //改变tab的选中index来控制底部tab的切换
                        Provide.value<TabBarTapProvide>(context).bottomTabBarTap(3);
                        //pop出当前页面
                        Navigator.pop(context);
                      },
                      child:Container(
                          width: itemW,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.shopping_cart,
                                size: 30.0,
                                color: Colors.black45,
                              ),
                              Text("购物车")
                            ],
                          ),
                      ),
                  ),
                  Provide<CartProvide>(
                     builder: (contex,child,val){
                         int goodsCount = Provide.value<CartProvide>(context).allGoodsCount;
                         return Positioned(
                             top: 0,
                             right: 10.0,
                             child: Container(
                                padding: EdgeInsets.fromLTRB(6, 3, 6, 3),
                                decoration: BoxDecoration(
                                   color: Colors.orangeAccent,
                                   border: Border.all(width: 2,color: Colors.white),
                                   borderRadius: BorderRadius.circular(12.0)
                                ),
                                child: Text("$goodsCount",
                                       style: TextStyle(
                                          color: Colors.white
                                       ),
                                ),
                             ),
                         );
                     },
                  )
               ],
            ),
            
             
             InkWell(
                 onTap: () async{
                    print("点击加入购物车");
                    await Provide.value<CartProvide>(context).saveGoods(goodsId, goodsName, count, price, images);
                 },
                 child: Container(
                    width: 2*itemW,
                    color: Color.fromRGBO(45, 60, 49, 1.0),
                    alignment: Alignment.center,
                    child: Text(
                        "加入购物车",
                        style:TextStyle(
                          color:Colors.white
                        )
                    ),
                  ),
             ),
             
             Container(
               width: 2*itemW,
               color: Colors.orangeAccent,
               alignment: Alignment.center,
               child: Text(
                  "立即购买",
                  style:TextStyle(
                    color:Colors.white
                  )
               ),
             )
          ],
      ),
    );
  }
}