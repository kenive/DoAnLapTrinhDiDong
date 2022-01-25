
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import '../models/producttype.dart';
import 'package:http/http.dart' as http;

class CategoryProvider extends ChangeNotifier {
  
  /* Future<List<DanhMuc>> getAllCategory() async {
    try {
      return await fetchPostLoai();
    } catch (e) {
      throw ("Could not get list Categories");
    }
  } */
  
 List<DanhMuc> lstDanhMuc = [];

  Future<void> getDanhMuc() async{

    final reponse=await http.get(Uri.parse("http://10.0.2.2:8000/api/danh-muc"));
    List<DanhMuc> tmp = [];
    if (reponse.statusCode == 200) {
     try{
        dynamic object = jsonDecode(reponse.body);
        dynamic data = object['lstdanhmuc'];
        data.forEach((item) {
          tmp.add(DanhMuc.fromJson(item));
        });
     // ignore: empty_catches
     }catch(e){

     }
        
      } 
      lstDanhMuc = tmp;

      notifyListeners();
    
   

  }
 

}
