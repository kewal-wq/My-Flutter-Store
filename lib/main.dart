import 'package:flutter/material.dart';
import 'package:flutter_application_learn/core/store.dart';
import 'package:flutter_application_learn/models/cart.dart';
import 'package:flutter_application_learn/models/catalog.dart';
import 'package:flutter_application_learn/pages/cart_page.dart';
import 'package:flutter_application_learn/pages/home_page.dart';
import 'package:flutter_application_learn/pages/login_page.dart';
import 'package:flutter_application_learn/utils/routes.dart';
import 'package:flutter_application_learn/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';


 void main() {
  
  runApp(VxState(store: MyStore(CatalogModel(), CartModel(catalog: CatalogModel())), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    
    return MaterialApp(
      // home: homePage(),
      themeMode: ThemeMode.system,
      // theme: MyTheme.lightTheme(context),
      
        
      darkTheme: MyTheme.darkTheme(context),
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.loginRoute,
      routes: {
        MyRoutes.homeRoute : (context)=> HomePage(),
        MyRoutes.loginRoute : (context) => LoginPage(),
        MyRoutes.cartRoute : (context) => CartPage(),
      },
    );
  }
}