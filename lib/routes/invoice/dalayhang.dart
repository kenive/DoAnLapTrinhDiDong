import 'package:doan_mobile/routes/provider/providerinvoice.dart';
import 'package:doan_mobile/routes/provider/providerlogin.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PageChoLay extends StatefulWidget {
  const PageChoLay({Key? key}) : super(key: key);

  @override
  _PageChoLayState createState() => _PageChoLayState();
}

class _PageChoLayState extends State<PageChoLay> {
  @override
  Widget build(BuildContext context) {
    var lstinvoi = Provider.of<InvoiceProvider>(context, listen: false);
    var id = Provider.of<LoginProvider>(context, listen: false);
    lstinvoi.getInvoice(id.acc!.id,2);
    return Scaffold(
      body: Consumer<InvoiceProvider>(builder: (_, value, child) {
        return SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: List.generate(lstinvoi.lstInvoise.length, (index) {
                  return InkWell(
                    onTap: (){
                      lstinvoi.getItem(lstinvoi.lstInvoise[index].id);
                      Navigator.pushNamed(context, 'detail');

                    },
                    child: Column(
                    children: [
                      Container(
                        width: 450,
                        height: 220,
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
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                Text('Trạng Thái'),
                                Text(
                                  'Đã lấy hàng',
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Text('Tên người đặt: '),
                                Text(lstinvoi.lstInvoise[index].nameShopping),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Text('Địa chỉ: '),
                                Text(lstinvoi.lstInvoise[index].addresshoping),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                 const Text('Số điện thoại: '),
                                Text(lstinvoi.lstInvoise[index].phoneshoping),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Text('Tổng tiền: '),
                                Text('${lstinvoi.lstInvoise[index].total} VNĐ'),
                              ],
                            ),

                            const SizedBox(height: 15,),
                            
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Text('Ngày lập hóa đơn: '),
                                Text(lstinvoi.lstInvoise[index].ngaplap),
                              ],
                            ),
                            const SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children:const [
                                 Text('Nhấp vào để xem chi tiết hóa đơn',style: TextStyle(fontSize: 10)),
                                
                              ],
                            ),
                            
                            
                           
                          ],
                        ),
                        margin: const EdgeInsets.all(5),
                      ),
                    ],
                  ),
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
    );
  }
}
