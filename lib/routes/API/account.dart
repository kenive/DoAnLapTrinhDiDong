 
import 'dart:convert';  
import 'package:http/http.dart' as http;  
import '../models/account.dart';


Future<Account> fetchAcount(String a) async {
  final response = await http
      .get(Uri.parse('http://10.0.2.2:8000/api/login/$a'));

  if (response.statusCode == 200) {
   
    return  Account.fromJson(jsonDecode(response.body));
  } else {
    
    throw Exception('Failed to load');
  }
}