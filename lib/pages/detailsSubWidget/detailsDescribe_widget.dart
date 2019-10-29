import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import '../../provide/details_provide.dart';
import '../../model/details_model.entity.dart';

class DetailsDescribe extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Provide<DetailsPageProvide>(
        builder: (context,child,val){
           var datas = val.datas;
           return Container(
              color: Colors.white,
              child: Column(
                children: <Widget>[
                    _buildFlowers(datas),
                    _buildMaterial(datas),
                    _buildExpansionpanel(datas)
                    

                ],
              ),
            );
        }, 
    );
    
  }
  
  //花语
  Widget _buildFlowers(DetailsModelDatas datas){
     return Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Container(
            padding: EdgeInsets.only(top: 10.0),
            child: Row(
               children: <Widget>[
                 Expanded(
                    flex: 1,
                    child: Container(
                       alignment: Alignment.topLeft,
                       child: Text("花语",
                        style:TextStyle(
                          fontWeight:FontWeight.w600
                        )
                       ),
                    ),
                 ),
                 Expanded(
                    flex: 9,
                    child: Container(
                        padding: EdgeInsets.only(bottom: 8.0),
                        decoration: BoxDecoration(
                           border: Border(
                             bottom: BorderSide(width: 1,color:Colors.black12)
                           ) 
                        ),
                        child: Text(
                          datas.huaYu,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                    )
                    
                 )
               ],
            ),  
        ),
     );
  }
  
  //材料
  Widget _buildMaterial(DetailsModelDatas datas){
     return Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Container(
            padding: EdgeInsets.only(top: 10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
               children: <Widget>[
                 Expanded(
                    flex: 1,
                    child: Container(
                       padding: EdgeInsets.only(bottom: 8.0),
                       alignment: Alignment.topLeft,
                       child: Text("材料",
                        style:TextStyle(
                          fontWeight:FontWeight.w600
                        )
                       ),
                    ),
                 ),
                 Expanded(
                    flex: 9,
                    child: Container(
                        padding: EdgeInsets.only(bottom: 8.0),
                        decoration: BoxDecoration(
                           border: Border(
                             bottom: BorderSide(width: 1,color:Colors.black12)
                           ) 
                        ),
                        child: Text(
                          datas.stuff,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                    )
                    
                 )
               ],
            ),  
        ),
     );
  }
  //配送
  Widget _buildExpansionpanel(DetailsModelDatas datas){
     return Padding(
        padding: EdgeInsets.symmetric(horizontal: 0.0),
        child: Container(
          
           child: Container(
                  margin: EdgeInsets.all(0.0),
                  padding: EdgeInsets.all(0.0),
                  child: ExpansionTile(
                  title: ListTile(
                    contentPadding: EdgeInsets.all(0),
                    leading: Text("配送",
                          style:TextStyle(
                              fontSize: 14.0,
                              fontWeight:FontWeight.w600
                            )
                    ),
                    title: Text(
                              datas.deliveryArea,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style:TextStyle(
                                fontSize: 14.0,
                              
                              )
                            ),
                  ),
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.only(bottom: 10.0),
                        child: Text(datas.deliveryArea),
                    )
                  ],
              ),
           )
           
        )
     );

  }


  



}