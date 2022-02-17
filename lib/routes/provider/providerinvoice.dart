import 'dart:convert';
//import 'package:doan_mobile/routes/models/invoice.dart';
//import 'package:doan_mobile/routes/models/cart_item.dart';
import 'package:doan_mobile/routes/models/invoice.dart';
import 'package:doan_mobile/routes/models/oder_item.dart';
import 'package:flutter/cupertino.dart';

import 'package:http/http.dart' as http;

class InvoiceProvider extends ChangeNotifier {
  

  invoice(String name, String ress, String phone, double tatol, int account,
      int status) async {
    String url = "http://10.0.2.2:8000/api/invoice";
    final response = await http.post(Uri.parse(url), body: {
      'name': name.toString(),
      'address': ress.toString(),
      'phone': phone.toString(),
      'tatol': tatol.toString(),
      'accountid': account.toString(),
      'status': status.toString(),
    });
    if (response.statusCode == 200) {
      try {
        // ignore: unused_local_variable
        dynamic data = jsonDecode(response.body);
        // ignore: empty_catches
      } catch (e) {}
    }
    notifyListeners();
  }

  List<Invoice> lstInvoise = [];

  getInvoice(int id, int status) async {
    String url = "http://10.0.2.2:8000/api/invoice/$id/$status";
    final response = await http.get(Uri.parse(url));

    List<Invoice> tmp = [];
    if (response.statusCode == 200) {
      try {
        dynamic object = jsonDecode(response.body);
        dynamic data = object['lstinvoice'];
        data.forEach((item) {
          tmp.add(Invoice.fromJson(item));
        });
      } catch (e) {
        //print(e);
      }
      lstInvoise = tmp;
      notifyListeners();
    }
  }

  updateStatus(int id, int status) async {
    String url = "http://10.0.2.2:8000/api/invoice/updatestatus/$id";
    final response = await http.put(
      Uri.parse(url),
      body: jsonEncode(<String, String>{'status': status.toString()}),
      headers: <String, String>{
        'content-type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      try {
        // ignore: unused_local_variable
        dynamic object = jsonDecode(response.body);
        // ignore: unused_local_variable
        dynamic data = object['ds'];

        // ignore: empty_catches
      } catch (e) {}
    }
    notifyListeners();
  }

  List<OderItem> lstOder = [];


  Future<void> getItem(int id) async {
    
    List<OderItem> lstTmp = [];
    String url = "http://10.0.2.2:8000/api/getinvoicedetail/$id";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      try {
        dynamic object = jsonDecode(response.body);
        dynamic data = object['detail'];
        data.forEach((item) {
          lstTmp.add(OderItem.fromJson(item));
        });
      } catch (e) {
        //print(e);
      }
      lstOder = lstTmp;

      //print(lstTmp.length);
      notifyListeners();
    }
  }
  
  Future<void> mualai(int id) async {
    /* List<CartItem> lstTmp = [];
    int tmpTotal = 0; */
    String url = "http://10.0.2.2:8000/api/mualai/$id";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      try {
        dynamic object = jsonDecode(response.body);
        // ignore: unused_local_variable
        dynamic data = object['lstCartItem'];
        
      } catch (e) {
        //print(e);
      }
      /* lstCartItem = lstTmp;
      total1 = tmpTotal; */
      //print(lstTmp.length);
      notifyListeners();
    } else {
      //print('get cart item faild');
    }
  }

/*   Invoice? iv;
  gethd(int id) async {
    late Invoice tmp;
    final response = await http.get(
      Uri.parse('http://10.0.2.2:8000/api/gethd/$id'),
    );

    if (response.statusCode == 200) {
      try {
        dynamic data = jsonDecode(response.body);
        dynamic result = data['lsthd'];
        tmp = Invoice.fromJson(result);
        iv = tmp;
        notifyListeners();
      } catch (e)
      // ignore: empty_catches
      {}
    }
    return iv;
  } */
}
