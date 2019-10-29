import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeSmallTag extends StatelessWidget {
  final List tags = ["认证龙头企业","14年品牌","3小时送花","最近320673条评论"];

  @override
  Widget build(BuildContext context) {
    return Container(
       padding: EdgeInsets.all(5.0),
       margin: EdgeInsets.only(top: 5.0),
       child: Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: _createWidget(tags)
       ),
    );
  }
 
  List<Widget> _createWidget(List tagList){
     List<Widget> list = new List();
     for(var i = 0; i < tags.length; i++){
       list.add(
          Row(
            children: <Widget>[
              Icon(Icons.check_circle,
                  size: ScreenUtil().setSp(30.0),
                  color: Color.fromRGBO(45, 60, 49, 1.0),
              ), 
              Text("${tags[i]}",
                  style: TextStyle(color: Colors.black45,fontSize: ScreenUtil().setSp(20.0)),
                )
            ],
          )
          
       );
     }
     return list;
  }

}