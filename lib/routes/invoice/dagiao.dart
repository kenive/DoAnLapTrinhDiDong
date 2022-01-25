import 'package:flutter/material.dart';

class PageDaGiao extends StatefulWidget {
  const PageDaGiao({ Key? key }) : super(key: key);

  @override
  _PageDaGiaoState createState() => _PageDaGiaoState();
}

class _PageDaGiaoState extends State<PageDaGiao> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Đã Giao') ,
      ),
    );
  }
}