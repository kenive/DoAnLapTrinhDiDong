import 'package:flutter/material.dart';
//import 'package:flutter/animation.dart';
import 'package:lottie/lottie.dart';

class PageStatus extends StatefulWidget {
  const PageStatus({Key? key}) : super(key: key);

  @override
  _PageStatusState createState() => _PageStatusState();
}

class _PageStatusState extends State<PageStatus>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;
  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    controller.repeat();
    //_load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange[50],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'LOVE WINS',
              style: TextStyle(
                //color: Colors.pink,
                fontSize: 30,
                fontWeight: FontWeight.bold,
                foreground: Paint()
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = 3
                  ..color = Colors.pink.shade700,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            const Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Text(
                  'Cảm ơn quý khách đã mua sản phẩm của shop!',
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                )),
            const SizedBox(
              height: 20,
            ),
            /* SizedBox(
                height: 150,
                child: Image.asset(
                  "images/cute4.jpg",
                  fit: BoxFit.contain,
                )), */
            Lottie.network(
              'https://assets1.lottiefiles.com/packages/lf20_wqepljpj.json',
              width: 120,
              height: 120,
              fit: BoxFit.fill,
            ),

            // ignore: deprecated_member_use
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.red, // background
                  onPrimary: Colors.white, // foreground
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/second');
                },
                child: const Text('Mua Tiếp', style: TextStyle(fontSize: 20))),
            const SizedBox(
              height: 30,
            ),
            // ignore: deprecated_member_use
            Center(
              child: RotationTransition(
                alignment: Alignment.bottomCenter,
                turns: animation,
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: Image.asset('images/logohoa1.png'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
