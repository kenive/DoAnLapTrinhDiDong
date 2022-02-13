class OderItem {

  final String name;
  final String image;
  final int price;
  final int quantity;
  final String ngayLap;
  final String nameShoping;
  final String phoneShoping;
  final String addressShoping;
  final int total;


  OderItem({
   required this.name,
   required this.image,
   required this.price,
   required this.quantity,
   required this.ngayLap,
   required this.nameShoping,
   required this.phoneShoping,
   required this.addressShoping,
   required this.total,
   
  });

  OderItem.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        image=json['image'],
        price=json['price'],
        quantity=json['quantily'],
        ngayLap = json['issuedDate'],
        nameShoping=json['nameShopping'],
        phoneShoping=json['phoneShoping'],
        addressShoping=json['addressShoping'],
        total=json['total'];
        

  Map<String, dynamic> toJson() => {
        'name': name,
        'image': image,
        'price': price,
        'quantily': quantity,
        'issuedDate': ngayLap,
        'nameShopping': nameShoping,
        'phoneShoping': phoneShoping,
        'addressShoping': addressShoping,
        'total':total,
      };

}