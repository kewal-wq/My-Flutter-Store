import 'package:flutter/material.dart';
import 'package:flutter_application_learn/models/catalog.dart';
import 'package:flutter_application_learn/pages/home_detail_page.dart';
import 'package:flutter_application_learn/widgets/home_widgets/catalog_image.dart';
import 'package:flutter_application_learn/widgets/home_widgets/add_to_cart.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return !context.isMobile?
     GridView.builder(
       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 20),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.Items[index];
return InkWell(
  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeDetailPage(
    catalog: catalog))),
  child: CatalogItems(catalog: catalog));
      },
      itemCount: CatalogModel.Items.length,
    ):
     ListView.builder(
      
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.Items[index];
return InkWell(
  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeDetailPage(
    catalog: catalog))),
  child: CatalogItems(catalog: catalog));
      },
      itemCount: CatalogModel.Items.length,
    );
    
  }
}

class CatalogItems extends StatelessWidget {
  final Item catalog;

  const CatalogItems({Key? key,required this.catalog}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    var children2 = [
        ElevatedButton(
          onPressed: (){
            
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              Vx.indigo400,
              
            ),
            shape: MaterialStateProperty.all(
              StadiumBorder(),
            )
          ),
         child: "Add to cart".text.make()),
      ];
    // var row = Row(
        var children =  [
         Hero(
           tag: Key(catalog.id.toString()),
           child: CatalogImage(
             image: catalog.image,
             
             ),
         ),
           Expanded(child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               catalog.name.text.lg.color(Vx.white).bold.make(),
                catalog.desc.text.caption(context).make(),
                9.heightBox,
ButtonBar(
  alignment: MainAxisAlignment.spaceBetween,
  buttonPadding: Vx.mH8,

  children: [
    "\$${catalog.price}".text.bold.xl.make(),
    
      AddToCart(catalog: catalog)
    
  ],
).pOnly(right: 8.0)
             ],

           ).p(context.isMobile? 0: 16)
           )
        ];
      // );
    return VxBox(
      child: context.isMobile? Row(
      children: children,
      ): Column(
        children: children,
      )
    ).color(context.cardColor).roundedLg.square(170).make().py(16);
  }
}

// class _AddToCart extends StatefulWidget {
//   final Item catalog;
//   const _AddToCart({
//      Key? key,
//      required this.catalog,
//      }) : super(key: key);

//   @override
//   _AddToCartState createState() => _AddToCartState();
// }

// class _AddToCartState extends State<_AddToCart> {
//   final _cart = CartModel(catalog: CatalogModel());
//   @override
//   Widget build(BuildContext context) {
    
//     bool isInCart = _cart.items.contains(widget.catalog);
//     return ElevatedButton(
//       onPressed: (){
        
//         if(!isInCart)
//         {
//         isInCart = isInCart.toggle();
//         final _catalog = CatalogModel();

//         _cart.catalog = _catalog;
//         _cart.add(widget.catalog);

         
//         setState(() {
          
//         });
//         }

//       },
//       style: ButtonStyle(
//         backgroundColor: MaterialStateProperty.all(
//           context.theme.buttonColor,
          
//           ),
//           shape: MaterialStateProperty.all(
//             StadiumBorder(),
//           )
//         ),
//       child: isInCart ? Icon(Icons.done) : "Add to cart".text.make(),
//     );
//   }
// }