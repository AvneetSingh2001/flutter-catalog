import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tech_catalog_app/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          "Catalog App"
              .text
              .xl5
              .bold
              .color(Theme.of(context).accentColor)
              .make(),
          "Trending Products".text.xl2.make(),
        ],
      ),
    );
  }
}
