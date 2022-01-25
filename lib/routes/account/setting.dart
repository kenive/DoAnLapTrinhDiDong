import 'package:doan_mobile/routes/provider/providercart.dart';
import 'package:doan_mobile/routes/provider/providerlogin.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class PageSetting extends StatefulWidget {
  const PageSetting({Key? key}) : super(key: key);
  @override
  Page createState() => Page();
}

class Page extends State<PageSetting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      appBar: AppBar(
        backgroundColor: Colors.pink[100],
        title: const Text(
          'Thiết lập tài khoản',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 40,
          ),
          Container(
            height: 40,
            decoration: BoxDecoration(
              color: Colors.pink.shade100,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(0.5),
                  offset: const Offset(0, 5),
                  blurRadius: 7,
                  spreadRadius: 3,
                ),
              ],
            ),
            margin: const EdgeInsets.fromLTRB(10, 0, 250, 0),
            child: const Center(
              child: Text(
                'Thông tin',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Times New Roman",
                  color: Colors.black,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                'Hồ sơ của tui',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Times New Roman",
                  color: Colors.pinkAccent,
                ),
              ),
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: Colors.black,
                  ),
                ),
                child: IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/editprofile');
                  },
                  icon: const Icon(Icons.arrow_forward_ios),
                  iconSize: 25,
                  splashColor: Colors.pink[200],
                  alignment: Alignment.center,
                ),
                padding: const EdgeInsets.only(left: 5),
              ),
             
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                'Đổi mật khẩu',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Times New Roman",
                  color: Colors.pinkAccent,
                ),
              ),
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: Colors.black,
                  ),
                ),
                child: IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/editpassword');
                  },
                  icon: const Icon(Icons.arrow_forward_ios),
                  iconSize: 25,
                  splashColor: Colors.pink[200],
                  alignment: Alignment.center,
                ),
                padding: const EdgeInsets.only(left: 5),
              ),
             
            ],
          ),
          const SizedBox(
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(70, 20, 70, 20),
            child: TextButton.icon(
              style: TextButton.styleFrom(
                backgroundColor: Colors.pink[100],
                side: const BorderSide(width: 2, color: Colors.white),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              icon: const Icon(
                Icons.logout,
                size: 32,
                color: Colors.black,
              ),
              label: const Text(
                'Đăng Xuất',
                style: TextStyle(fontSize: 28, color: Colors.black),
              ),
              onPressed: () {
                var a = Provider.of<LoginProvider>(context, listen: false);
                a.acc = null;
                var b = Provider.of<CartProvider>(context, listen: false);
                b.lstCartItem=[];
                
               
                Navigator.pushNamed(context, '/login');
              },
            ),
          ),
        ],
      ),
    );
  }
}
