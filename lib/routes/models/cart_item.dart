class CartItem {
  final int id;
  final String name;
  final String image;
  int quantily;
  final int productid;
  final int price;

  CartItem({
   required this.id,
   required this.image,
   required this.name,
   required this.quantily,
   required this.price,
   required this.productid,
  });

  CartItem.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        image =json['image'],
        name = json['name'],
        quantily=json['quantity'],
        price = json['price'],
        productid = json['productid'];

  // Map<String, dynamic> toJson() => {
  //       'id': id,
  //       'accountId': idAccount,
  //       'productId': idProduct,
  //       'quantity': quantily,
  //     };

}