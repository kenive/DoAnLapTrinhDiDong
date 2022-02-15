import 'package:doan_mobile/routes/provider/providersearch.dart';
import 'package:doan_mobile/routes/product/product_detail.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController cc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var prods = Provider.of<SearchApi>(context, listen: false);
    return Scaffold(
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
            keyboardType: TextInputType.text,
            controller: cc,
            onChanged: (value) {
              value = cc.text;
              if (value != "") {
                prods.search(value);
              }
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
      body: Consumer<SearchApi>(
        builder: (_, value, child) {
          return SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Center(
              child: Column(
                children: [
                  Wrap(
                    direction: Axis.horizontal,
                    children: List.generate(prods.datasearch.length, (index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => PageDetail(
                                      product: prods.datasearch[index])));
                        },
                        child: Container(
                          margin: const EdgeInsets.all(5),
                          height: 250,
                          width: 190,
                          color: Colors.pink[50],
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
                                        prods.datasearch[index].imageUrl),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              Text(
                                prods.datasearch[index].name,
                                style: const TextStyle(
                                  fontFamily: 'Times New Roman',
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.pink,
                                ),
                              ),
                              const SizedBox(height: 20),
                              Text(
                                'Giá: ${prods.datasearch[index].price} VNĐ',
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
    );
  }
}
