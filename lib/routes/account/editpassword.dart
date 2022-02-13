import 'dart:convert';

import 'package:doan_mobile/routes/provider/providerlogin.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class PageEditPw extends StatefulWidget {
  const PageEditPw({Key? key}) : super(key: key);
  @override
  Password createState() => Password();
}

class Password extends State<PageEditPw> {
  // ignore: prefer_typing_uninitialized_variables
  var id;
  TextEditingController txtPassword = TextEditingController();
  TextEditingController txtNewPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var a = Provider.of<LoginProvider>(context, listen: false);
    id = a.acc!.id;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.pink[50],
        appBar: AppBar(
          backgroundColor: Colors.pink[200],
          title: const Text(
            'Thây đổi mật khẩu',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: ListView(
          children: [
            // ignore: avoid_unnecessary_containers
            Container(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 400,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.pink.shade100,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.info),
                          border: OutlineInputBorder(),
                          labelText: 'Nhập Password cũ',
                        ),
                        controller: txtPassword,
                      ),
                      margin: const EdgeInsets.fromLTRB(30, 30, 30, 0),
                    ),
                    Container(
                      width: 400,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.pink.shade100,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.info),
                          border: OutlineInputBorder(),
                          labelText: 'Nhập Password Mới',
                        ),
                        controller: txtNewPassword,
                      ),
                      margin: const EdgeInsets.fromLTRB(30, 30, 30, 0),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    // ignore: deprecated_member_use
                    FlatButton(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 50),
                      color: Colors.red,
                      onPressed: () {
                        if (txtNewPassword.text.length < 6) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text('Mật khẩu phải trên 5 kí tự'),
                          ));
                        } else {
                          editpass();
                        }
                      },
                      child: const Text(
                        'Cập nhật',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Times New Roman',
                            fontSize: 20),
                      ),
                      shape: const StadiumBorder(),
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> editpass() async {
    final response = await http.put(
      Uri.parse('http://10.0.2.2:8000/api/account/editpassword/$id'),
      body: jsonEncode(<String, String>{
        'password': txtPassword.text.trim(),
        'newpassword': txtNewPassword.text.trim(),
      }),
      headers: <String, String>{
        'content-type': 'application/json; charset=UTF-8',
      },
    );
    var check = jsonDecode(response.body);

    if (check['sucsses']) {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Thông Báo'),
              content: const Text(
                'cập nhật thành công, Ok để quay lại màn hình đăng nhập',
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    var a = Provider.of<LoginProvider>(context, listen: false);
                    a.acc = null;

                    Navigator.pushNamed(context, '/login');
                  },
                  child: const Text('OK'),
                ),
                /* TextButton(
                onPressed: () => Navigator.pop(context, 'Cancel'),
                child: const Text('Cancel'),
              ), */
              ],
            );
          });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Nhập sai mật khẩu cũ'),
      ));
    }
  }
}
