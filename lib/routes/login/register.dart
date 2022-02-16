import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
//import 'package:form_field_validator/form_field_validator.dart';
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
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Đăng Kí'),
          backgroundColor: Colors.pink[100],
        ),
        backgroundColor: Colors.white,
        body:Center(
            child: SingleChildScrollView(
              // ignore: avoid_unnecessary_containers
              child: Container(
                //color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(35),
                  child: Form(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                          SizedBox(
                        height: 150,
                        child: Image.asset(
                          "images/cute2.jpg",
                          fit: BoxFit.contain,
                        )),
                        Text(
                          'KEN SHOP',
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
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                            autofocus: false,
                            controller: txtTenDangNhap,
                            textInputAction: TextInputAction.done,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.info),
                              contentPadding:
                                  const EdgeInsets.fromLTRB(20, 15, 20, 15),
                              hintText: "Tên đăng nhập",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            )),
                            const SizedBox(height: 20),
                        TextFormField(
                          autofocus: false,
                          controller: txtMatKhau,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.lock),
                            contentPadding:
                                const EdgeInsets.fromLTRB(20, 15, 20, 15),
                            hintText: "Mật khẩu",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                            autofocus: false,
                            controller: txtEmail,
                            keyboardType: TextInputType.emailAddress,
                            
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.email),
                              contentPadding:
                                  const EdgeInsets.fromLTRB(20, 15, 20, 15),
                              hintText: "Email",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),

                            )),
                            
                        const SizedBox(height: 20),
                        Material(
                          elevation: 5,
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.redAccent,
                          child: MaterialButton(
                              padding:
                                  const EdgeInsets.fromLTRB(20, 15, 20, 15),
                              minWidth: MediaQuery.of(context).size.width,
                              onPressed: ()  {
                                if (txtTenDangNhap.text.length >= 6 &&
                                  txtMatKhau.text.length >= 6 &&
                                  txtEmail.text.isNotEmpty) {
                                register();
                              } else if(txtTenDangNhap.text.length < 6 ||
                                  txtMatKhau.text.length < 6 ){
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content:
                                      Text('Mật khẩu hoặc tên đăng nhập không được dưới 6 kí tự'),
                                ));
                              }
                               
                              },
                              child: const Text(
                                "Đăng kí",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )),
                        ),
                       
                         
                            
                      ],
                      
                    ),
                  ),
                ),
              ),
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
