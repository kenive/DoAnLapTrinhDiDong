import 'dart:convert';

import 'package:flutter/cupertino.dart';
import '../models/account.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  Account? acc;

  Future<Account?> fethlogin(a, b) async {
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
}
