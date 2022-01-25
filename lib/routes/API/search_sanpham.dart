import 'dart:convert';

import 'package:doan_mobile/routes/models/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SearchApi extends ChangeNotifier {
  List<Product> lstprod = [];
  List<Product> datasearch = [];
  Future<void> getAllProd() async {
    List<Product> lstTmp = [];
    String url = "http://10.0.2.2:8000/api/sanpham";
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      try{
      dynamic object = jsonDecode(response.body);
      dynamic data = object['lstprod'];
      data.forEach((item) {
        lstTmp.add(Product.fromJson(item));
      });
      lstprod = lstTmp;
      notifyListeners();
      //print(lstprod.length);
      // ignore: empty_catches
      }catch(e){

      }
    
    }
      
 

    
  }

  search(String name) {
    List<Product> lstSearch = [];
    for (var item in lstprod) {
      if (item.name.toLowerCase().contains(name.toLowerCase())) {
        lstSearch.add(item);
      }
    }
    if (lstSearch.isNotEmpty) {
      datasearch = lstSearch;
    } else {
      datasearch = [];
    }
    notifyListeners();
  }
}
