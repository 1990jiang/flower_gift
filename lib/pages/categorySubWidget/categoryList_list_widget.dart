import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import '../../model/categoryItemList_model_entity.dart';
import '../../provide/categoryListItem_provide.dart';

class CategoryList extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return  Provide<CategoryListItemProvide>(
        builder: (context,child,val){
            var itemListModelEntity = val.itemListModelEntity;
            return  Container(
                color: Color.fromRGBO(246, 246, 246, 1.0),
                child: _buildListView(context, itemListModelEntity.datas.items)
            );
        }
    );
    
   
  }
  
  //list列表
  Widget _buildListView(BuildContext context,List<ItemListModelDatasItem> itemList){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Wrap(
         alignment: WrapAlignment.spaceBetween,
         children: _listViewLists(context, itemList)
      )
    );
  }

  //列表循环添加
   List<Widget> _listViewLists(BuildContext context,List<ItemListModelDatasItem> itemList){
       List<Widget> list = new List();
     for(var i = 0; i < itemList.length; i++){
       list.add(
          _listItem(context,itemList[i]) 
       ); 
       
     }
     return list;

  }
  //列表项
  Widget _listItem(BuildContext context,ItemListModelDatasItem item){
    return Container(
       margin: EdgeInsets.only(bottom: 10.0),
       color:Colors.white,
       width: (MediaQuery.of(context).size.width - 35.0)/2,
       child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
             Image.network(
               item.image,
               fit: BoxFit.fill,
               width: (MediaQuery.of(context).size.width - 35.0)/2,
               height: (MediaQuery.of(context).size.width - 35.0)/2 * 1.1,
             ),
             SizedBox(height: 10.0,),
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 3.0),
               child:  Text(
                  item.introduction,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
             ),
            
             SizedBox(height: 10.0,),
             Text("￥${item.price}",
                style: TextStyle(color: Colors.orange,fontSize: ScreenUtil().setSp(26.0),fontWeight: FontWeight.w500,)
             ),
             SizedBox(height: 5.0,),
          ],
       ), 
    );

  }


}