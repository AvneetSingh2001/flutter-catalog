import 'package:flutter/material.dart';
import 'package:tech_catalog_app/models/catalog.dart';
import 'package:tech_catalog_app/widgets/drawer.dart';
import 'package:tech_catalog_app/widgets/item_widgets.dart';

class homePage extends StatelessWidget {
  const homePage({Key? key}) : super(key: key);
  final int days = 2;
  @override
  Widget build(BuildContext context) {
    final dummyList = List.generate(50, (index) => CatalogModel.items[0]);
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalogs"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: dummyList.length,
          itemBuilder: (context, index) {
            return ItemWidget(
              item: dummyList[index],
            );
          },
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
