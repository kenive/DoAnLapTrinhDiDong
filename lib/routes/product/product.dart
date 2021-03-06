import 'package:doan_mobile/routes/models/producttype.dart';

import 'package:flutter/material.dart';

import '../API/sanpham.dart';
import '../models/product.dart';
import 'product_detail.dart';

class PageProduct extends StatefulWidget {
  //const PageProduct({Key? key}) : super(key: key);
  //final int product;
  // ignore: use_key_in_widget_constructors
  //const PageProduct({ required this.product}):super();
  final DanhMuc producttype;

  // ignore: use_key_in_widget_constructors
  const PageProduct({required this.producttype});

  @override
  ProductHome createState() => ProductHome();
}

class ProductHome extends State<PageProduct> {

  var containerchude = Container(
    height: 40,
    decoration: BoxDecoration(
      color: Colors.pink.shade100,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          color: Colors.pink.withOpacity(0.5),
          offset: const Offset(1, 3),
          blurRadius: 4,
          spreadRadius: 1,
        ),
      ],
    ),
    margin: const EdgeInsets.fromLTRB(10, 0, 180, 0),
    child: const Center(
      child: Text(
        'Danh Sách Sản Phẩm',
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          fontFamily: "Times New Roman",
          color: Colors.black,
        ),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    sanpham(AsyncSnapshot abc) {
      return Wrap(
        children: List.generate(abc.data.length, (index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => PageDetail(product: abc.data[index])));
            },
            child: Card(
              //color: Colors.white70,
              shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              shadowColor: Colors.red,

              elevation: 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const SizedBox(height: 20),
                  Hero(
                    tag: abc.data[index].id.toString(),
                    child: Container(
                      width: 230,
                      height: 230,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            offset: const Offset(1, 3),
                            blurRadius: 4,
                            spreadRadius: 1,
                          ),
                        ],
                        image: DecorationImage(
                          image: AssetImage(abc.data[index].imageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                      margin: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Sản phẩm: ${abc.data[index].name}',
                    style: const TextStyle(
                      fontFamily: 'Times New Roman',
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.pink,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Giá: ${ abc.data[index].price} VNĐ',
                    style: const TextStyle(
                      fontFamily: 'Times New Roman',
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.pink,
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          );
        }),
      );
    }

    var listView = ListView(children: [
      const SizedBox(height: 20),
      containerchude,
      const SizedBox(height: 20),
      Center(
        child: FutureBuilder<List<Product>>(
          future: fetchPostSanPham(widget.producttype.id),
          builder: (context, abc) {
            if (abc.hasData) {
              return sanpham(abc);
            } else if (abc.hasError) {
              return Text("${abc.error}");
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    ]);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.pink.shade50,
        appBar: AppBar(
          backgroundColor: Colors.pink.shade50,
          centerTitle: false,
          automaticallyImplyLeading: false,
          title: Container(
            decoration: BoxDecoration(
                color: Colors.pink.shade100,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  width: 1,
                  color:Colors.black
                ),
                
                ),
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
                color: Colors.red,
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
                iconSize: 25,
                color: Colors.white,
                splashColor: Colors.pink,
                onPressed: () {
                  Navigator.pushNamed(context, '/cart');
                },
              ),
            ),
          ],
        ),
        body: listView,
        //bottomNavigationBar: bottomNavigationBar2,
      ),
    );
  }
}
