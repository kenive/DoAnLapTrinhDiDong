import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:doan_mobile/routes/models/product.dart';

import 'package:http/http.dart' as http;

class ProductProvider extends ChangeNotifier {
  List<Product> lstProduct = [];

  Future<void> getNewProdct(int id) async {
    final reponse =
        await http.get(Uri.parse("http://10.0.2.2:8000/api/sanpham/new/$id"));
    List<Product> tmp = [];
    if (reponse.statusCode == 200) {
      try {
        dynamic object = jsonDecode(reponse.body);
        dynamic data = object['lstproduct'];
        data.forEach((item) {
          tmp.add(Product.fromJson(item));
        });
        // ignore: empty_catches
      } catch (e) {}
    }
    lstProduct = tmp;

    notifyListeners();
  }

  List<Product> lstProduct1 = [];
  Future<void> getProdctId(int id) async {
    final reponse =
        await http.get(Uri.parse("http://10.0.2.2:8000/api/sanpham/loai/$id"));
    List<Product> tmp1 = [];
    if (reponse.statusCode == 200) {
      try {
        dynamic object = jsonDecode(reponse.body);
        dynamic data = object['lstproduct'];
        data.forEach((item) {
          tmp1.add(Product.fromJson(item));
        });
        lstProduct1 = tmp1;

        notifyListeners();
        // ignore: empty_catches
      } catch (e) {}
    }
  }
}
