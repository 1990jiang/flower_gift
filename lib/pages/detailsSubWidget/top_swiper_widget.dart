import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import '../../provide/details_provide.dart';
import 'package:flutter_swiper/flutter_swiper.dart';



class TopSwiper extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Provide<DetailsPageProvide>(
         builder: (context,child,val){
            var coverImages = val.datas.coverImages;
            return Container(
                  color: Colors.white,
                  height: MediaQuery.of(context).size.height*0.6,
                  child: Swiper(
                    itemBuilder: (BuildContext context,int index){
                        return Image.network("${coverImages[index]}");
                    },
                    onTap: (index){
                        print("点击了轮播组件:${index}");
                    },
                    itemCount: coverImages.length,
                    pagination: buildSwiperPagintion(),
                    autoplay: true,
                    
                  ),
                );
         },
    );
  }

  buildSwiperPagintion(){
     return SwiperPagination(
        builder: FractionPaginationBuilder(
           color: Colors.white,
           activeColor: Colors.orange
        )
     );
  }
}