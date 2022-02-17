
import 'package:doan_mobile/routes/account/myhome.dart';
import 'package:doan_mobile/routes/home/home.dart';
import 'package:doan_mobile/routes/product/product.dart';
import 'package:doan_mobile/routes/provider/providerloaisanpham.dart';
import 'package:doan_mobile/routes/provider/providersearch.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class Type extends StatefulWidget {
  const Type({ Key? key }) : super(key: key);

  @override
  _TypeState createState() => _TypeState();
}
chude(String a) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Colors.pink.shade200,
        borderRadius: BorderRadius.circular(25),
       /*  boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.5),
            offset: const Offset(0, 5),
            blurRadius: 7,
            spreadRadius: 3,
          ),
        ], */
      ),
      margin: const EdgeInsets.fromLTRB(10, 0, 250, 0),
      child: Center(
        child: Text(
          a,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: "Times New Roman",
            color: Colors.black,
          ),
        ),
      ),
    );
  }

class _TypeState extends State<Type> {
  @override
  Widget build(BuildContext context) {
   
    var prods = Provider.of<SearchApi>(context, listen: false);
    prods.getAllProd();
    var danhmuc = Provider.of<CategoryProvider>(context, listen: false);
    danhmuc.getDanhMuc();
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.pink.shade50,
        appBar: AppBar(
          backgroundColor: Colors.pink[50],
          centerTitle: false,
          automaticallyImplyLeading: false,
          title: Container(
            decoration: BoxDecoration(
                color: Colors.pink.shade100,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                   width: 1,
                color: Colors.black,
                ),
                /* boxShadow: const [
                  BoxShadow(
                    offset: Offset(0, 2),
                    //blurRadius: 50,
                    //color: Colors.pink,
                  ),
                ] */),
            child: TextField(
              readOnly: true,
              onTap: () {
                Navigator.pushNamed(context, 'search');
              },
              decoration: InputDecoration(
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                contentPadding: const EdgeInsets.only(top: 14),
                border: const OutlineInputBorder(),
                prefixIcon: IconButton(
                  icon: const Icon(
                    Icons.search,
                  ),
                  iconSize: 30,
                  color: Colors.black,
                  onPressed: () {},
                ),
                hintText: 'search',
                //suffixIcon: Icons.search,
              ),
            ),
          ),
          actions: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.pink,
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
                splashColor: Colors.pink,
                onPressed: () {
                  Navigator.pushNamed(context, '/cart');
                },
              ),
            ),
          ],
        ),
        body:ListView(children: [
      const SizedBox(height: 20,),
      chude('Danh Mục'),
      const SizedBox(height: 10,),
      Consumer<CategoryProvider>(builder: (context, categoty, child) {
        return Wrap(
          children: List.generate(danhmuc.lstDanhMuc.length, (index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PageProduct(
                            producttype: danhmuc.lstDanhMuc[index])));
              },
              child: Card(
                color: Colors.white60,
                elevation: 10,
                
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                   
                    Container(
                      width: 150,
                      height:150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 7,
                            offset: const Offset(3, 2),
                          ),
                        ],
                        image: DecorationImage(
                          image: AssetImage(danhmuc.lstDanhMuc[index].imageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                      margin: const EdgeInsets.fromLTRB(24, 20, 23, 20),
                    ),
                   
                    Text(
                      danhmuc.lstDanhMuc[index].category,
                      style: const TextStyle(
                        fontFamily: 'Times New Roman',
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.pink,
                      ),
                    ),
                    const SizedBox(height: 20,)
                  ],
                ),
              ),
            );
          }),
        );
      }),
      const SizedBox(height: 30,)
      
      
    ]),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
           
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            
             BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: 'Danh Mục',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Tôi',
            ),
          ],
          backgroundColor: Colors.white,
          selectedItemColor: Colors.blue,
          currentIndex: 1,
          onTap: (index) {
            Navigator.push(
              context,
              PageRouteBuilder(pageBuilder: (context, animation, secon) {
                if (index == 0) {
                  return const Home();
                }
                if (index == 2) {
                  return const MyHome();
                }
                
                if(index==1){
                  return const Type();
                }
                return const MyHome();
              }),
            );
          },
        ),
      ),
    );
  }
}