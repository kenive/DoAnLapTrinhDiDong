import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'dart:math';
class ScreenLoad extends StatefulWidget {
  const ScreenLoad({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ScreenLoad>
    with SingleTickerProviderStateMixin {
 
  late AnimationController controller1;
  late Animation<double>  flip;
  
  @override
  void initState() {
    super.initState();
    

    controller1 =
        AnimationController(duration:const Duration(seconds: 3), vsync: this);

    flip = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: controller1, curve:const Interval(0.0, 0.5, curve: Curves.linear)));
    controller1.repeat();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
        /*   Container(
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
          ), */
          Center(child: 
          Column( 
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Transform(
                transform: Matrix4.identity()
                ..setEntry(3, 2, 0.005)
                ..rotateY(2*pi*flip.value),
                alignment: Alignment.center,
               
                child:RotationTransition(
                  turns: flip,
                   child:Center(
                  child: Text(
                  'KEN SHOP',
                  style: TextStyle(
                    //color: Colors.pink,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 2
                      ..color = Colors.pink.shade700,
                  ),
                ),), 

                ),
                
                ),
              
                const SizedBox(height: 40,),
              const Text('CHÀO MỪNG QUÝ KHÁCH',
              style: TextStyle(
                fontSize:20,
                color:Colors.black,
                fontWeight:  FontWeight.bold
              ),
              ),
              const SizedBox(height: 30,),
              Container(
                height: 250,
                decoration:const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/cute3.jpg'),
                    fit: BoxFit.contain
                  )
                ),


              ),
           
              
               
            
              /* Center(
                child: RotationTransition(
                  alignment: Alignment.topCenter,
                  turns: animation,
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: Image.asset('images/logohoa1.png'),
                  ),
                ),
              ), */
              const SizedBox(height: 30,),
              MaterialButton(
                onPressed: (){
                 Navigator.pushNamed(context, '/login');

                },
                minWidth: 200,
                height: 50,
                color: Colors.red,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                child: const Text('Đăng Nhập',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight:FontWeight.bold
                ),),
                ),
            ],
          )
          
          ,)
          
        ],
      ),
    );
  }
}


