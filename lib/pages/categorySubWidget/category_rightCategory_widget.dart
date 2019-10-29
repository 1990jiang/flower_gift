import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../model/categoryPage_model_entity.dart';
import 'package:provide/provide.dart';
import '../../provide/categoryPage_provide.dart';

class CategoryRightCategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provide<CategoryPageProvide>(
        builder: (context,child,val){
           var currentIndex = Provide.value<CategoryPageProvide>(context).currentIndex;
           var categoryModelCategory = val.categoryModelEntity.categorys[currentIndex];
           var categoryBanners = categoryModelCategory.categoryBanner;
           var areasItem = categoryModelCategory.areas[0];//默认只做第一排的商品分类详情了
           var head = areasItem.head;//看看是否有头部标题栏
           var contents = areasItem.contents;
           return Container(
              child:ListView(
                
                   children: <Widget>[
                      _buildTopBanner(context, categoryModelCategory.banner),
                    (categoryBanners != null) ? _buildCategoryBanner(context, categoryBanners) : SizedBox(height: 1.0,),
                    (head != null) ? _buildTitle(head) : SizedBox(height: 1.0,),
                    Divider(),
                    _buildCategoryShow(context, contents),
                   ],
                 
              )
             
           );
        },
    );
    
  }

  //顶部banner
  Widget _buildTopBanner(BuildContext context,CategoryModelCategorysBanner banner){
      return Padding(
         padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
         child: Container(
            height: MediaQuery.of(context).size.height / 7,
            child: Image.network(banner.imageUrl,fit:BoxFit.fill,),
         ), 
      );
   }

   //分类banner -- 需要判断显示否
   Widget _buildCategoryBanner(BuildContext context,List<CategoryModelCategorysCategorybanner> categoryBanners){
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Container(
           height: MediaQuery.of(context).size.height / 7,
           child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: _categoryBanners(context, categoryBanners)
           ),
        ),
      );
   }
   List<Widget> _categoryBanners(BuildContext context, List<CategoryModelCategorysCategorybanner> categoryBanners){
       List<Widget> list = new List();
        for(var i = 0; i < categoryBanners.length; i++){
          list.add(
              Container(
                width: (MediaQuery.of(context).size.width / 7 * 5  - 40.0)/3,
                child: Image.network(categoryBanners[i].imageUrl,fit:BoxFit.fill),
              )
              
          ); 
     }
     return list;
   }
 
   //标题栏
   Widget _buildTitle(dynamic head){
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
        child: Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: <Widget>[
              Text(head["Title"]),
              Text(head["UrlDesc"])
           ],
        ),
      );

   }
  //分类展示
   Widget _buildCategoryShow(BuildContext context,List<CategoryModelCategorysAreasContent> contents){
     return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Wrap(
               alignment: WrapAlignment.spaceBetween,
               children: _categoryShow(context, contents)
            ),
        
     );
     
   }
   //分类展示遍历
   List<Widget> _categoryShow(BuildContext context,List<CategoryModelCategorysAreasContent> contents){
       List<Widget> list = new List();
        for(var i = 0; i < contents.length; i++){
          list.add(
              Container(
                //  height:  MediaQuery.of(context).size.height / 7 + 20.0,
                 width:  (MediaQuery.of(context).size.width / 7 * 5 - 30.0)/3,
                 child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: <Widget>[
                        SizedBox(height:25.0),
                       (contents[i].text != null) ? CircleAvatar(
                           child: Image.network(contents[i].imageUrl),
                        ) : Padding(
                           padding: const EdgeInsets.symmetric(horizontal: 5.0),
                           child:Image.network(contents[i].imageUrl),
                        ),
                        SizedBox(height: 15.0,),
                        (contents[i].text != null) ? Text(
                          contents[i].text
                        ) : SizedBox(height: 1.0,),
                         
                     ],

                 ),
              )
              
          ); 
     }
     return list;
   }
 
  
  


}