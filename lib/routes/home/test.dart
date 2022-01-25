





import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
var appBar2 = AppBar(
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
            
          },
        ),
      ],
    );

Widget bottomNavigationBar2 = BottomNavigationBar(

      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          // ignore: deprecated_member_use
          title: Text('Home'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          // ignore: deprecated_member_use
          title: Text('Tôi'),
          
        ),
      ],
      /* currentIndex:0,
      onTap: (index){
        Navigator.push(context,
        PageRouteBuilder(
          pageBuilder:(context(),) 
          
          ),
          
          ); */

     
    );



 
 
 

