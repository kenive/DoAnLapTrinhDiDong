import 'package:doan_mobile/routes/provider/providercart.dart';
import 'package:doan_mobile/routes/provider/providerlogin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class PageCart extends StatefulWidget {
  const PageCart({Key? key}) : super(key: key);
  @override
  Cart createState() => Cart();
}

class Cart extends State<PageCart> {
  bool? ischeck = true;
  @override
  Widget build(BuildContext context) {
    var cartprov = Provider.of<CartProvider>(context, listen: false);
    var id = Provider.of<LoginProvider>(context, listen: false);
    cartprov.getItemCart(id.acc!.id);

    // var b = cartprov.total1;
    return Scaffold(
        backgroundColor: Colors.pink[50],
        appBar: AppBar(
          backgroundColor: Colors.pink[400],
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
            'Giỏ Hàng',
            style: TextStyle(color: Colors.black),),
            Lottie.network(
                'https://assets6.lottiefiles.com/private_files/lf30_x2lzmtdl.json',
                width: 100,
                height: 100,
                fit: BoxFit.contain,
              ),
          

            ],
          )
          /*  leading:IconButton(onPressed: (){
            Navigator.pop(context);
            cartprov.resetTotal();
          }, icon:const Icon(Icons.arrow_back_ios)) */
        ),
        body: Consumer<CartProvider>(builder: (_, value, child) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  children: List.generate(cartprov.lstCartItem.length, (index) {
                    return Container(
                      height: 130,
                      //width: 60,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(35.0),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black26,
                              offset: Offset(0, 2),
                              blurRadius: 20.0,
                            )
                          ]),
                      margin: const EdgeInsets.all(10),
                      child: Stack(alignment: Alignment.centerLeft, children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.all(3),
                              width: 130,
                              //height: 310,
                              //color: Colors.red,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(30.0),
                                  bottomLeft: Radius.circular(30.0),
                                ),
                                image: DecorationImage(
                                  image: AssetImage(
                                      cartprov.lstCartItem[index].image),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 10, top: 17),
                                  child: Text(
                                    cartprov.lstCartItem[index].name,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                    ),
                                    //overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 10, top: 17),
                                  child: Text(
                                    '${cartprov.lstCartItem[index].price.toString()} VNĐ',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).primaryColor,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Center(
                                        child: IconButton(
                                          onPressed: () {
                                            var acc = id.acc!.id;
                                            var product = cartprov
                                                .lstCartItem[index].productid;

                                            if (cartprov.lstCartItem[index]
                                                    .quantily >
                                                1) {
                                              cartprov.truCart(acc, product, 1);
                                            }
                                          },
                                          icon: const Icon(Icons.remove),
                                          iconSize: 15,
                                          //splashColor: Colors.grey,
                                        ),
                                      ),
                                      margin: const EdgeInsets.only(
                                          left: 10, top: 18),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, top: 18),
                                      child: Text(
                                        cartprov.lstCartItem[index].quantily
                                            .toString(),
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).primaryColor,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Center(
                                        child: IconButton(
                                          onPressed: () {
                                            var id1 = id.acc!.id;
                                            var pro = cartprov
                                                .lstCartItem[index].productid;

                                            cartprov.addCart(id1, pro, 1);
                                          },
                                          icon: const Icon(Icons.add),
                                          iconSize: 15,
                                          //splashColor: Colors.pink[200],
                                        ),
                                      ),
                                      margin: const EdgeInsets.only(
                                          left: 10, top: 18),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                child: IconButton(
                                  onPressed: () {
                                    cartprov.removeCart(
                                        cartprov.lstCartItem[index].id,
                                        id.acc!.id);
                                  },
                                  icon: const Icon(Icons.delete),
                                  iconSize: 30,
                                  splashColor: Colors.pink[200],
                                  color: Colors.red,
                                ),
                              ),
                              margin: const EdgeInsets.only(left: 20, top: 40),
                            ),
                          ],
                        ),
                      ]),
                    );
                  }),
                ),
                const SizedBox(
                  height: 80,
                ),
              ],
            ),
          );
        }),
        bottomSheet: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
                color: Colors.green,
                height: 70,
                width: 290,

                // ignore: deprecated_member_use
                child: Stack(
                  children: [
                    const Positioned(
                        top: 5,
                        child: Text(
                          'Tổng Thanh Toán:',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Times New Roman',
                              fontSize: 20),
                        )),
                    Positioned(
                        top: 35,
                        left: 120,
                        child: Consumer<CartProvider>(
                          builder: (_, value, child) {
                            return Text(
                              '${cartprov.total1} VNĐ',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Times New Roman',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            );
                          },
                        ))
                  ],
                )),
            Container(
              height: 70,
              width: 120,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(70)),
              // ignore: deprecated_member_use
              child: FlatButton(
                color: Colors.red[800],
                onPressed: () {
                  if (cartprov.lstCartItem.isEmpty) {
                    showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Thông Báo'),
                            content: const Text('Giỏ hàng trống!!'),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'OK'),
                                child: const Text('OK'),
                              ),
                            ],
                          );
                        });
                  }else{
                    Navigator.pushNamed(context, 'pay');

                  }
                  
                },
                child: const Text(
                  'Mua ngay',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Times New Roman',
                      fontSize: 17),
                ),
              ),
            ),
          ],
        ));
  }
}
