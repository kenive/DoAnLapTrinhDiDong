import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../models/account.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  Account? acc;

  fethlogin(a, b) async {
    late Account tmp;

    final response = await http.post(
        Uri.parse('http://10.0.2.2:8000/api/login'),
        body: ({'name': a, 'password': b}));
    if (response.statusCode == 200) {
      try {
        dynamic data = jsonDecode(response.body);
        dynamic result = data['acc'];

        tmp = Account.fromJson(result);

        acc = tmp;
        notifyListeners();
      } catch (e)
      // ignore: empty_catches
      {}
    }
    return acc;
  }
  var google=GoogleSignIn();
  GoogleSignInAccount? gg;
    login1()async{
    final gg1=await google.signIn();
    if(gg1== null){
      return;
    }
    gg=gg1;
    notifyListeners();

  }
  logout1()async{
    gg=await google.signOut();
    notifyListeners();

  }
}
