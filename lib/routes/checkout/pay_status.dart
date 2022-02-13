import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
class PageStatus extends StatefulWidget {
  const PageStatus({Key? key}) : super(key: key);

  @override
  _PageStatusState createState() => _PageStatusState();
}

class _PageStatusState extends State<PageStatus> with SingleTickerProviderStateMixin{
  late Animation<double> animation;
  late AnimationController controller;
  @override
  void initState() {
    super.initState();
    
    controller =AnimationController(vsync: this, duration: const Duration(seconds: 1));
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    controller.repeat();
    //_load(); 
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                  'KEN SHOP',
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
                  'Cảm ơn quý khách đã mua hoa!',
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )),
                const SizedBox(
              height: 30,
            ),
                
            // ignore: deprecated_member_use
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.red, // background
                  onPrimary: Colors.white, // foreground
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/second');
                  
                },
                child: const Text('Về Home', style: TextStyle(fontSize: 20))),
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
