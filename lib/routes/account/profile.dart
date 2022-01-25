import 'package:flutter/material.dart';

class PageProFile extends StatefulWidget {
  const PageProFile({Key? key}) : super(key: key);
  @override
  Page createState() => Page();
}

class Page extends State<PageProFile> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.pink[50],
      appBar: AppBar(
        backgroundColor: Colors.pink[200],
        title: const Text('Thông tin tài khoản',
        style: TextStyle(color: Colors.black),
        ),
      ),


    );

  }
  
  }