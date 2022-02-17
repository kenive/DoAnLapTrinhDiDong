import 'package:doan_mobile/routes/provider/providerinvoice.dart';
import 'package:doan_mobile/routes/provider/providerlogin.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PageChoNhan extends StatefulWidget {
  const PageChoNhan({Key? key}) : super(key: key);

  @override
  _PageChoNhanState createState() => _PageChoNhanState();
}

class _PageChoNhanState extends State<PageChoNhan> {
  @override
  Widget build(BuildContext context) {
    var lstinvoi = Provider.of<InvoiceProvider>(context, listen: false);
    var id = Provider.of<LoginProvider>(context, listen: false);
    lstinvoi.getInvoice(id.acc!.id, 1);
    
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
                      const SizedBox(height: 10,),
                      Container(
                        width: 450,
                        height: 220,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(35),
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
                                  'Chờ xác nhận',
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
                            const SizedBox(height: 10,),
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
                              children: [
                                const Text('Nhấp vào để xem chi tiết hóa đơn',style: TextStyle(fontSize: 10)),
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.red, // background
                                      onPrimary: Colors.white, // foreground
                                    ),
                                    onPressed: () {
                                      
                                      lstinvoi.updateStatus(lstinvoi.lstInvoise[index].id, 4);
                                      
                                      lstinvoi.getInvoice(id.acc!.id, 1);

                                    },
                                    child:const Text('Hủy đơn',
                                        style: TextStyle(fontSize: 10)))
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
