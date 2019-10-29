import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import '../provide/details_provide.dart';
import './detailsSubWidget/top_swiper_widget.dart';
import './detailsSubWidget/detailsBottom_widget.dart';
import './detailsSubWidget/detailsTitle_widget.dart';
import './detailsSubWidget/detailsDescribe_widget.dart';
import './detailsSubWidget/detailsDelivery_widget.dart';
import './detailsSubWidget/detailsEvaluate_widget.dart';
import './detailsSubWidget/detailsCompany_widget.dart';
import './detailsSubWidget/detailsImgText_widget.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class DetailsPage extends StatelessWidget {
  String itemCode;
  DetailsPage(this.itemCode);
  
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.arrow_back,color: Colors.black,),
            onPressed: (){
                Navigator.pop(context);
            },
          ),
          title: Provide<DetailsPageProvide>(
              builder: (context,child,val){

                 return Text(val.datas.itemName,
                   style: TextStyle(color:Colors.black),
                 );
              },
          )
          
      ),
      body: FutureBuilder(
              future: _getDetailPage(context),
              builder: (context,snapshot){
                if(snapshot.hasData){
                  return Stack(
                       children: <Widget>[
                          Container(
                            color: Colors.black12,
                            child: ListView(
                                children: <Widget>[
                                  TopSwiper(),
                                  DetailsTitle(),
                                  SizedBox(height: 8.0,),
                                  DetailsDescribe(),
                                  SizedBox(height: 8.0,),
                                  DetailsDelivery(),
                                  SizedBox(height: 8.0,),
                                  DetailsEvaluate(),
                                  SizedBox(height: 8.0,),
                                  DetailsCompany(),
                                  SizedBox(height: 8.0,),
                                  DetailsImgText(),



                                  SizedBox(height: 80.0,)


                                  
                                ],
                            ),
                          ),
                          Positioned(
                             bottom: 0,
                             left: 0,
                             child: DetailsBottom(),
                          )
  
                       ],
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

  Future _getDetailPage(BuildContext context) async{
      await Provide.value<DetailsPageProvide>(context).getDetailsPageData(itemCode);
      return "加载完成";
  }

}