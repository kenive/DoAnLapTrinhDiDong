import 'package:doan_mobile/routes/provider/providercart.dart';
import 'package:doan_mobile/routes/provider/providerinvoice.dart';
import 'package:doan_mobile/routes/provider/providerlogin.dart';
//import 'package:doan_mobile/routes/provider/providerlogin.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PagePay extends StatefulWidget {
  const PagePay({Key? key}) : super(key: key);

  @override
  _PagePayState createState() => _PagePayState();
}

enum PhuongThuc { khigiao, khac }
PhuongThuc _phuongthuc = PhuongThuc.khigiao;


class _PagePayState extends State<PagePay> {
  TextEditingController txtname = TextEditingController();
  TextEditingController txtaddress = TextEditingController();
  TextEditingController txtphone = TextEditingController();

  // ignore: non_constant_identifier_names

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //var a = Provider.of<LoginProvider>(context, listen: false);
    var cart = Provider.of<CartProvider>(context, listen: false);
     // ignore: unused_local_variable
     var invoi = Provider.of<InvoiceProvider>(context, listen: false);
     // ignore: unused_local_variable
     var acc = Provider.of<LoginProvider>(context, listen: false);
     cart.total1;


    return Scaffold(
      backgroundColor: Colors.pink[50],
      appBar: AppBar(
        title: const Text('Thanh Toán'),
      ),
      body:Consumer<CartProvider>(builder: (context, value, child){
        return SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 130,
              //width: 200,
              //color: Colors.red,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.pink.shade100,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    offset: const Offset(0, 5),
                    blurRadius: 7,
                    spreadRadius: 3,
                  ),
                ],
              ),
              margin: const EdgeInsets.all(5),
              child: InkWell(
                onTap: () {
                  showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) {
                        return Dialog(
                          //title: Text('Sửa Thông tin'),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  child: const Text(
                                    'Thông Tin Nhận Hàng',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  margin: const EdgeInsets.only(
                                      top: 20, bottom: 20),
                                ),
                                TextFormField(
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(Icons.info),
                                    border: OutlineInputBorder(),
                                    labelText: 'Tên Người Nhận',
                                  ),
                                  controller: txtname,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(Icons.info),
                                    border: OutlineInputBorder(),
                                    labelText: 'Số Điện Thoại',
                                  ),
                                  controller: txtphone,
                                  keyboardType:TextInputType.number,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(Icons.info),
                                    border: OutlineInputBorder(),
                                    labelText: 'Địa Chỉ Nhận Hàng',
                                  ),
                                  controller: txtaddress,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        /* Navigator.of(context).pop(txtname.text);
                                Navigator.of(context).pop(txtaddress.text);
                                Navigator.of(context).pop(txtphone.text); */
                                        
                                        //Navigator.pushNamed(context, 'pay');
                                        cart.address(txtname.text, txtphone.text,txtaddress.text);
                                        Navigator.pop(context, 'OK');

                                      },
                                      child: const Text('OK'),
                                    ),
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(context, 'Cancel'),
                                      child: const Text('Cancel'),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 50,
                          color: Colors.pink.shade100,
                          child: const Icon(
                            Icons.place,
                            size: 20,
                            color: Colors.red,
                          ),
                          margin: const EdgeInsets.only(left: 10),
                        ),
                        Text(
                          'Địa chỉ nhận hàng:${cart.address1} ',
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.red),
                        ),
                      ],
                    ),

                    //const SizedBox(width: 20,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:  [
                        Text(
                          'Tên người nhận hàng:${cart.name1} ',
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Số điện thoại: ${cart.phone1} ',
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Địa chỉ: ${cart.address1} ',
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: const [
                SizedBox(
                  width: 10,
                ),
                Icon(Icons.inventory_2),
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Sản phẩm Đã Chọn',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                      fontSize: 20),
                ),
              ],
            ),
            Wrap(
              children: List.generate(
                cart.lstCartItem.length,
                (index) {
                  return Container(
                    height: 100,
                    width: 400,
                    //color: Colors.white,
                    decoration: BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        offset: const Offset(3, 3),
                        blurRadius: 4,
                        spreadRadius: 1,
                      ),
                    ]),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(cart.lstCartItem[index].image),
                              fit: BoxFit.cover,
                            ),
                          ),
                          margin: const EdgeInsets.only(left: 10),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(cart.lstCartItem[index].name),
                            Text('x ${cart.lstCartItem[index].quantily}'),
                            Text(
                              '${cart.lstCartItem[index].price} VNĐ',
                              style: const TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        )
                      ],
                    ),
                    margin: const EdgeInsets.only(top: 5, bottom: 10),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  'Tổng Thanh Toán: ',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 30,
                ),
                Text('${cart.total1} VNĐ',
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.red)),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 20, left: 10),
                  child: const Text(
                    'Phương thức thanh toán',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                ListTile(
                    title: const Text('Thanh toán khi nhận hàng'),
                    leading: Radio<PhuongThuc>(
                      groupValue: _phuongthuc,
                      value: PhuongThuc.khigiao,
                      onChanged: (PhuongThuc? value) {
                        setState(() {
                          _phuongthuc = value!;
                        });
                      },
                    )),
                ListTile(
                    title: const Text('Khác'),
                    leading: Radio<PhuongThuc>(
                      groupValue: _phuongthuc,
                      value: PhuongThuc.khac,
                      onChanged: (PhuongThuc? value) {
                        setState(() {
                          _phuongthuc = value!;
                        });
                      },
                    )),
              ],
            ),
            const SizedBox(
              height: 70,
            ),
          ],
        ),
      );
      } ,),
      bottomSheet: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
              height: 60,
              width: 260,
              decoration: const BoxDecoration(),
              // ignore: deprecated_member_use

              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text('Tổng Thanh Toán '),
                  Text(
                    '${cart.total1} VNĐ',
                    style: const TextStyle(
                        fontSize: 15,
                        color: Colors.red,
                        fontWeight: FontWeight.bold),
                  )
                ],
              )),
          Container(
            height: 60,
            width: 150,
            decoration: const BoxDecoration(),
            // ignore: deprecated_member_use
            child: FlatButton(
              color: Colors.red,
              onPressed: () {

                if(cart.address1.isEmpty||cart.name1.isEmpty||cart.phone1.isEmpty){
                   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Vui lòng nhập đầy đủ địa chỉ nhận hàng'),
                    ));
                }else{
                  invoi.invoice(cart.name1,cart.address1, cart.phone1, cart.total1.toDouble(), acc.acc!.id, 1);
                  Navigator.pushNamed(context, 'paystatus');
                  
                }
                
              },
              child: const Text(
                'Đặt Hàng',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
