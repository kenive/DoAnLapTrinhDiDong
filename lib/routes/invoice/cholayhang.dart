import 'package:flutter/material.dart';

class PageChoLay extends StatefulWidget {
  const PageChoLay({ Key? key }) : super(key: key);

  @override
  _PageChoLayState createState() => _PageChoLayState();
}

class _PageChoLayState extends State<PageChoLay> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
         Container(
          width: 420,
          height: 100,
        
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
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children:const [
                   Text('Trạng Thái'),
              Text('Đã lấy hàng',style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),)

                ],)
              
            ],
          ),
          margin:const EdgeInsets.all(5),

        ) , 
        
          

        ],
        
      ),
    );
  }
}