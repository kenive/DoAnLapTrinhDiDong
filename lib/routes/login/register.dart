import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:form_field_validator/form_field_validator.dart';
import 'dart:convert';

class PageRegister extends StatefulWidget {
  const PageRegister({Key? key}) : super(key: key);
  @override
  Register createState() => Register();
}

class Register extends State<PageRegister> {
  // ignore: unused_field
  late bool _passwordVisible;

  final txtTenDangNhap = TextEditingController();
  final txtMatKhau = TextEditingController();
  final txtEmail = TextEditingController();

  @override
  // ignore: must_call_super
  void initState() {
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Đăng Kí'),
          backgroundColor: Colors.pink[200],
        ),
        backgroundColor: Colors.pink[50],
        body: Center(
          child: Stack(
            children: [
              Container(
                //width: double.infinity,
                //height: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.pink.shade100,
                      Colors.pink.shade200,
                      Colors.pink.shade100,
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 5,
                left: 30,
                child: Container(
                  height: 450,
                  width: 350,
                  decoration: BoxDecoration(
                    color: Colors.pink.shade100,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        offset: const Offset(0, 3),
                        blurRadius: 7,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  //margin: const EdgeInsets.fromLTRB(10, 0, 250, 0),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Form(
                      // ignore: deprecated_member_use
                      autovalidate: true,

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'SHOP KEN',
                            style: TextStyle(
                              //color: Colors.pink,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              foreground: Paint()
                                ..style = PaintingStyle.stroke
                                ..strokeWidth = 2
                                ..color = Colors.pink.shade700,
                            ),
                          ),

                         /*  Container(
                            width: 300,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(0),
                            ),
                            child:  */TextFormField(
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.info),
                                border: OutlineInputBorder(),
                                labelText: 'Tên đăng nhập',
                              ),
                              keyboardType: TextInputType.text,
                              controller: txtTenDangNhap,
                              /* validator: MinLengthValidator(5,
                                  errorText: 'Vui lòng nhập trên 4 kí tự'), */
                            ),
                          /* ), */

                         /*  Container(
                            width: 300,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.pink.shade100,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: */ TextFormField(
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.lock),
                                border: OutlineInputBorder(),
                                labelText: 'Mật Khẩu',
                              ),
                              controller: txtMatKhau,
                              keyboardType: TextInputType.text,
                             /*  validator: MinLengthValidator(5,
                                  errorText: 'Vui lòng nhập trên 4 kí tự'), */
                            ),
                         /*  ), */

                         /*  Container(
                            width: 300,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.pink.shade100,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child:  */TextFormField(
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.email),
                                border: OutlineInputBorder(),
                                //validator: EmailValidator(errorText: 'enter a valid email address'),
                                labelText: 'Email',
                              ),
                              controller: txtEmail,
                              validator: EmailValidator(
                                  errorText: 'Vui lòng nhập đúng định dạng'),
                            ),
                         /*  ), */

                          // ignore: deprecated_member_use
                          FlatButton(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 65),
                            color: Colors.red,
                            onPressed: () {
                              if (txtTenDangNhap.text.length >= 6 &&
                                  txtMatKhau.text.length >= 6 &&
                                  txtEmail.text.isNotEmpty) {
                                register();
                              } else if(txtTenDangNhap.text.length < 6 &&
                                  txtMatKhau.text.length < 6 ){
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content:
                                      Text('Mật khẩu hoặc tên đăng nhập không được dưới 6 kí tự'),
                                ));
                              }
                            },
                            child: const Text(
                              'Đăng Kí',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Times New Roman',
                                  fontSize: 20),
                            ),
                            shape: const StadiumBorder(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> register() async {
    final response = await http.post(
      Uri.parse('http://10.0.2.2:8000/api/account/register'),
      body: jsonEncode(<String, String>{
        'name': txtTenDangNhap.text.trim(),
        'password': txtMatKhau.text.trim(),
        'email': txtEmail.text.trim(),
      }),
      headers: <String, String>{
        'content-type': 'application/json; charset=UTF-8',
      },
    );
    var check = jsonDecode(response.body);

    if (check['sucsses']) {
      Navigator.pushNamed(context, '/login');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Tên đăng nhập đã tồn tại'),
      ));
    }
  }
}
