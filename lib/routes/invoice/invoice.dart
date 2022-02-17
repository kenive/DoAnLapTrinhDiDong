import 'package:doan_mobile/routes/invoice/dalayhang.dart';
import 'package:doan_mobile/routes/invoice/choxacnhan.dart';
import 'package:doan_mobile/routes/invoice/dagiao.dart';
import 'package:doan_mobile/routes/invoice/dahuy.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


class PageInvoice extends StatefulWidget {
  const PageInvoice({ Key? key }) : super(key: key);

  @override
  _PageInvoiceState createState() => _PageInvoiceState();
}

class _PageInvoiceState extends State<PageInvoice> {
  @override
  Widget build(BuildContext context) =>DefaultTabController(
    
    length: 4, child: Scaffold(
      appBar: AppBar(
        
        backgroundColor: Colors.pink[400],
        centerTitle: true,
        title:  Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Đơn Hàng'),
             Lottie.network(
            'https://assets7.lottiefiles.com/packages/lf20_5z4qVQ.json',
            width: 200,
            height: 90,
            fit: BoxFit.contain,
          ),

        ],),
        bottom: const TabBar(
          tabs: [
            Text('Chờ Xác Nhận'),
            Text('Đã lấy hàng'),
            Text('Đã Giao'),
            Text('Đã Hủy'),
          ],
        ),
      ),
      body: const TabBarView(
        children: [
          PageChoNhan(),
          PageChoLay(),
          PageDaGiao(),
          PageDaHuy(),
        
        ],
      ),
      
    )
    ); 
   
  
}