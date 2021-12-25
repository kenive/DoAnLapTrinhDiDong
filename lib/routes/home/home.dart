import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/banner.dart';
import '../models/producttype.dart';
import '../API/loaisanpham.dart';
import '../product/product.dart';
import 'test.dart';
import '../account/myhome.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  HomePage createState() => HomePage();
}

class HomePage extends State<Home> with SingleTickerProviderStateMixin {
  Future<List<DanhMuc>> list = fetchPostLoai();
 

  late PageController _pageController;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 1, viewportFraction: 0.8);
  }

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
    // ignore: non_constant_identifier_names
    var containerchude = Container(
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
          'Chủ Đề',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: "Times New Roman",
            color: Colors.red,
          ),
        ),
      ),
    );

    wrap(AsyncSnapshot abc) {
      return Wrap(
        children: List.generate(abc.data.length, (index) {
          return
          InkWell(
            onTap: (){
              Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PageProduct()));
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
                const SizedBox(height: 10,),
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
      
    }

    var listView = ListView(children: [
      _container,
      containerchude,
      Center(
        child: FutureBuilder<List<DanhMuc>>(
          future: list,
          builder: (context, abc) {
            if (abc.hasData) {
              return wrap(abc);
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
        appBar: appBar2,
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
