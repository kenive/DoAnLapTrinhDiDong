//import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ScreenLoad extends StatefulWidget {
  const ScreenLoad({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ScreenLoad>
    with SingleTickerProviderStateMixin {
  late AnimationController controller1;
  late Animation<double> flip;

  @override
  void initState() {
    super.initState();

    controller1 =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);

    flip = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: controller1,
        curve: const Interval(0.0, 0.5, curve: Curves.linear)));
    controller1.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
            Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.pink.shade50,
                  Colors.pink.shade100,
                  Colors.pink.shade50,
                  Colors.pink.shade100,
                ],
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
                 Lottie.network(
                      'https://assets4.lottiefiles.com/packages/lf20_fdbKBM.json',
                      width: 300,
                      height: 300,
                      fit: BoxFit.fill,
                    ),
             
              
                const Text(
                  'KÍNH CHÀO QUÝ KHÁCH',
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height:40,
                ),
              
              
                MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  minWidth: 200,
                  height: 50,
                  color: Colors.red,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  child: const Text(
                    'Đăng Nhập',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                  const SizedBox(height: 30,),
                    Lottie.network(
                      'https://assets2.lottiefiles.com/packages/lf20_qh5clmwc.json',
                      width: 150,
                      height: 150,
                      fit: BoxFit.fill,
                    ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
