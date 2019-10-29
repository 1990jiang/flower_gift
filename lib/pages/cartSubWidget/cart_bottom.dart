import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import '../../provide/cart_provide.dart';

final double cartBottomFontS = 20.0;

class CartBottom extends StatelessWidget {
  const CartBottom({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
       padding: EdgeInsets.all(5.0),
       color: Colors.black12.withAlpha(15),
       child: Provide<CartProvide>(
          builder: (context,child,val){
             return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    _selectAll(context),
                    _allPriceArea(context),
                    _goButton(context),
                  ],
              );
          },
       ) 
       
    );
  }

  //全选按钮
  Widget _selectAll(BuildContext context){
     return  Container(
          width:(MediaQuery.of(context).size.width - 10)/10 * 3,
          child: Row(
            children: <Widget>[
              Checkbox(
                  value: Provide.value<CartProvide>(context).isAllSelect,
                  activeColor: Colors.orangeAccent,
                  onChanged: (bool val){
                     print("点击了全选按钮");
                     Provide.value<CartProvide>(context).changeAllCheckBtnState(val);
                  },
                  
              ),
              Text("全选",
               style: TextStyle(
                  fontSize: cartBottomFontS
               ),
              )
            ],
          ),
      
     ); 
      
  }

  //合计区域
  Widget _allPriceArea(BuildContext context){
     double allPrice = Provide.value<CartProvide>(context).allPrice;
     return Container(
        width:(MediaQuery.of(context).size.width - 10)/10 * 4,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                 Container(
                    alignment: Alignment.centerRight,
                    
                    child: Text("合计:",
                          style: TextStyle(
                          fontSize: cartBottomFontS
                      ),
                    ),
                 ),
                 Container(
                    alignment: Alignment.centerLeft,
                    
                    child: Text(
                       "￥${allPrice}",
                       style:TextStyle(
                          color:Colors.orangeAccent,
                          fontSize: cartBottomFontS,
                       )
                    ),
                 )
              ],
            ),
            // Container(
               
            //    alignment: Alignment.centerRight,
            //    child: Text(
            //       "满10元免配送费,预购免配送费"
            //    ),
            // )
          ],
        ), 
     
    );
  }
  
  //结算
  Widget _goButton(BuildContext context){
     int allGoodsCount = Provide.value<CartProvide>(context).allGoodsCount;
     return Container(
        width:(MediaQuery.of(context).size.width - 10)/10 *3,
        height: 40.0,
        padding: EdgeInsets.only(left: 10.0),
        child: InkWell(
          onTap: (){},
          child: Container(
            padding: EdgeInsets.all(10.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
               color:Colors.orangeAccent,
               borderRadius: BorderRadius.circular(5.0)
            ),
            child: Text(
              "结算(${allGoodsCount})",
              style:TextStyle(
                 color:Colors.white,
                 fontSize: 15.0,
              )
            ),
          ),
       ),
      
     );
  }

 

}