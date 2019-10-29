import 'package:flutter/material.dart';
import './categorySubWidget/categoryList_topNav_widget.dart';
import '../provide/categoryListItem_provide.dart';
import 'package:provide/provide.dart';
import './categorySubWidget/categoryList_list_widget.dart';
import './categorySubWidget/categoryList_rightSideBar_widget.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';



class CategoryListItem extends StatelessWidget {
  final String typeCode;
  CategoryListItem(this.typeCode);
  var _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
  return Scaffold(
      key:_scaffoldKey,
      endDrawer: RightSideBar(),//endDrawer就是右侧边栏，然后这个drawer就是左侧栏
      appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.arrow_back,color: Colors.black,),
            onPressed: (){
                Navigator.pop(context);
            },
          ),
          title: Text("分类列表",style: TextStyle(color:Colors.black),),
      ),
      body: FutureBuilder(
              future: _getCategoryListItemPage(context),
              builder: (context,snapshot){
                if(snapshot.hasData){
                  return  Container(
                    color: Colors.white,
                    child: ListView(
                        children: <Widget>[
                          CategoryListTopNav(_scaffoldKey),
                          SizedBox(height: 5.0,),
                          CategoryList(),
                        
                        ],
                    ),
                  );
  
                }else{
                    return Center(
                      child: SpinKitWave(
                          color: Colors.orangeAccent,
                          size: 40.0,
                      ),
                    ); 
                }
          }
      )
    );
    
  }
 
  Future _getCategoryListItemPage(BuildContext context) async{
     await Provide.value<CategoryListItemProvide>(context).getCategoryListItemData(typeCode:typeCode);
     return "完成加载....";
  }

}