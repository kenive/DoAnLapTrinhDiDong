
import 'package:flutter/material.dart';
import 'routes/screen_load/screen_load.dart';
import 'routes/home/home.dart';
//import 'routes/product/product.dart';
import 'routes/account/myhome.dart';
import 'routes/account/setting.dart';
import 'routes/account/profile.dart';
void main() {
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'màn hình load',
      initialRoute:'/' ,
      routes: {
        '/': (context)=>const ScreenLoad(),
        '/second': (context)=>const Home(),
        '/myhome': (context)=>const MyHome(),
        '/setting': (context)=>const PageSetting(),
        '/profile': (context)=>const PageProFile(),
       
      },
      debugShowCheckedModeBanner: false,
      
     
       
    );
  }
}


