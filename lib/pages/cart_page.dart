import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tech_catalog_app/core/store.dart';
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
    final CartModel cartModel = (VxState.store as MyStore).cart;

    return SizedBox(
      height: 200,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        VxBuilder(
          mutations: {RemoveMutation},
          builder: (BuildContext context, store, VxStatus? status) {
            return "Total : \$${cartModel.totalPrice}"
                .text
                .xl3
                .bold
                .color(Theme.of(context).accentColor)
                .make();
          },
        ),
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

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    final CartModel cartModel = (VxState.store as MyStore).cart;
    return cartModel.items.isEmpty
        ? Center(
            child: Text("Cart is empty !!"),
          )
        : ListView.builder(
            itemCount: cartModel.items.length,
            itemBuilder: (context, index) => ListTile(
                  leading: Icon(Icons.done),
                  trailing: IconButton(
                    onPressed: () => RemoveMutation(cartModel.items[index]),
                    icon: Icon(Icons.remove_circle_outline),
                  ),
                  title: cartModel.items[index].name.text.make(),
                ));
  }
}
