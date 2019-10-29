import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:provide/provide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../provide/homePage_provide.dart';


class HomeSwiper extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
   
    return Provide<HomePageProvide>(
        builder: (context,child,val){
        var  swiperDataList = val.homePageModelEntity.images;
              return Container(
                  height: MediaQuery.of(context).size.height / 3.8,
                  child: Swiper(
                    itemBuilder: (BuildContext context,int index){
                        return Image.network("${swiperDataList[index].image}");
                    },
                    onTap: (index){
                        print("点击了轮播组件:${index}");
                    },
                    itemCount: swiperDataList.length,
                    pagination: buildSwiperPagintion(),
                    autoplay: true,
                    
                  ),
                );
        },
    );
  }

  //自己配置的分页指示器
  buildSwiperPagintion(){
     return SwiperPagination(
        builder: DotSwiperPaginationBuilder(
           color: Colors.white,
           activeColor: Colors.orange
        )
     );
  }

}

