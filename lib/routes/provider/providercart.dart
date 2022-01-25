import 'dart:convert';

import 'package:doan_mobile/routes/models/cart_item.dart';
import 'package:flutter/cupertino.dart';

import 'package:http/http.dart' as http;

class CartProvider extends ChangeNotifier {
  String name1="";
  String phone1="";
  String address1="";
  List<CartItem> lstCartItem = [];
  var total1 = 0;
  
  Future<void> getItemCart(int id) async {
    List<CartItem> lstTmp = [];
    int tmpTotal = 0;
    String url = "http://10.0.2.2:8000/api/getcart/$id";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      try {
        dynamic object = jsonDecode(response.body);
        dynamic data = object['lstCartItem'];
        data.forEach((item) {
          lstTmp.add(CartItem.fromJson(item));
        });
        dynamic getTotal = object['total'];
          tmpTotal = getTotal;
      } catch (e) {
        //print(e);
      }
      lstCartItem = lstTmp;
      total1 = tmpTotal;
      //print(lstTmp.length);
      notifyListeners();
    } else {
      //print('get cart item faild');
    }
  }

  addCart(int accountid, int productid, int quantity) async {
    //List<CartItem> lstTmp = [];
    String url = "http://10.0.2.2:8000/api/addcart";

    final response = await http.post(Uri.parse(url), body: {
      'accountId': accountid.toString(),
      'productId': productid.toString(),
      'quantity': quantity.toString(),
    });
    if (response.statusCode == 200) {
      try {
        // ignore: unused_local_variable
        dynamic object = jsonDecode(response.body);
        //dynamic data = object['success'];
      } catch (e) {
        //print(e);
      }
      getItemCart(accountid);

      notifyListeners();
    } else {
      //print('addcart faild');
    }
  }
  truCart(int accountid, int productid, int quantity) async {
    //List<CartItem> lstTmp = [];
    String url = "http://10.0.2.2:8000/api/remove";

    final response = await http.post(Uri.parse(url), body: {
      'accountId': accountid.toString(),
      'productId': productid.toString(),
      'quantity': quantity.toString(),
    });
    if (response.statusCode == 200) {
      try {
        // ignore: unused_local_variable
        dynamic object = jsonDecode(response.body);
        //dynamic data = object['success'];
      } catch (e) {
        //print(e);
      }
      getItemCart(accountid);
      notifyListeners();
    } else {
      //print('addcart faild');
    }
  }

  void removeCart(int id, int acc) async {
    //lstCartItem.removeAt(id);
    String url = "http://10.0.2.2:8000/api/deletecart/$id";

    // ignore: unused_local_variable
    final response = await http.delete(Uri.parse(url), body: {
      'id': id.toString(),
      
    });
    if(response.statusCode==200){
      try{
        getItemCart(acc);
    notifyListeners();

      // ignore: empty_catches
      }catch(e){

      }
    }
   
  }
  void address(String name, String sdt, String dc ){

  
    // ignore: unnecessary_this
    this.name1=name;
    // ignore: unnecessary_this
    this.address1=dc;
    // ignore: unnecessary_this
    this.phone1=sdt;
    notifyListeners();

  }
}
