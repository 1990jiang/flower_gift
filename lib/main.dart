import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';//iOS风格UI
import './pages/tabBar_page.dart';
import 'package:provide/provide.dart';//状态管理
import './provide/tabBarTap_provide.dart';//底部tab点击状态管理
import './provide/homePage_provide.dart';//首页数据管理
import './provide/categoryPage_provide.dart';//分类数据管理
import './provide/categoryListItem_provide.dart';//分类列表数据管理
import 'package:fluro/fluro.dart';
import './routers/application.dart';
import './routers/routers.dart';
import './provide/details_provide.dart';
import './provide/cart_provide.dart';


void main() {
  var providers = Providers();
  var tabBarTapProvide = TabBarTapProvide();
  var homePageProvide = HomePageProvide();
  var categoryPageProvide = CategoryPageProvide();
  var categoryListItemProvide = CategoryListItemProvide();
  var detailsPageProvide = DetailsPageProvide();
  var cartProvide = CartProvide();
  //状态管理注册
  providers
  ..provide(Provider<TabBarTapProvide>.value(tabBarTapProvide))
  ..provide(Provider<HomePageProvide>.value(homePageProvide))
  ..provide(Provider<CategoryPageProvide>.value(categoryPageProvide))
  ..provide(Provider<CategoryListItemProvide>.value(categoryListItemProvide))
  ..provide(Provider<DetailsPageProvide>.value(detailsPageProvide))
  ..provide(Provider<CartProvide>.value(cartProvide));
  runApp(
    ProviderNode(
      child: MyApp(),
      providers: providers,
    )
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //路由初始化
    final router = Router();
    Routes.configureRoutes(router);
    Application.router = router;

    return Container(
         child: MaterialApp(
            title: "花礼网",
            onGenerateRoute: Application.router.generator,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primaryColor: Color.fromRGBO(45, 60, 49, 1.0),//主题色
            ),
            home: TabBarPage(),
         ),
    );
  }
}

