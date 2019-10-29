import 'package:flutter/material.dart';

class MinePage extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.black12.withAlpha(35),
       body: Stack(
          children: <Widget>[
             ListView(
                children: <Widget>[
                  _buildTopWidget(context),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.16,),
                  _buildCategory(context),
                  SizedBox(height: 10.0,),
                  _buildSetting(context)

                ],
             ),
             //我的订单部分
                Positioned(
                   top: MediaQuery.of(context).size.height*0.26,
                   child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10.0),
                      width: MediaQuery.of(context).size.width - 20.0,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0)
                      ),
                      child: _buildMyOrder(context),
                   ),
                )
          ],
          
       )
       
       
    );
  }

  //顶部登录注册
  Widget _buildTopWidget(BuildContext context){
     return Container(
        child: Stack(
            children: <Widget>[
                Container(
                    child: Stack(
                       children: <Widget>[
                           Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height*0.23,
                              child: Image.asset("assets/topBg.png",
                                fit: BoxFit.fitWidth,
                              ),
                           ),
                           Positioned(
                              top: MediaQuery.of(context).size.height*0.23 * 0.3,
                              left: MediaQuery.of(context).size.width*0.35,
                              child: Column(
                                 children: <Widget>[
                                   Text("欢迎来到花礼网",
                                      style:TextStyle(
                                         color:Colors.white
                                      )
                                   ),
                                   SizedBox(height: 5.0,),
                                   InkWell(
                                     onTap: (){},
                                     child: Container(
                                       alignment: Alignment.center,
                                       width: MediaQuery.of(context).size.width*0.3,
                                       height: 35.0,
                                       decoration: BoxDecoration(
                                         color: Colors.white,
                                         borderRadius: BorderRadius.circular(20.0)
                                       ),
                                       child: Text("登录/注册"),
                                     ),
                                   )
                                 ],
                              ),

                           )

                       ],
                    ),
                ),
                
            ],
        ), 
     );
  }
  //我的订单
  Widget _buildMyOrder(BuildContext context){
      return Padding(
          padding: EdgeInsets.fromLTRB(10.0, 15.0, 15.0, 15.0),
          child: Container(
            
            child: Column(
               children: <Widget>[
                  Container(
                     alignment: Alignment.center,
                     padding: EdgeInsets.only(bottom: 10.0),
                     decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(width: 1.0,color: Colors.black12)
                        )
                      ),
                     child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                            Text("我的订单"),
                            Container(
                               child: Row(
                                  children: <Widget>[
                                     Text("全部订单"),
                                     Icon(Icons.arrow_right)
                                  ],
                               ),
                            )
                        ],
                     ),
                  ),
                  SizedBox(height: 10.0,),
                  Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: <Widget>[
                        _buildOrderItem(context, "待付款", Icons.payment),
                        _buildOrderItem(context, "今日配送", Icons.local_shipping),
                        _buildOrderItem(context, "待评价", Icons.sms),

                     ],
                  )
               ],
            ),
          ),
      );

  }

  //订单项
  Widget _buildOrderItem(BuildContext context,String title,IconData iconData){
       return Expanded(
          flex: 1,
          child: Column(
             children: <Widget>[
                Icon(iconData,
                  size: 35,
                  color: Colors.brown,
                ),
                SizedBox(height: 8.0,),
                Text(title)

             ],
          ), 
       );

  }

  //分类部分
  Widget _buildCategory(BuildContext context){
      return Container(
         margin: EdgeInsets.symmetric(horizontal: 10.0),
         width: MediaQuery.of(context).size.width - 20.0,
         decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0)
         ),
         child: Column(
            children: <Widget>[
                Container(
                   padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                   decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 1,color: Colors.black12)
                      )
                   ),
                   child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                          _buildCategoryItem(context, "优惠卷", Icons.receipt),
                          _buildCategoryItem(context, "权益卡", Icons.folder_shared),
                          _buildCategoryItem(context, "会员积分", Icons.contacts),
                          _buildCategoryItem(context, "生日纪念提醒", Icons.access_alarm)
                      ],
                   ),
                ),
                SizedBox(height: 10.0,),
                Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                          _buildCategoryItem(context, "我的收藏", Icons.star),
                          _buildCategoryItem(context, "收货地址", Icons.place),
                          _buildCategoryItem(context, "余额", Icons.money_off),
                          _buildCategoryItem(context, "浏览记录", Icons.schedule)
                      ],
                   ),
                SizedBox(height: 10.0,)   
            ],
         ),
      );

  }

//分类项
  Widget _buildCategoryItem(BuildContext context,String title,IconData iconData){
       return Expanded(
          flex: 1,
          child: Column(
             children: <Widget>[
                Icon(iconData,
                  size: 30,
                  color: Colors.black54,
                ),
                SizedBox(height: 8.0,),
                Text(title)

             ],
          ), 
       );

  }

    //客服设置等
    Widget _buildSetting(BuildContext context){
      return Container(
         margin: EdgeInsets.symmetric(horizontal: 10.0),
         width: MediaQuery.of(context).size.width - 20.0,
         decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0)
         ),
         child: Column(
            children: <Widget>[
                Container(
                   padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 5.0),
                   
                   child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                          _buildCategoryItem(context, "联系客服", Icons.phone_forwarded),
                          _buildCategoryItem(context, "帮助中心", Icons.help_outline),
                          _buildCategoryItem(context, "关于花礼", Icons.info),
                          _buildCategoryItem(context, "设置", Icons.settings)
                      ],
                   ),
                ),
                SizedBox(height: 10.0,),
               
               
            ],
         ),
      );

  }



}