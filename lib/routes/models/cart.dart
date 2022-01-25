class Cart {

  final int id;
  final int idProduct;
  final int idAccount;
  final int quantily;

  Cart({
   required this.id,
   required this.idProduct,
   required this.idAccount,
   required this.quantily,
  });

  Cart.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        idProduct=json['productId'],
        idAccount=json['accountId'],
        quantily=json['quantity'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'accountId': idAccount,
        'productId': idProduct,
        'quantity': quantily,
      };

}