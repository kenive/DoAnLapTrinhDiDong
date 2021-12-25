 
import 'dart:convert';  
import 'package:http/http.dart' as http;  
import '../models/product.dart';

List<Product> sanphams(String response) {
  var list = jsonDecode(response);

  return list.map<Product>((model) => Product.fromJson(model)).toList(); 
}
Future<List<Product>>fetchPostSanPham() async {

  final response = await http.get(Uri.parse('http://10.0.2.2:8000/api/sanpham'));

  return sanphams(response.body);
}