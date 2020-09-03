import 'package:flutter/material.dart';
import 'dart:math'as math;
class CircleProgressCustomClock extends StatefulWidget {
  final double size;
  final double percent;
  CircleProgressCustomClock({this.size=50.0, this.percent =0.0});

  @override
  _CircleProgressCustomClockState createState() => _CircleProgressCustomClockState();
}

class _CircleProgressCustomClockState extends State<CircleProgressCustomClock> {
  @override
  Widget build(BuildContext context) {
    final double size =widget.size;
    return SafeArea(
      child: Center(
          child: TweenAnimationBuilder(
            tween: Tween(begin: 0.0, end:1.0 ),
            duration: Duration(seconds: 4),
            builder: (context,value,child){
              int percentage = (value*100).toInt();
              return Container(
                width: size,
                height: size,
//            color: Colors.blue,
                child: Stack(
                  children: [
                    RotationTransition(
                      turns: AlwaysStoppedAnimation(-90/360),
                      child: ShaderMask(
                        shaderCallback: (rect){
                          return SweepGradient(
                              startAngle: 0.0,
                              endAngle:2*math.pi, // 1 vong trong
                              stops: [widget.percent,widget.percent],
                              center: Alignment.center,
                              colors: [Colors.blue, Colors.grey.withAlpha(55)]
                          ).createShader(rect);
                        },
                        child: Container(
                          width: size,
                          height: size,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
//                          color: Colors.white,
                              image: DecorationImage(image: Image.asset("images/radial_scale.png").image)
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        height: size -size/5,
                        width: size -size/5,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle
                        ),
                        child: Center(
                          child: Text("$percentage",style: TextStyle(fontSize: size/5),),
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          )
      ),
    );
  }
}
