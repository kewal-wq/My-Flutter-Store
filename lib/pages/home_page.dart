import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_learn/core/store.dart';
import 'package:flutter_application_learn/models/cart.dart';
import 'package:flutter_application_learn/models/catalog.dart';
import 'package:flutter_application_learn/utils/routes.dart';
import 'package:flutter_application_learn/widgets/home_widgets/catalog_header.dart';
import 'package:flutter_application_learn/widgets/home_widgets/catalog_list.dart';
import 'package:flutter_application_learn/widgets/themes.dart';
import 'dart:convert';
import 'package:velocity_x/velocity_x.dart';





class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;

  final String name = "Codepur";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");

    


    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModel.Items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    return Scaffold(
      floatingActionButton: VxBuilder(
        mutations: {AddMutation, RemoveMutation},
        builder: (BuildContext, dynamic, VxStatus) => FloatingActionButton(
          onPressed: (){
            Navigator.pushNamed(context, MyRoutes.cartRoute);
          }, 
          child: Icon(CupertinoIcons.cart, color: Colors.white,),
          backgroundColor: Vx.indigo400,
        ).badge(color: Vx.red500, size: 20, count: _cart.items.length, textStyle: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold
        ),
        
        )
        
      ),
      
      backgroundColor: MyTheme.darkColor,
     
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
           
            children: [
            CatalogHeader(),
            if (CatalogModel.Items!= null && CatalogModel.Items.isNotEmpty) 
            CatalogList().expand()
            else
               CircularProgressIndicator().centered().expand()
              
            
            ],
          ),
        ),
      )
    );
  }
}








