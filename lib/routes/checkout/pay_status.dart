
import 'package:flutter/material.dart';

class PageStatus extends StatefulWidget {
  const PageStatus({ Key? key }) : super(key: key);

  @override
  _PageStatusState createState() => _PageStatusState();
}

class _PageStatusState extends State<PageStatus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
            padding:  EdgeInsets.only(bottom: 20),
            child: Text('Đặt Hàng Thành Công',style: TextStyle(color: Colors.red,fontSize: 20,fontWeight: FontWeight.bold),)
          ),

          // ignore: deprecated_member_use
          RaisedButton(
            
            child: const Text(
              'Quay Về Màn Hình Home',
              style: TextStyle(fontSize: 20,color: Colors.white),
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/second');
             
            },
            color: Colors.blue,
          ),
          const SizedBox(height: 20,),
          // ignore: deprecated_member_use
          RaisedButton(
            color: Colors.blue,
            child: const Text(
              'Xem Đơn Hàng',
              style: TextStyle(fontSize: 20,color: Colors.white),
            ),
            onPressed: () {
              Navigator.pushNamed(context, 'invoice');
             
            },
          ),

          ],
        ),
         
        
        
      ),
      
    );
  }
}