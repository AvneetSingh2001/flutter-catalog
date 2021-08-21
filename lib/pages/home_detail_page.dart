import 'package:flutter/material.dart';
import 'package:tech_catalog_app/models/catalog.dart';
import 'package:tech_catalog_app/widgets/home_widgets/add_to_cart.dart';
import 'package:tech_catalog_app/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetails extends StatelessWidget {
  final Item catalog;

  const HomeDetails({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Theme.of(context).canvasColor,
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price}".text.bold.xl4.red800.make(),
            AddToCart(catalog: catalog)
          ],
        ).p32(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
                tag: Key(catalog.id.toString()),
                child: Image.network(catalog.image).h32(context).p16()),
            Expanded(
              child: VxArc(
                height: 30.0,
                arcType: VxArcType.CONVEY,
                edge: VxEdge.TOP,
                child: Container(
                  width: context.screenWidth,
                  color: context.cardColor,
                  child: Column(
                    children: [
                      catalog.name.text.xl4
                          .color(
                            context.accentColor,
                          )
                          .bold
                          .make(),
                      catalog.desc.text.caption(context).make(),
                      10.heightBox,
                      "Rebum magna kasd magna accusam diam dolor amet ut tempor elitr. Amet duo elitr labore nonumy et vero, amet sea kasd voluptua tempor lorem vero no tempor ut. Sit vero et rebum ipsum voluptua gubergren duo aliquyam takimata. Dolore magna tempor invidunt eirmod no, est amet kasd dolores dolor dolores."
                          .text
                          .caption(context)
                          .make()
                          .p32()
                    ],
                  ).py64(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
