import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product.dart';

Future<List<Product>> fetchPostSanPham(int id) async {
  final response =
      await http.get(Uri.parse('http://10.0.2.2:8000/api/sanpham/loai/$id'));
// ignore: prefer_typing_uninitialized_variables
  dynamic a;
  if (response.statusCode == 200) {
    try {
      var list = jsonDecode(response.body);
      a = list;
      // ignore: empty_catches
    } catch (e) {}

    return a.map<Product>((model) => Product.fromJson(model)).toList();
  }
  return a; 
}
