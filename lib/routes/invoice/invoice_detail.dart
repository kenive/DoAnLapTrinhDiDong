import 'package:doan_mobile/routes/provider/providerinvoice.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PageDetail extends StatefulWidget {
  const PageDetail({Key? key}) : super(key: key);

  @override
  _PageDetailState createState() => _PageDetailState();
}

class _PageDetailState extends State<PageDetail> {
  @override
  Widget build(BuildContext context) {
    var detail = Provider.of<InvoiceProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[200],
        title: const Text(
          'Chi Tiết Hóa Đơn',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Consumer<InvoiceProvider>(
        
        builder: (context, value, child) {
          return SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                Row(
                  children: const [
                    SizedBox(
                      width: 10,
                    ),
                    Icon(Icons.inventory_2),
                    SizedBox(
                      width: 40,
                    ),
                    Text(
                      'Sản Phẩm Đã Mua',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                          fontSize: 20),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Wrap(
                  children: List.generate(
                    detail.lstOder.length,
                    (index) {
                      return Container(
                        height: 120,
                        width: 400,
                        //color: Colors.white,
                        decoration:
                            BoxDecoration(color: Colors.pink[50], boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            offset: const Offset(2, 2),
                            blurRadius: 4,
                            spreadRadius: 1,
                          ),
                        ]),

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image:
                                      AssetImage(detail.lstOder[index].image),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              margin: const EdgeInsets.only(left: 5),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                               
                                Text(detail.lstOder[index].name),
                                Text('x ${detail.lstOder[index].quantity}'),
                                Text(
                                  '${detail.lstOder[index].price} VNĐ',
                                  style: const TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Thành Tiền: ${detail.lstOder[index].price*detail.lstOder[index].quantity} VNĐ',
                                  style: const TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                          ],
                        ),
                        margin: const EdgeInsets.only(top: 5, bottom: 20),
                      );
                    },
                  ),
                ),
                
              ],
            ),
          );
        },
      ),
    );
  }
}
