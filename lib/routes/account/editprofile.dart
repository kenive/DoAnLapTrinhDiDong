import 'dart:convert';
import 'package:doan_mobile/routes/provider/providerlogin.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class EditProFile extends StatefulWidget {
  const EditProFile({Key? key}) : super(key: key);
  @override
  Edit createState() => Edit();
}

class Edit extends State<EditProFile> {
  TextEditingController txtName = TextEditingController();
  TextEditingController txtAddress = TextEditingController();
  TextEditingController txtPhone = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  // ignore: prefer_typing_uninitialized_variables
  var id;
  @override
  void initState() {
    super.initState();

    //final acc=Provider.of<Account>(context,listen: false);
  }

  @override
  Widget build(BuildContext context) {
    var a = Provider.of<LoginProvider>(context, listen: false);

    id = a.acc!.id;
    //final acc=Provider.of<Account>(context,listen: false);
    return GestureDetector(
      onTap: () {
        //FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          backgroundColor: Colors.pink[50],
          appBar: AppBar(
            backgroundColor: Colors.pink[200],
            title: const Text(
              'Thông tin tài khoản',
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
                            labelText: 'Họ Và Tên',
                          ),
                          controller: txtName..text = a.acc!.fullName!,
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
                            labelText: 'Địa Chỉ',
                          ),
                          controller: txtAddress..text = a.acc!.address!,
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
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.info),
                            border: OutlineInputBorder(),
                            labelText: 'Số Điện Thoại',
                          ),
                          controller: txtPhone..text = a.acc!.phone!,
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
                            labelText: 'Email',
                          ),
                          controller: txtEmail..text = a.acc!.email!,
                        ),
                        margin: const EdgeInsets.fromLTRB(30, 30, 30, 20),
                      ),

                      // ignore: deprecated_member_use
                      FlatButton(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 65),
                        color: Colors.red,
                        onPressed: () {
                          //Navigator.pushNamed(context, '/register');
                          if (txtAddress.text.isNotEmpty &&
                              txtEmail.text.isNotEmpty &&
                              txtName.text.isNotEmpty &&
                              txtPhone.text.isNotEmpty) {
                            if (txtName.text.length <= 20) {
                              if (txtPhone.text.length >= 9 &&
                                  txtPhone.text.length <= 10) {
                                update();
                              } else {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content: Text('Sai định dạng số điện thoại'),
                                ));
                              }
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text('Tên đã vượt quá 20 kí tự'),
                              ));
                            }
                          } else {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text('Vui lòng nhập đầy đủ thông tin'),
                            ));
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
              )
            ],
          )),
    );
  }

  Future<void> update() async {
    final response = await http.put(
      Uri.parse('http://10.0.2.2:8000/api/account/update/$id'),
      body: jsonEncode(<String, String>{
        'name': txtName.text.trim(),
        'address': txtAddress.text.trim(),
        'email': txtEmail.text.trim(),
        'phone': txtPhone.text.trim(),
      }),
      headers: <String, String>{
        'content-type': 'application/json; charset=UTF-8',
      },
    );
    var check = jsonDecode(response.body);

    if (check['sucsses']) {
      //Navigator.pushNamed(context, '/login');
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Thông Báo'),
              content: const Text(
                'Cập Nhật thành công, ok để quay về màn hình đăng nhập',
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    var b = Provider.of<LoginProvider>(context, listen: false);
                    b.acc = null;
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
        content: Text('Cập Nhật Thất Bại'),
      ));
    }
  }
}
