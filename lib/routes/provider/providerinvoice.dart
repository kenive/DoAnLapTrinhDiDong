
import 'dart:convert';
//import 'package:doan_mobile/routes/models/invoice.dart';
import 'package:flutter/cupertino.dart';

import 'package:http/http.dart' as http;

class InvoiceProvider extends ChangeNotifier{


  invoice(String ress,String phone,double tatol,int account,int status) async{

    String url="http://10.0.2.2:8000/api/invoice";
    final response=await http.post(Uri.parse(url),body: {
      'address':ress.toString(),
      'phone':phone.toString(),
      'tatol':tatol.toString(),
      'accountid':account.toString(),
      'status':status.toString(),
    });
    if(response.statusCode==200){
      
      try{
        // ignore: unused_local_variable
        dynamic data = jsonDecode(response.body);
      // ignore: empty_catches
      }catch(e){

      }
      
    }
    notifyListeners();

  }
  deleteAllCart(int id) async{
    String url="http://10.0.2.2:8000/api/deleteAllcart/$id";
    final response=await http.delete(Uri.parse(url));
    if(response.statusCode==200){
      
    }

    notifyListeners();

  }
  updatequantity(int idproduct,int quantity)async{
    String url="http://10.0.2.2:8000/api/product/$idproduct";
    final response=await http.put(Uri.parse(url),body:{
       'quantity': quantity.toString(),

    } );

    if(response.statusCode==200){

    }
    notifyListeners();


  }

}