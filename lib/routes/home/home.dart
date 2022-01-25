import 'package:doan_mobile/routes/API/search_sanpham.dart';
import 'package:doan_mobile/routes/product/product_detail.dart';
import 'package:doan_mobile/routes/provider/providerproduct.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../models/banner.dart';


//import '../API/loaisanpham.dart';
import '../product/product.dart';

import '../account/myhome.dart';
import '../provider/providerloaisanpham.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  HomePage createState() => HomePage();
}

class HomePage extends State<Home> with SingleTickerProviderStateMixin {
  //Future<List<DanhMuc>> list = fetchPostLoai();
  // ignore: unused_field
  late TabController _tabController;

  late PageController _pageController;
  String user = "";
  @override
  void initState() {
    super.initState();

    _pageController = PageController(initialPage: 1, viewportFraction: 0.8);
    _tabController = TabController(initialIndex: 0, length: 6, vsync: this);
  }

  chude(String a) {
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
            color: Colors.red,
          ),
        ),
      ),
    );
  }

  /* Widget _tab(String a) {
    return Tab(
      child: Text(
        a.toString(),
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  } */

  _movieSelector(int index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (BuildContext context, Widget? widget) {
        double value = 1;
        if (_pageController.position.haveDimensions) {
          value = (_pageController.page! - index);
          value = (1 - (value.abs() * 0.3) + 0.06).clamp(0, 1);
        }
        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) * 170,
            width: Curves.easeInOut.transform(value) * 400,
            child: widget,
          ),
        );
      },
      child: GestureDetector(
        child: Stack(
          children: [
            Center(
              child: Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0, 4),
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: Center(
                  child: Hero(
                    tag: banner[index].imgurl,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image(
                        image: AssetImage(banner[index].imgurl),
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<ProductProvider>(context, listen: false);
    pro.getNewProdct(1);
    var prods = Provider.of<SearchApi>(context, listen: false);
    prods.getAllProd();
    var danhmuc = Provider.of<CategoryProvider>(context, listen: false);
    danhmuc.getDanhMuc();
    // ignore: sized_box_for_whitespace
    var _container = Container(
      height: 230,
      //width: double.infinity,
      child: PageView.builder(
        controller: _pageController,
        itemCount: banner.length,
        itemBuilder: (BuildContext context, int index) {
          return _movieSelector(index);
        },
      ),
    );

    //hiện ra các chủ để trong danh mục

/*     wrap(AsyncSnapshot abc) {
      return Wrap(
        children: List.generate(abc.data.length, (index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          PageProduct(producttype: abc.data[index])));
            },
            child: Card(
              color: Colors.pink[50],
              elevation: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 170,
                    height: 170,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 7,
                          offset: const Offset(3, 2),
                        ),
                      ],
                      image: DecorationImage(
                        image: AssetImage(abc.data[index].imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                    margin: const EdgeInsets.fromLTRB(15, 20, 10, 20),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    abc.data[index].category,
                    style: const TextStyle(
                      fontFamily: 'Times New Roman',
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.pink,
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      );
    } */

    var listView = ListView(children: [
      _container,
      chude('Chủ Đề'),
      Consumer<CategoryProvider>(builder: (context, categoty, child) {
        return /* FutureBuilder(
          future: categoty.getAllCategory(),
          builder:
              (BuildContext context, AsyncSnapshot<List<DanhMuc>> abc) {
            if (abc.hasData) {
              return wrap(abc);
            } else if (abc.hasError) {
               return Text("${abc.error}");
            } else {
              return const CircularProgressIndicator();
            }
          }); */
            Wrap(
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
                color: Colors.pink[50],
                elevation: 0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 170,
                      height: 170,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
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
                      margin: const EdgeInsets.fromLTRB(15, 20, 10, 20),
                    ),
                    const SizedBox(
                      height: 10,
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
                  ],
                ),
              ),
            );
          }),
        );
      }),
      const SizedBox(
        height: 20,
      ),
      chude('Sản Phẩm Mới'),
      const SizedBox(
        height: 20,
      ),
      Consumer<ProductProvider>(
        builder: (_, value, child) {
          return SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Center(
              child: Column(
                children: [
                  Wrap(
                    direction: Axis.horizontal,
                    children: List.generate(pro.lstProduct.length, (index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => PageDetail(
                                      product: pro.lstProduct[index])));
                        },
                        child: Container(
                          margin: const EdgeInsets.all(5),
                          height: 250,
                          width: 190,
                         
                          decoration: BoxDecoration(
                             color: Colors.white70,
                             boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      offset: const Offset(3, 3),
                                      blurRadius: 4,
                                      spreadRadius: 1,
                                    )
                                  ],

                          ),
                          child: Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.all(5),
                                width: 150,
                                height: 150,
                                decoration: BoxDecoration(
                                  
                                  borderRadius: BorderRadius.circular(120),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      offset: const Offset(1, 3),
                                      blurRadius: 4,
                                      spreadRadius: 1,
                                    )
                                  ],
                                  image: DecorationImage(
                                    image: AssetImage(
                                        pro.lstProduct[index].imageUrl),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              Text(
                                pro.lstProduct[index].name,
                                style: const TextStyle(
                                  fontFamily: 'Times New Roman',
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.pink,
                                ),
                              ),
                              const SizedBox(height: 20),
                              Text(
                                'Giá: ${pro.lstProduct[index].price} VNĐ',
                                style: const TextStyle(
                                  fontFamily: 'Times New Roman',
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.pink,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  )
                ],
              ),
            ),
          );
        },
      ),
    ]);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.pink.shade50,
        appBar: AppBar(
          backgroundColor: Colors.pink.shade300,
          centerTitle: false,
          automaticallyImplyLeading: false,
          title: Container(
            decoration: BoxDecoration(
                color: Colors.pink.shade100,
                borderRadius: BorderRadius.circular(30),
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: Colors.pink,
                  ),
                ]),
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
            IconButton(
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
          ],
        ),
        body: listView,
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Tôi',
            ),
          ],
          backgroundColor: Colors.pink.shade300,
          selectedItemColor: Colors.blue,
          currentIndex: 0,
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
      ),
    );
  }
}
