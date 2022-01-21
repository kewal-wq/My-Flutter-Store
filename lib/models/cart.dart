// import 'package:flutter/material.dart';

import 'package:flutter_application_learn/core/store.dart';
import 'package:flutter_application_learn/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {


CatalogModel catalog;
  CartModel({
    required this.catalog,
  });
  //Collections of IDs - store ids of each item
  final List<int> _ItemIds = [];


  //Get Catalog
  CatalogModel get _catalog => catalog;

  set _catalog(CatalogModel newCatalog)
  {
    assert(newCatalog != null);
    catalog = newCatalog;
  }

//Get items in cart
 List<Item> get items => _ItemIds.map((id) => catalog.getById(id)).toList();


 // //Get Total price
  num get totalPrice => 
  items.fold(0, (total, current) => total + current.price);

//Add Item will now be done by AddMutation method



 //Remove item will be done now by RemoveMutation method

}

 class AddMutation extends VxMutation<MyStore>{
   final Item item;
   AddMutation(this.item);
  @override
  perform() {
     store!.cart._ItemIds.add(item.id);
  }
   
 }


 class RemoveMutation extends VxMutation<MyStore>{
   final Item item;
   RemoveMutation(this.item);
  @override
  perform() {
     store!.cart._ItemIds.remove(item.id);
  }
   
 }

