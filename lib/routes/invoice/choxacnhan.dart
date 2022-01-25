import 'package:flutter/material.dart';

class PageChoNhan extends StatefulWidget {
  const PageChoNhan({ Key? key }) : super(key: key);

  @override
  _PageChoNhanState createState() => _PageChoNhanState();
}

class _PageChoNhanState extends State<PageChoNhan> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Chờ Xác Nhận') ,
      ),
    );
  }
}