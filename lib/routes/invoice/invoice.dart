import 'package:doan_mobile/routes/invoice/cholayhang.dart';
import 'package:doan_mobile/routes/invoice/choxacnhan.dart';
import 'package:doan_mobile/routes/invoice/dagiao.dart';
import 'package:doan_mobile/routes/invoice/dahuy.dart';
import 'package:flutter/material.dart';


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
        title: const Text('Đơn Hàng'),
        bottom: const TabBar(
          tabs: [
            Text('Chờ Xác Nhận'),
            Text('Chờ Lấy Hàng'),
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