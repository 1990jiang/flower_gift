import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import '../../provide/details_provide.dart';
import '../../model/details_model.entity.dart';

class DetailsImgText extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Provide<DetailsPageProvide>(
         builder: (context,child,val){
            var datas = val.datas;
            return Container(
              color: Colors.white,
              child: Column(
                 children: <Widget>[
                    Container(
                       alignment: Alignment.centerLeft,
                       padding: EdgeInsets.all(15.0),
                       child: Text("图文详情"),
                    ),
                    _buildImages(context, datas.itemImages)

                 ],
              )
            );
         },
    );
    
  }

  //循环图片
  Widget _buildImages(BuildContext context,List<String> itemImage){
   
     List<Widget> lists = List();
     for(var i = 0; i < itemImage.length; i++){
        lists.add(
           Container(
              width: MediaQuery.of(context).size.width,
              child: Image.network(itemImage[i],
                fit: BoxFit.fitWidth,
              ),
           )
        );
     }
     return Column(
         children: lists,
     );

  }

}