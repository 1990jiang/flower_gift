import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import '../../model/categoryItemList_model_entity.dart';
import '../../provide/categoryListItem_provide.dart';

class RightSideBar extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    return Provide<CategoryListItemProvide>(
         builder: (context,child,val){
            var itemListModelEntity = val.itemListModelEntity;
            var typeList = itemListModelEntity.datas.typeList;
            
            return Container(
                   color: Colors.white,
                   padding: EdgeInsets.only(top: 20.0),
                   width: MediaQuery.of(context).size.width * 0.8,
                   child: ListView.builder(
                            //padding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 20.0),
                            itemCount: typeList.length,
                            itemBuilder: (context,index){
                              return _buidListItem(context, typeList[index]);
                            },
                         ),
                  );
          },
    );
    
     
  }
  //ListItem
  Widget _buidListItem(BuildContext context, ItemListModelDatasTypelist item){
     return Padding(
        padding: const EdgeInsets.only(bottom: 0.0),
        child: Container(
           child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                 Container(
                   alignment: Alignment.centerLeft,
                   padding: EdgeInsets.only(left: 10.0),
                   child: Text(item.type),
                 ),
                 
                 SizedBox(height: 10.0,),
                 Wrap(
                    alignment: WrapAlignment.start,
                    children: _buildSubItemList(context, item.xMap,item.type)
                 )
              ],
           ),
        ),
     );
  }
  //选择栏item
  List<Widget> _buildSubItemList(BuildContext context,List<ItemListModelDatasTypelistMap> xMap,String type){
        List<Widget> list = new List();
        for(var i = 0; i < xMap.length; i++){
          list.add(
              Container(
                 alignment: Alignment.center,
                 margin: EdgeInsets.only(bottom: 20.0,left: 15.0),
                 height: 25.0,
                 width: (MediaQuery.of(context).size.width * 0.8 - 60.0)/3,
                 color: xMap[i].selected ? Colors.orange : Colors.black12,
                 child: InkWell(
                   onTap: (){
                     print("点击了筛选项");
                     if(type != "人群"){
                        Provide.value<CategoryListItemProvide>(context).changeText(xMap[i].text);
                     }else{
                        Provide.value<CategoryListItemProvide>(context).changeText("筛选");
                     }
                     Provide.value<CategoryListItemProvide>(context).getCategoryListItemData(typeCode:xMap[i].typeCode);
                     Navigator.of(context).pop();
                   },
                   child: Text(xMap[i].text),
                 )
                  
              )
          ); 
          
        }
        if(type == "类别"){
           list.add(
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: <Widget>[
                      RaisedButton(
                                          
                      onPressed: (){
                        print("点击了清除选择按钮");
                        Navigator.of(context).pop();
                        Provide.value<CategoryListItemProvide>(context).changeText("筛选");
                        Provide.value<CategoryListItemProvide>(context).getCategoryListItemData(typeCode:"aiqing");
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width * 0.6,
                        height: 35.0,
                        child: Text(
                          "清除选择",
                        ),
                      ),
                    ),
                 ],
               )
           );
        }
       return list;
  }

  

}