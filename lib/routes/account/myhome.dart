import 'package:doan_mobile/routes/home/home.dart';

import 'package:doan_mobile/routes/provider/providerlogin.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import '../product/producttype.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);
  @override
  MyHomePage createState() => MyHomePage();
}

class MyHomePage extends State<MyHome> {
//TextEditingController txtds=TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var a = Provider.of<LoginProvider>(context, listen: false);
    container(String a) {
      return Container(
        height: 40,
        decoration: BoxDecoration(
          color: Colors.pink.shade100,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              offset: const Offset(3, 2),
              blurRadius: 4,
              spreadRadius: 1,
            )
          ],
        ),
        margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
        child: Center(
          child: Text(
            a,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: "Times New Roman",
              color: Colors.blueGrey,
            ),
          ),
        ),
      );
    }

    row(String a, String b) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            a,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              fontFamily: "Times New Roman",
              color: Colors.pinkAccent,
            ),
          ),
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border: Border.all(
                width: 1,
                color: Colors.black,
              ),

              //borderRadius: BorderRadius.circular(10),
            ),
            child: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, b);
              },
              icon: const Icon(Icons.arrow_forward_ios),
              iconSize: 25,
              splashColor: Colors.pink[200],
              alignment: Alignment.center,
            ),
            padding: const EdgeInsets.only(left: 5),
          ),
        ],
      );
    }

    return Scaffold(
      backgroundColor: Colors.pink[50],
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.pink[200],
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      offset: const Offset(3, 3),
                      blurRadius: 4,
                      spreadRadius: 1,
                    )
                  ],
                ),
                margin: const EdgeInsets.fromLTRB(10, 20, 10, 0),
              ),
              Positioned(
               top: 35,
               left: 20,
               
                child: Lottie.network(
                'https://assets6.lottiefiles.com/packages/lf20_n5icqxkw.json',
                width: 70,
                height: 80,
                fit: BoxFit.contain,
              ),
              ),
              Positioned(
                top: 50,
                left: 110,
                child: Text(
                  a.acc!.fullName!,
                  style: const TextStyle(
                    fontFamily: 'Times New Roman',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              const Positioned(
                top: 90,
                left: 110,
                child: Text(
                  'Thành Viên',
                  style: TextStyle(
                    fontFamily: 'Times New Roman',
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              Positioned(
                top: 50,
                right: 40,
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.pink,
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        offset: const Offset(3, 3),
                        blurRadius: 4,
                        spreadRadius: 1,
                      )
                    ],
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Icons.shopping_cart,
                    ),
                    iconSize: 30,
                    color: Colors.white,
                    splashColor: Colors.orange,
                    onPressed: () {
                      Navigator.pushNamed(context, '/cart');
                    },
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              container('   Đơn Hàng   '),
              Lottie.network(
                'https://assets3.lottiefiles.com/packages/lf20_taDv2I.json',
                width: 140,
                height: 140,
                fit: BoxFit.contain,
              ),
            ],
          ),
          
          row('Xem lịch sử mua hàng', 'invoice'),
        
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              container('   Thông tin   '),
              Lottie.network(
                'https://assets10.lottiefiles.com/private_files/lf30_wfox4afo.json',
                width: 140,
                height: 140,
                fit: BoxFit.contain,
              ),
            ],
          ),
        
         
          row('Thiết lập tài khoản      ', '/setting'),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            // ignore: deprecated_member_use
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            // ignore: deprecated_member_use
            label: 'Danh Mục',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              // ignore: deprecated_member_use
              label: 'Tôi'),
        ],
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blue,
        currentIndex: 2,
        onTap: (index) {
          Navigator.push(
            context,
            PageRouteBuilder(pageBuilder: (context, animation, secon) {
              if (index == 0) {
                return const Home();
              }
              if (index == 1) {
                return const Type();
              }
              if (index == 2) {
                return const MyHome();
              }
              return const MyHome();
            }),
          );
        },
      ),
    );
  }
}
