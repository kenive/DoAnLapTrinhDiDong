class InvoiceDetail{

  final int id;
  final int invoiceId;
  final String productId;
  final String quantity;
  final double unitPrice;
  final int status;

  InvoiceDetail({
    required this.id,
    required this.invoiceId,
    required this.productId,
    required this.quantity,
    required this.unitPrice,
    required this.status,
  });
  InvoiceDetail.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        invoiceId=json['invoiceId'],
        productId=json['productId'],
        quantity=json['quantily'],
        unitPrice=json['unitPrice'],
        status=json['status'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'issuedDate': invoiceId,
        'addressShoping': productId,
        'phoneShoping': quantity,
        'total': unitPrice,
        'status': status,

      };


}