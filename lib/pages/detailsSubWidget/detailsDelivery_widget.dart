import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import '../../provide/details_provide.dart';
import '../../model/details_model.entity.dart';
import 'package:city_pickers/city_pickers.dart';

class DetailsDelivery extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Provide<DetailsPageProvide>(
        builder: (context,child,val){
           var datas = val.datas;
           return Container(
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  datas.itemSKUs != null ?  _buildFlowers(context,datas) : SizedBox(height: 0.1,),
                   _buildPeisong(context,"送至", "请选择配送地区")
                ],
              ),
            );
        }, 
    );
  }

 Widget _buildFlowers(BuildContext context,DetailsModelDatas datas){
     return Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Container(
            padding: EdgeInsets.only(top: 10.0),
            child: Row(
               children: <Widget>[
                 Expanded(
                    flex: 1,
                    child: Container(
                       alignment: Alignment.centerLeft,
                       padding: EdgeInsets.only(bottom: 8.0),
                       child: Text("已选",
                        style:TextStyle(
                          fontWeight:FontWeight.w600
                        )
                       ),
                    ),
                 ),
                 Expanded(
                    flex: 8,
                    child: Container(
                        padding: EdgeInsets.only(bottom: 8.0),
                        decoration: BoxDecoration(
                           border: Border(
                             bottom: BorderSide(width: 1,color:Colors.black12)
                           ) 
                        ),
                        child: Text(
                          datas.itemName,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                    )
                    
                 ),
                 Expanded(
                    flex: 1,
                    child: Container(
                       alignment: Alignment.centerRight,
                       child: InkWell(
                          onTap: ()=> _onBottomSheet(context,datas),
                          child: Icon(Icons.more_horiz,
                            size: 30.0,
                          ),
                       ),
                    ),
                 )
               ],
            ),  
        ),
     );
  }
 

  //配送
  Widget _buildPeisong(BuildContext context,String title,String des){
     return Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Container(
            padding: EdgeInsets.only(top: 10.0),
            child: Row(
               children: <Widget>[
                 Expanded(
                    flex: 1,
                    child: Container(
                       padding: EdgeInsets.only(bottom: 8.0),
                       alignment: Alignment.centerLeft,
                       child: Text(title,
                        style:TextStyle(
                          fontWeight:FontWeight.w600
                        )
                       ),
                    ),
                 ),
                 Expanded(
                    flex: 8,
                    child: Container(
                        padding: EdgeInsets.only(bottom: 8.0),
                        
                        child: Text(
                          des,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                    )
                    
                 ),
                 Expanded(
                    flex: 1,
                    child: Container(
                       alignment: Alignment.centerRight,
                       child: InkWell(
                          onTap: () async {
                            print("选择配置地址");
                            Result result = await CityPickers.showCityPicker(
                              context: context,
                            );
                            print("选择地址结果是: ${result}");
                          },
                          child: Icon(Icons.more_horiz,
                            size: 30.0,
                          ),
                       ),
                    ),
                 )
               ],
            ),  
        ),
     );
  }


  //商品选择弹出框
  void _onBottomSheet(BuildContext context,DetailsModelDatas datas){
     showModalBottomSheet(
         context: context,
         builder: (context){
            return Stack(
               children: <Widget>[
                   Container(
                      color: Color(0xFF737373),
                      height: MediaQuery.of(context).size.height * 0.55,
                      child: Container(
                        color: Colors.white,
                        child: Column(
                          children: <Widget>[
                              _buildBottomSelectGood(context, datas)
                          ],
                        )
                      ),
                  ),
                   Positioned(
                    bottom: 0,
                    left: 0,
                    child: Container(
                        height: 60.0,
                        child: Row(
                            children: <Widget>[
                                Container(
                                  width: MediaQuery.of(context).size.width/2,
                                  color: Color.fromRGBO(45, 60, 49, 1.0),
                                  alignment: Alignment.center,
                                  child: Text(
                                      "加入购物车",
                                      style:TextStyle(
                                        color:Colors.white,
                                        fontSize: 20.0
                                      )
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width/2,
                                  color: Colors.orangeAccent,
                                  alignment: Alignment.center,
                                  child: Text(
                                      "立即购买",
                                      style:TextStyle(
                                        color:Colors.white,
                                        fontSize: 20.0
                                      )
                                  ),
                                ) 
                            ],
                            
                        ),
                    )
                  )
               ],
            );
            
         }
     );
  }
  //商品选择弹出框UI
  Widget _buildBottomSelectGood(BuildContext context,DetailsModelDatas datas){
      return Container(
                  child:Column(
                    children: <Widget>[
                        _buildGoodsShowTop(context, datas),
                        _buildChangeGoods(context, datas),
                        SizedBox(height: 20.0,),
                        _buildGoodsCount(context),


                    ],
                  )
                  
            );
            
          
      
      
  }
  //头部商品展示
  Widget _buildGoodsShowTop(BuildContext context,DetailsModelDatas datas){
     return Container(
         padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 10.0),
         child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                 Container(
                    width: MediaQuery.of(context).size.width / 4,
                    height: MediaQuery.of(context).size.width / 4,
                    decoration: BoxDecoration(
                       border: Border.all(width: 1,color:Colors.black12),
                       borderRadius: BorderRadius.circular(3.0)
                    ),
                    child: Image.network(datas.coverImages[0]),

                 ),
                 
                 Container(
                    padding: EdgeInsets.only(top: 15.0),
                    width: MediaQuery.of(context).size.width / 2,
                    alignment: Alignment.centerLeft,
                    child:Column(
                       mainAxisAlignment: MainAxisAlignment.start,
                       children: <Widget>[
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text("￥${datas.price}",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.deepOrange
                                ),
                              ),
                          ),
                          
                          SizedBox(height: 3.0,),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text("已选  ${datas.itemName}"),
                          )
                          
                       ],
                    ),
                 ),
                 Container(
                    child: InkWell(
                       onTap: (){
                          print("关闭底部弹窗");
                          Navigator.pop(context);
                       },
                       child: Container(
                           alignment: Alignment.topRight,
                           child: Icon(Icons.close,
                             size: 30.0,
                           ),
                       )
                        
                    ),
                 )

              ],
           ) 
     );
          
  }

  //商品切换选择
  Widget _buildChangeGoods(BuildContext context,DetailsModelDatas datas){
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Container(
           child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                  Container(
                     alignment: Alignment.centerLeft,
                     child: Text("选择"),
                  ),
                  SizedBox(height: 10.0,),
                  Wrap(
                    alignment: WrapAlignment.spaceBetween,
                    spacing: 10.0,
                    runSpacing: 10.0,
                    children: _buildChangeList(context, datas.itemSKUs)
                  )
              ],
           ),
        ),
    );

  }
  //选择列表
  List<Widget> _buildChangeList(BuildContext context,List<DetailsModelDatasItemsku> itemList){
        List<Widget> list = new List();
        for(var i = 0; i < itemList.length; i++){
          list.add(
              Container(
                 
                 width: (MediaQuery.of(context).size.width - 60.0)/4,
                 height: 35.0,
                 color: Colors.black12,
                 alignment: Alignment.center,
                 child: InkWell(
                    onTap: (){},
                    child: Text(itemList[i].optionName),
                 ),
              )
          ); 
          
        }
        return list;

  }



  //商品数量加减
  Widget _buildGoodsCount(BuildContext context){
     return Padding(
       padding: const EdgeInsets.symmetric(horizontal: 15.0),
       child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
               Text("数量"),
               _addOrReduceWidget(context)

            ],
          ),
       ),
     );

  }
  //商品加减小组件
  Widget _addOrReduceWidget(BuildContext context){
      return Container(
         width: MediaQuery.of(context).size.width / 4.2,
         height: 30.0,
         child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
                //减
                Container(
                   width: 24.0,
                   height: 24.0,
                   alignment: Alignment.center,
                   decoration: BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.circular(12.0)
                   ),
                   child: Text("-",
                     style:TextStyle(
                        fontSize: 18.0,
                        color:Colors.white
                     )
                   ),
                ),
                Container(
                   child: Text("1"),
                ),
                Container(
                   width: 24.0,
                   height: 24.0,
                   alignment: Alignment.center,
                   decoration: BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.circular(12.0)
                   ),
                   child: Text("+",
                     style:TextStyle(
                        fontSize: 18.0,
                        color:Colors.white
                     )
                   ),
                ),

            ],
         ),
      );
  }



}