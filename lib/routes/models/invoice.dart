class Invoice{

  final int id;
  String ngaplap;
  final String nameShopping;
  final String addresshoping;
  final String phoneshoping;
  final int? total;
  final int accountid;
  final int status;

  Invoice({
    required this.id,
    required this.ngaplap,
    required this.nameShopping,
    required this.addresshoping,
    required this.phoneshoping,
    required this.total,
    required this.accountid,
    required this.status,
  });
  Invoice.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        ngaplap=json['issuedDate'],
        nameShopping=json['nameShopping'],
        addresshoping=json['addressShoping'],
        phoneshoping=json['phoneShoping'],
        total=json['total'],
        accountid=json['accountId'],
        status=json['status'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'issuedDate': ngaplap,
        'nameShopping':nameShopping,
        'addressShoping': addresshoping,
        'phoneShoping': phoneshoping,
        'total': total,
        'accountId': accountid,
        'status': status,

      };


}