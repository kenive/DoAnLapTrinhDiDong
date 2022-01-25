class Invoice{

  final int id;
  final DateTime ngaplap;
  final String addresshoping;
  final String phoneshoping;
  final double total;
  final int accountid;
  final int status;

  Invoice({
    required this.id,
    required this.ngaplap,
    required this.addresshoping,
    required this.phoneshoping,
    required this.total,
    required this.accountid,
    required this.status,
  });
  Invoice.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        ngaplap=json['issuedDate'],
        addresshoping=json['addressShoping'],
        phoneshoping=json['phoneShoping'],
        total=json['total'],
        accountid=json['accountId'],
        status=json['status'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'issuedDate': ngaplap,
        'addressShoping': addresshoping,
        'phoneShoping': phoneshoping,
        'total': total,
        'accountId': accountid,
        'status': status,

      };


}