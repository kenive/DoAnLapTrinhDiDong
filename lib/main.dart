
import 'package:doan_mobile/routes/API/search_sanpham.dart';
import 'package:doan_mobile/routes/checkout/pay.dart';
import 'package:doan_mobile/routes/checkout/pay_status.dart';
import 'package:doan_mobile/routes/invoice/invoice.dart';
import 'package:doan_mobile/routes/provider/providerinvoice.dart';
import 'package:doan_mobile/routes/provider/providerlogin.dart';
import 'package:doan_mobile/routes/provider/providerproduct.dart';
import 'package:doan_mobile/routes/search/search.dart';
import 'package:flutter/material.dart';
import 'routes/screen_load/screen_load.dart';
import 'routes/home/home.dart';
import 'routes/account/myhome.dart';
import 'routes/account/editprofile.dart';
import 'routes/account/setting.dart';
import 'routes/account/profile.dart';
import 'routes/login/login.dart';
import 'routes/login/register.dart';
import 'package:provider/provider.dart';
import 'routes/provider/providerloaisanpham.dart';
import 'routes/provider/providerlogin.dart';
import 'routes/provider/providercart.dart';
import 'routes/account/editpassword.dart';
import 'routes/cart/homecart.dart';
void main() {
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
    providers: [
        //ChangeNotifierProvider(create: (_) => ProductProvider()),
        ChangeNotifierProvider(create: (_) => CategoryProvider()),
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => SearchApi()),
         ChangeNotifierProvider(create: (_) => InvoiceProvider()),
         ChangeNotifierProvider(create: (_) => ProductProvider()),
      ],
    
    child:  MaterialApp(
      title: 'màn hình load',
      initialRoute:'/login' ,
      routes: {
        '/': (context)=>const ScreenLoad(),
        '/second': (context)=>const Home(),
        '/myhome': (context)=>const MyHome(),
        '/setting': (context)=>const PageSetting(),
        '/profile': (context)=>const PageProFile(),
        '/editprofile': (context)=>const EditProFile(),
        '/login': (context)=>const PageLogin(),
        '/register': (context)=>const PageRegister(),
        '/editpassword': (context)=>const PageEditPw(),
        '/cart': (context)=>const PageCart(),
        'search' :(contex)=>const SearchScreen(),
        'pay':(context)=>const PagePay(),
        'paystatus':(context)=>const PageStatus(),
        'invoice':(context)=>const PageInvoice(),
      },
      debugShowCheckedModeBanner: false,
      
     
       
    ),
    );
  }
}


