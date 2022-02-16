import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';

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
          backgroundColor: Colors.white,
          body: Center(
            child: SingleChildScrollView(
              // ignore: avoid_unnecessary_containers
              child: Container(
                //color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Form(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                         Lottie.network(
                      'https://assets4.lottiefiles.com/packages/lf20_a18slqgx.json',
                      width: 200,
                      height: 200,
                      fit: BoxFit.fill,
                    ),
                        /* SizedBox(
                            height: 150,
                            child: Image.asset(
                              "images/cute.jpg",
                              fit: BoxFit.contain,
                            )), */
                        Text(
                          'LOVE WINS',
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
                          height: 30,
                        ),
                        TextFormField(
                            autofocus: false,
                            controller: txtTenDangNhap,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.info),
                              contentPadding:
                                  const EdgeInsets.fromLTRB(20, 15, 20, 15),
                              hintText: "Tên đăng nhập",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            )),
                        const SizedBox(height: 30),
                        TextFormField(
                          autofocus: false,
                          controller: txtMatKhau,
                          keyboardType: TextInputType.text,
                          obscureText: !_passwordVisible,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.lock),
                            contentPadding:
                                const EdgeInsets.fromLTRB(20, 15, 20, 15),
                            hintText: "Mật khẩu",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
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
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        Material(
                          elevation: 5,
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.redAccent,
                          child: MaterialButton(
                              padding:
                                  const EdgeInsets.fromLTRB(20, 15, 20, 15),
                              minWidth: MediaQuery.of(context).size.width,
                              onPressed: () async {
                                var a = Provider.of<LoginProvider>(context,
                                        listen: false);
                                if (txtTenDangNhap.text.isNotEmpty &&
                                    txtMatKhau.text.isNotEmpty) {
                                  if (txtTenDangNhap.text.length >= 6 &&
                                      txtMatKhau.text.length >= 6) {
                                    
                                    var kq = await a.fethlogin(
                                        txtTenDangNhap.text, txtMatKhau.text);
                                    // ignore: unnecessary_null_comparison
                                    if (kq != null) {
                                    
                                      Navigator.pushNamed(context, '/second');
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                        content: Text('Đăng nhập thất bại'),
                                      ));
                                    }
                                  } else if (txtTenDangNhap.text.length < 6 ||
                                      txtMatKhau.text.length < 6) {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                      content: Text(
                                          'Mật khẩu hoặc tên đăng nhập không được dưới 6 kí tự'),
                                    ));
                                  }
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                    content: Text(
                                        'Vui lòng nhập đủ tên đăng nhập và mật khẩu'),
                                  ));
                                }
                              },
                              child: const Text(
                                "Đăng nhập",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )),
                        ),
                        const SizedBox(height: 30),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Bạn có tài khoản chưa? "),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, '/register');
                                },
                                child: const Text(
                                  "Đăng kí",
                                  style: TextStyle(
                                      color: Colors.redAccent,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              ),
                            ]),
                        const SizedBox(
                          height: 20,
                        ),
                      
                        /* Consumer<LoginProvider>(
                          builder: (context,a,child){
                           
                                return  Center(
                                 
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                      //backgroundImage: Image.network(a.gg!.photoUrl!).image,
                                    )

                                  ],),
                              );
                            

                            }
                         
                            // ignore: unnecessary_null_comparison
                           
                        
                          ),  */


                        // ignore: deprecated_member_use
                        /* FlatButton(
                            onPressed: () {
                              var a = Provider.of<LoginProvider>(context,
                                        listen: false);
                              if(a.login1()==null){
                                 //Navigator.pushNamed(context, '/second');
                              }else{
                                 ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                    content: Text(
                                        'That bại'),
                                  ));
                              }
                            },
                            child: Image.network(
                                'https://i.stack.imgur.com/qpM2J.png')), */
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}


