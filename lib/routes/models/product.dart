class Product {
  final int id;
  final String name;
  final String description;
  final int quantily;
  final String imageUrl;
  final int idproducttype;
  final int price;
  final int news;
  final int status;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.quantily,
    required this.idproducttype,
    required this.price,
    required this.status,
    required this.news
    
  });

  Product.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        description = json['description'],
        imageUrl = json['image'],
        quantily = json['stock'],
        idproducttype = json['productTypeid'],
        price = json['price'],
        status = json['status'],
        news = json['new'];
        

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'image': imageUrl,
        'stock': quantily,
        'productTypeid': idproducttype,
        'price': price,
        'status': status,
        'new': news,
       
      };
}




