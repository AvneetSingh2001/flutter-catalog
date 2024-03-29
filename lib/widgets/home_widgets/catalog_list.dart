import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tech_catalog_app/models/cart.dart';
import 'package:tech_catalog_app/models/catalog.dart';
import 'package:tech_catalog_app/pages/home_detail_page.dart';

import 'package:tech_catalog_app/widgets/home_widgets/add_to_cart.dart';
import 'package:tech_catalog_app/widgets/home_widgets/catalog_image.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return context.isMobile
        ? ListView.builder(
            shrinkWrap: true,
            itemCount: CatalogModel.items!.length,
            itemBuilder: (context, index) {
              final catalog = CatalogModel.items![index];
              return InkWell(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HomeDetails(catalog: catalog))),
                child: CatalogItem(
                  catalog: catalog,
                ),
              );
            })
        : GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 20),
            shrinkWrap: true,
            itemCount: CatalogModel.items!.length,
            itemBuilder: (context, index) {
              final catalog = CatalogModel.items![index];
              return InkWell(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HomeDetails(catalog: catalog))),
                child: CatalogItem(
                  catalog: catalog,
                ),
              );
            },
          );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var children2 = [
      Hero(
        tag: Key(catalog.id.toString()),
        child: CatalogImage(
          image: catalog.image,
        ),
      ),
      Expanded(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          catalog.name.text.lg.color(Theme.of(context).accentColor).bold.make(),
          catalog.desc.text.caption(context).make(),
          10.heightBox,
          ButtonBar(
            buttonPadding: EdgeInsets.zero,
            alignment: MainAxisAlignment.spaceBetween,
            children: [
              "\$${catalog.price}".text.bold.xl.make(),
              AddToCart(catalog: catalog)
            ],
          ).pOnly(right: 8.0)
        ],
      ).p(context.isMobile ? 0 : 16))
    ];
    return VxBox(
            child: context.isMobile
                ? Row(
                    children: children2,
                  )
                : Column(
                    children: children2,
                  ))
        .color(context.cardColor)
        .rounded
        .square(150)
        .make()
        .py16();
  }
}
