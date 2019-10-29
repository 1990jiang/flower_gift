import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import '../provide/categoryPage_provide.dart';
import './categorySubWidget/category_leftNav_widget.dart';
import './categorySubWidget/category_rightCategory_widget.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';//loading提示加载器

class CategoryPage extends StatefulWidget {
  CategoryPage({Key key}) : super(key: key);

  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
 
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        appBar: AppBar(
           backgroundColor: Colors.white,
           title: _buildSearchBar()
        ),
        body: FutureBuilder(
            future: _getCategoryPage(context),
            builder: (context,snapshot){
              if(snapshot.hasData){
                return Container(
                    color: Colors.white,
                    child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 2,
                            child: CategoryLeftNav()
                          ),
                          Expanded(
                            flex: 5,
                            child: CategoryRightCategory()
                          )
                        ],
                      ),  
                );  
              }else{
                return Center(
                  child: SpinKitWave(
                        color: Colors.orangeAccent,
                        size: 40.0,
                    )
                );
              }
            },
        ),
    ); 
   
    
  }

  //顶部搜索框;
  Widget _buildSearchBar(){
    return Container(
              margin: EdgeInsets.symmetric(horizontal: 10.0,vertical: 8.0),
              decoration: BoxDecoration(
                 color: Colors.black12,
                 borderRadius: BorderRadius.all(Radius.circular(22.0)),
              ),
              child: Row(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: TextFormField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "请输入关键字",
                                hintStyle: TextStyle(
                                  color: Colors.black
                                ),
                                icon: Icon(Icons.search,color:Colors.black)
                            ),
                          ),
                      ) 
                      
                    ),
                    
                 ],
              ),
    );
  }

  
  //网络请求
   Future _getCategoryPage(BuildContext context) async{
     await Provide.value<CategoryPageProvide>(context).getCategoryPageData();
     return "完成加载....";
  }

 



}