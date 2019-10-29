import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import '../../provide/details_provide.dart';
import '../../model/details_model.entity.dart';

class DetailsTitle extends StatelessWidget {
    

  @override
  Widget build(BuildContext context) {
    return Provide<DetailsPageProvide>(
          builder: (context,child,val){
             var datas = val.datas;
             return Container(
               
               decoration: BoxDecoration(
                 color: Colors.white,
                  border: Border(
                     top: BorderSide(width: 1,color: Colors.black12),
                     bottom: BorderSide(width: 1,color:Colors.black12)
                  )
               ), 
               child: Padding(
                    padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                    child: Container(
                        child: Column(
                          children: <Widget>[
                            _buildTitle(datas.itemName,datas.introduction),
                            SizedBox(height: 15.0,),
                            _buildPrice(datas),

                          ],
                        ),
                    ), 
                  ),
             );
             
          },
    );
    
  }

  //标题
  Widget _buildTitle(String name,String introduction){
     return Container(
         
         child: Row(
            children: <Widget>[
               Expanded(
                 flex: 8,
                 child: Container(
                    child: Text(
                       "${name}--${introduction}",
                       maxLines: 1,
                       overflow: TextOverflow.ellipsis,
                    ),
                 ),
               ),
               Expanded(
                 flex: 2,
                 child: Container(
                    alignment: Alignment.centerRight,
                    child:Icon(Icons.star_border),
                 )
                 
               )
            ],
         ),
     );
  }
  //价格
  Widget _buildPrice(DetailsModelDatas datas){
     return Container(
       child: Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: <Widget>[
            Row(
              children: <Widget>[
                 Text(
                   "￥${datas.price}",
                   style: TextStyle(
                      color:Colors.orangeAccent,
                      fontSize: 24.0
                   ), 
                 ),
                 SizedBox(width: 5.0,),
                 Text(
                   "￥${datas.linePrice}",
                   style: TextStyle(
                     color: Colors.black26,
                     decoration: TextDecoration.lineThrough
                   ),
                 )
              ],
            ),
            Container(
               alignment: Alignment.centerRight,
               child: Text(datas.sale),
            )

         ],
       ), 
     );
  }
}