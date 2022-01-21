import 'package:flutter/material.dart';
import 'package:flutter_application_learn/models/catalog.dart';
import 'package:flutter_application_learn/widgets/home_widgets/add_to_cart.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;
  const HomeDetailPage({ Key? key, required this.catalog }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.canvasColor,
      ),
      backgroundColor: context.canvasColor,
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
        alignment: MainAxisAlignment.spaceBetween,
        buttonPadding: Vx.mH8,
      
        children: [
          "\$${catalog.price}".text.bold.xl4.red700.make(),
          AddToCart(catalog: catalog).wh(120, 50)
        ],
      ).p32(),
      ),
      body: SafeArea(

        bottom: false,
        child: Column(
          children: [
            Hero(tag: Key(catalog.id.toString()),
             child: Image.network(catalog.image)
             ).h32(context),
             Expanded(child: VxArc(
               height: 30.0,
               arcType: VxArcType.CONVEY,
               edge: VxEdge.TOP,
               child: Container(
                   color: context.cardColor,
                   width: context.screenWidth,
                   child: Column(
                  children: [
                    catalog.name.text.xl4.color(Vx.white).bold.make(),
                    catalog.desc.text.caption(context).xl.make(),
                    10.heightBox,
                    "Clita diam amet erat consetetur amet et. Elitr accusam diam stet rebum amet. Sit duo duo labore vero, at eirmod labore invidunt diam amet, eirmod at erat lorem sea amet lorem, dolor dolore labore amet lorem elitr justo erat."
                    .text.caption(context).make().p16()
                    
                  ],
                   ).py64(),
               ),

             ))
          ],
            
          
          
          ),
        ),
        
      
    );
  }
}