import 'package:flutter/material.dart';
import '../../model/cartInfo_model_entity.dart';
import './cart_count.dart';//加减组件
import 'package:provide/provide.dart';
import '../../provide/cart_provide.dart';

class CartItem extends StatelessWidget {
  final CartInfoModel item;
  CartItem(this.item);


  @override
  Widget build(BuildContext context) {
    return Container(
       margin: EdgeInsets.fromLTRB(5.0, 2.0, 5.0, 2.0),
       padding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
       decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
             bottom: BorderSide(width: 1,color:Colors.black12)
          )
       ),
       child: Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
             _cartCheckBtn(context,item),
             _cartImage(context,item),
             _cartGoodsName(context,item),
             _cartPrice(context,item),
          ],
       ),
    );
  }

  //选择按钮
  Widget _cartCheckBtn(BuildContext context,CartInfoModel item){
     return Container(
       width: MediaQuery.of(context).size.width / 10,
        child: Checkbox(
           value: item.isCheck,
           activeColor: Colors.orangeAccent,
           onChanged: (bool val){
             item.isCheck = val;//改变选中状态了
             Provide.value<CartProvide>(context).changeSelectState(item);
           },
        ), 
     );
  }
  //商品图片
  Widget _cartImage(BuildContext context,CartInfoModel item){
     return Container(
         width: MediaQuery.of(context).size.width / 5,
         padding: EdgeInsets.all(3.0),
         decoration: BoxDecoration(
            border: Border.all(width: 1,color: Colors.black12)
         ),
         child: Image.network(item.images),
     );
  }
  //商品名称
  Widget _cartGoodsName(BuildContext context,CartInfoModel item){
     return Container(
         width: MediaQuery.of(context).size.width / 10 * 4,
         padding: EdgeInsets.all(10.0),
         alignment: Alignment.topLeft,
         child: Column(
            children: <Widget>[
               Text(item.goodsName),
               SizedBox(height: 10.0,),
               CartCount(item)
               
            ],
         ),
     );
  }
  //商品价格
  Widget _cartPrice(BuildContext context,CartInfoModel item){
     return Container(
        width: MediaQuery.of(context).size.width / 10 * 2,
        alignment: Alignment.centerRight,
        child: Column(
           children: <Widget>[
              Text(
                "￥${item.price}",
                style: TextStyle(
                   color: Colors.orangeAccent
                ),
              ),
              SizedBox(height: 15.0,),
              Container(
                 child: InkWell(
                    onTap: (){
                       print("删除商品");
                       Provide.value<CartProvide>(context).deleteSingleGoods(item.goodsId);
                    },
                    child: Icon(
                       Icons.delete_forever,
                       color:Colors.black26,
                       size: 30.0,
                    ),
                 ),
              )
           ],
        ),
     );
  }



}