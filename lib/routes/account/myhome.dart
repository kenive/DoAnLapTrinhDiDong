import 'package:doan_mobile/routes/home/home.dart';

import 'package:doan_mobile/routes/provider/providerlogin.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



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
     /* if(a.acc!.fullName! == "")
     {
       print('cc');
     } */
    container(String a) {
      return Container(
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
                ),
                margin: const EdgeInsets.fromLTRB(10, 20, 10, 0),
              ),
              Positioned(
                top: 50,
                left: 120,
                child: Text(a.acc!.fullName!,
                 //error == "null" ? 'cc':'cl' ,
                  style: const TextStyle(
                    fontFamily: 'Times New Roman',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              const Positioned(
                top: 80,
                left: 120,
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
                top: 45,
                right: 30,
                child: IconButton(
                  icon: const Icon(
                    Icons.shopping_cart,
                  ),
                  iconSize: 30,
                  color: Colors.black,
                  splashColor: Colors.orange,
                  onPressed: () {
                    Navigator.pushNamed(context, '/cart');
                  },
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          container('Đơn Hàng'),
          const SizedBox(height: 40),
          row('Xem lịch sử mua hàng', 'invoice'),
          const SizedBox(height: 40),
          container('Thông Tin'),
          const SizedBox(height: 40),
          row('Thiết lập tài khoản', '/setting'),
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
              icon: Icon(Icons.person),
              // ignore: deprecated_member_use
              label: 'Tôi'),
        ],
        backgroundColor: Colors.pink,
        selectedItemColor: Colors.blue,
        currentIndex: 1,
        onTap: (index) {
          Navigator.push(
            context,
            PageRouteBuilder(pageBuilder: (context, animation, secon) {
              if (index == 0) {
                return const Home();
              }
              if (index == 1) {
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
