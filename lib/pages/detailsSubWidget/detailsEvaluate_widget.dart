import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import '../../provide/details_provide.dart';
import '../../model/details_model.entity.dart';

class DetailsEvaluate extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Provide<DetailsPageProvide>(
        builder: (context,child,val){
           var datas = val.datas;
           return Container(
              color: Colors.white,
              child: 
               //判断是否有评价
                datas.comments != null ?
                  Column(
                    children: <Widget>[
                        _buildTopTitle(context, datas),
                        _buildEvaluates(context, datas.comments.itemComments),
                        SizedBox(height: 10.0,),
                        Container(
                           alignment: Alignment.center,
                           child: RaisedButton(
                              padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                              onPressed: (){},
                              child: Text("查看更多评价"),
                           ),
                        )
                        

                    ],
                ):Container(
                   child: Center(
                      child: Text("暂无评价"),
                   ),
                )
           );
        },
    );
  }

  //顶部评价
  Widget _buildTopTitle(BuildContext context,DetailsModelDatas datas){
      return Padding(
        padding: EdgeInsets.all(10.0),
        child: Container(
           child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                 Container(
                    child: Text("订单评价",
                        style:TextStyle(
                           fontSize: 20.0,
                           fontWeight: FontWeight.w600
                        )
                    ),
                 ),
                 Container(
                    child: Text(
                      "最近已有${datas.comments.commentCount}条评价>"
                    ),
                 )
              ],
           ),
        ),
      );
  }

  //评价列表
  Widget _buildEvaluates(BuildContext context,List<DetailsModelDatasCommantsItemcommants> itemComments){
       return Container(
           child: Column(
              children: _buildEvaluateList(context, itemComments),
           ),
       );

  }
  List<Widget> _buildEvaluateList(BuildContext context,List<DetailsModelDatasCommantsItemcommants> itemComments){
        List<Widget> list = new List();
        for(var i = 0; i < itemComments.length; i++){
          list.add(
              _buildEvaluateItem(context, itemComments[i])
          ); 
          
        }
        return list;

  }
  //评价项
  Widget _buildEvaluateItem(BuildContext context,DetailsModelDatasCommantsItemcommants commant){
      return Container(
         padding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 10.0),
         decoration: BoxDecoration(
            border: Border(
               top: BorderSide(width: 1,color: Colors.black12)
            )
         ),
         child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
                 Container(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                           Row(
                              children: <Widget>[
                                 Container(
                                    width: 30.0,
                                    height: 30.0,
                                    
                                    child: ClipOval(
                                      child: Image.network(commant.userHeadImg),
                                    ),
                                    
                                 ),
                                 SizedBox(width: 3.0,),
                                 Text(commant.nickName)
                              ],
                           ),
                           Container(
                              child: _buildStars(context,commant.commentGrade),
                           )
                        ],
                    ),
                 ),
                 SizedBox(height: 10.0,),
                 //评价语
                 Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    
                    alignment: Alignment.centerLeft,
                    child: Text(
                       commant.commentContent
                    ),
                 ),
                 SizedBox(height: 10.0,),
                 //评价图片
               commant.commentImgs != null ?  Container(
                    alignment: Alignment.centerLeft,
                    width: 150.0,
                    child: Image.network(commant.commentImgs[0],
                      fit: BoxFit.fitWidth,
                    ),
                 ): SizedBox(height: 2.0,),
                 SizedBox(height: 8.0,),
                 //地址
                 Container(
                    child: Row(
                       children: <Widget>[
                          Container(
                             child: Icon(Icons.place,
                               size: 24.0,
                               color: Colors.black45,
                             ),
                          ),
                          Container(
                             child: Text(commant.commentAddress,
                               
                             ),
                          )
                       ],
                    ),
                 )
            ],
         ),
      );
  }

 Widget _buildStars(BuildContext context,int commentGrade){
    List<Widget> lists = List();
    for(var i = 0; i < commentGrade; i++){
       lists.add(
          Container(
             child: Row(
               children: <Widget>[
                  Icon(Icons.star,
                      color: Colors.orangeAccent,
                      size: 20.0,
                      ),
                  SizedBox(width: 2.0,),
               ],
             ),
          )
          
       );
    }
   
    return Container(
        child: Row(
           children: lists
        ),
    );
 }

}