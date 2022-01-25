 
import 'dart:convert';  
import 'package:http/http.dart' as http;  
import '../models/product.dart';


Future<List<Product>>fetchPostSanPham(int id) async {

  final response = await http.get(Uri.parse('http://10.0.2.2:8000/api/sanpham/loai/$id'));

if(response.statusCode==200){
  

    var list = jsonDecode(response.body);
return list.map<Product>((model) => Product.fromJson(model)).toList(); 
  
  
}else{
  throw Exception('no found');
}


  
}


