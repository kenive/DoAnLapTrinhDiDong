
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../provider/providerlogin.dart';


class PageLogin extends StatefulWidget {
  const PageLogin({Key? key}) : super(key: key);
  @override
  Login createState() => Login();
}

class Login extends State<PageLogin> {
  // ignore: unused_field
  late bool _passwordVisible;

  final txtTenDangNhap = TextEditingController();
  final txtMatKhau = TextEditingController();

  @override
  // ignore: must_call_super
  void initState() {
    _passwordVisible = false;
    //final data=Provider.of<Account>(context,listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
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
                top: 50,
                left: 30,
                child: Container(
                  height: 450,
                  width: 350,
                  decoration: BoxDecoration(
                    color: Colors.pink.shade200,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.pink.withOpacity(0.5),
                        offset: const Offset(0, 3),
                        blurRadius: 7,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  //margin: const EdgeInsets.fromLTRB(10, 0, 250, 0),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'SHOP HOA TƯƠI',
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
                          height: 40,
                        ),

                        Container(
                          width: 300,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.pink.shade100,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.info),
                              border: OutlineInputBorder(),
                              labelText: 'Tên đăng nhập',
                            ),
                            controller: txtTenDangNhap,
                          ),
                        ),
                        const SizedBox(height: 30),
                        Container(
                          width: 300,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.pink.shade100,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextFormField(
                            obscureText: !_passwordVisible,
                            decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                labelText: 'Mật Khẩu',
                                prefixIcon: const Icon(Icons.lock),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _passwordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    //color: Theme.of(context).primaryColorDark,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _passwordVisible = !_passwordVisible;
                                    });
                                  },
                                )),
                            controller: txtMatKhau,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        // ignore: deprecated_member_use
                        FlatButton(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 50),
                          color: Colors.red,
                          onPressed: () async{
                            if (txtTenDangNhap.text.isNotEmpty &&
                                txtMatKhau.text.isNotEmpty) {
                              //login();

                              var a=Provider.of<LoginProvider>(context,listen: false);

                              var kq =await a.fethlogin(txtTenDangNhap.text, txtMatKhau.text);
                              
                              // ignore: unnecessary_null_comparison
                              if(kq != null )
                              {
                                kq=null;
                                
                                Navigator.pushNamed(context, '/second');
                                
                              

                              }
                              else{
                                ScaffoldMessenger.of(context).showSnackBar( const SnackBar(content: Text('Đăng nhập thất bại'),));

                              }
                              /* if(LoginProvider().getAccount(txtTenDangNhap.text, txtMatKhau.text)){
                               Navigator.pushNamed(context, '/second');
                             }else{
                               ScaffoldMessenger.of(context).showSnackBar( const SnackBar(content: Text('Vui Lòng nhập đủ thông tin '),));

                             } */

                            }
                          },
                          child: const Text(
                            'Đăng Nhập',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Times New Roman',
                                fontSize: 20),
                          ),
                          shape: const StadiumBorder(),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        // ignore: deprecated_member_use
                        FlatButton(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 65),
                          color: Colors.red,
                          onPressed: () {
                            Navigator.pushNamed(context, '/register');
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
            ],
          ),
        ),
      ),
    );
  }

 
}
