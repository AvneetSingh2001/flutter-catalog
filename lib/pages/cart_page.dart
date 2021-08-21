import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tech_catalog_app/models/cart.dart';
import 'package:tech_catalog_app/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).canvasColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: "Cart".text.make(),
        ),
        body: Column(
          children: [
            _CartList().p32().expand(),
            Divider(),
            _cartTotal(),
          ],
        ));
  }
}

class _cartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartModel = CartModel();

    return SizedBox(
      height: 200,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        "Total : \$${cartModel.totalPrice}"
            .text
            .xl3
            .bold
            .color(Theme.of(context).accentColor)
            .make(),
        ElevatedButton(
            style: ButtonStyle(
              fixedSize: MaterialStateProperty.all(Size(120, 30)),
              backgroundColor:
                  MaterialStateProperty.all(Theme.of(context).buttonColor),
            ),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Buying not supported yet!!")));
            },
            child: "Buy".text.color(Colors.white).make())
      ]),
    );
  }
}

class _CartList extends StatefulWidget {
  const _CartList({Key? key}) : super(key: key);

  @override
  __CartListState createState() => __CartListState();
}

class __CartListState extends State<_CartList> {
  final cartModel = CartModel();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: cartModel.items.length,
        itemBuilder: (context, index) => ListTile(
              leading: Icon(Icons.done),
              trailing: IconButton(
                onPressed: () {},
                icon: Icon(Icons.remove_circle_outline),
              ),
              title: cartModel.items[index].name.text.make(),
            ));
  }
}
