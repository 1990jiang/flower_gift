import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import '../../provide/details_provide.dart';
import '../../model/details_model.entity.dart';

class DetailsCompany extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    return Provide<DetailsPageProvide>(
             builder: (context,child,val){
                var datas = val.datas;
                return  Container(
                    color: Colors.white,
                    child: Column(
                      children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(top: 20.0),
                            child: Center(
                                child: Text(datas.wayChooseUs.subject),
                            ),
                          ),
                          _buildBrands(context, datas.wayChooseUs.titleTextImgs)
                      ],
                    ),
                  );
              },
                
  );
   
}

 //圆形图片
 Widget _buildBrands(BuildContext context,List<DetailsModelDatasWaychooseusTitletextimg> titleTextImgs){
      return Padding(
         padding: EdgeInsets.all(20.0),
         child: Container(
            child: Wrap(
               spacing: 30.0,
               runSpacing: 30.0,
               children: _buildCompanyList(context, titleTextImgs),
            ),
         ),
      );
  }
  
   List<Widget> _buildCompanyList(BuildContext context,List<DetailsModelDatasWaychooseusTitletextimg> titleTextImgs){
        List<Widget> list = new List();
        for(var i = 0; i < titleTextImgs.length; i++){
          list.add(
             Container(
                width: (MediaQuery.of(context).size.width - 100.0)/3,
                child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: <Widget>[
                      Container(
                         child: ClipOval(
                            child: Image.network(titleTextImgs[i].image),
                         ),
                      ),
                      SizedBox(height: 2.0,),
                      Container(
                         alignment: Alignment.center,
                         child: Text(titleTextImgs[i].title),
                      )
                   ],
                ),
             )
          ); 
          
        }
        return list;

  }





}