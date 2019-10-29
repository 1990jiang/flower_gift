import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import '../../provide/cart_provide.dart';
import '../../model/cartInfo_model_entity.dart';

class CartCount extends StatelessWidget {
  CartInfoModel item;
  CartCount(this.item);
 

  @override
  Widget build(BuildContext context) {
    var cWidth = (MediaQuery.of(context).size.width) / 10 * 4 * 0.7;
    return Provide<CartProvide>(
        builder: (context,child,val){
            return Container(
              width: cWidth,
              margin: EdgeInsets.only(top: 5.0),
              decoration: BoxDecoration(
                  border: Border.all(width: 1,color: Colors.black12)
              ),
              child: Row(
                  children: <Widget>[
                    _reduceBtn(context,cWidth,item),
                    _countArea(context,cWidth,item),
                    _addBtn(context,cWidth,item)
                  ],
              ),
            );
        },
    ); 
    
  }

  //减少按钮
  Widget _reduceBtn(BuildContext context,cWidth,CartInfoModel cartItem){
     return InkWell(
        onTap: (){
          print("点击了减少按钮");
          Provide.value<CartProvide>(context).addOrReduceAction(cartItem, "reduce");
        },
        child: Container(
           width: cWidth / 4 +4,
           height: cWidth / 4 * 0.8,
           alignment: Alignment.center,
           decoration: BoxDecoration(
              color: item.count>1 ? Colors.white : Colors.black12,
              border: Border(
                 right: BorderSide(width: 1,color:Colors.black12)
              )
           ),
           child: Text("-"),
        ),

     );
  }

  //中间数字
  Widget _countArea(BuildContext context,cWidth,CartInfoModel cartItem){
    return Container(
       width: cWidth / 4 * 2 -10.0,
           height: cWidth / 4 * 0.8,
        alignment: Alignment.center,
        color: Colors.white,
        child: Text("${cartItem.count}"),
    );
  }


  //增加按钮
  Widget _addBtn(BuildContext context,cWidth,CartInfoModel cartItem){
     return InkWell(
        onTap: (){
          print("点击了加好按钮");
          Provide.value<CartProvide>(context).addOrReduceAction(cartItem, "add");
        },
        child: Container(
           width: cWidth / 4+4,
           height: cWidth / 4 * 0.8,
           alignment: Alignment.center,
           decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                 left: BorderSide(width: 1,color:Colors.black12)
              )
           ),
           child: Text("+"),
        ),

     );
  }

}