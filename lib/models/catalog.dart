class CatalogModel {
  static final items = [
    Item(1, "iphone 12 pro", "Apple iphone 12th generation", 999, "#33f0fa",
        "http://callmobilegalaxy.com/wp-content/uploads/2021/05/Apple-iPhone-12-Pro-Max-Gold.png")
  ];
}

class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item(this.id, this.name, this.desc, this.price, this.color, this.image);
}
