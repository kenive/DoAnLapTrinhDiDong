 
import 'dart:convert';  
import 'package:http/http.dart' as http;  
import '../models/producttype.dart';

List<DanhMuc> danhmucs(String response) {
  var list = jsonDecode(response);

  return list.map<DanhMuc>((model) => DanhMuc.fromJson(model)).toList();
  //return list.map((model)=>DanhMuc.fromJson(model));
}

Future<List<DanhMuc>> fetchPostLoai() async {

  final response = await http.get(Uri.parse('http://10.0.2.2:8000/api/danh-muc'));
  
  return danhmucs(response.body);
}