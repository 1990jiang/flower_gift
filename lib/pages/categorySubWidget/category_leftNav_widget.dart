import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../model/categoryPage_model_entity.dart';
import 'package:provide/provide.dart';
import '../../provide/categoryPage_provide.dart';

class CategoryLeftNav extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Provide<CategoryPageProvide>(
        builder: (context,child,val){
          var categoryPageModelEntity = val.categoryModelEntity;
          return  Container(
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(
                    color: Colors.black12,
                    width: 1.0,
                    style: BorderStyle.solid
                )
              )
            ),
            child: ListView.builder(
              itemCount: categoryPageModelEntity.categorys.length,
              itemBuilder:(context,index){
                  return Container(
                      color: Colors.white,
                      child: InkWell(
                          //设置点击闪烁那一下的文字颜色
                          splashColor: Colors.redAccent.withOpacity(0.5),
                          onTap: (){
                             Provide.value<CategoryPageProvide>(context).switchCategory(index);
                          },
                          child: Column(
                            children: <Widget>[
                              SizedBox(height: 15.0,),
                                Container(
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                                  decoration: (Provide.value<CategoryPageProvide>(context).currentIndex == index) ?  BoxDecoration(
                                      border: Border(
                                          left: BorderSide(
                                            color: Colors.orange,
                                            width: 3.0,
                                            style: BorderStyle.solid
                                          )
                                      )
                                    ) : null,
                                    child: Text(
                                        categoryPageModelEntity.categorys[index].type,
                                        style: TextStyle(fontSize: 18.0),
                                      ),
                              ),
                              SizedBox(height: 15.0,),
                              
                            ],
                          ) 
                        
                          
                      )
                      
                  );
              },
            ),
            
        );
      }
   );
  }
}