import 'dart:async';

import 'package:colorment/constant/color_const.dart';
import 'package:flutter/material.dart';
import 'package:show_up_animation/show_up_animation.dart';

import '../home/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      // ignore: prefer_const_constructors
      Duration(seconds: 3),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Container(
        child: Stack(
          children: [
            Positioned(
              top: -400,
              right: -100,
              child: ShowUpAnimation(
                delayStart: Duration(milliseconds: 100),
                animationDuration: Duration(seconds: 1),
                curve: Curves.easeInOutCubicEmphasized,
                direction: Direction.vertical,
                offset: 0.5,
                child: Transform(
                  transform: new Matrix4.identity()
                    ..rotateZ(15 * 3.1415927 / 180),
                  child: Container(
                    height: 500,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: six.withOpacity(0.3),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: -400,
              child: ShowUpAnimation(
                delayStart: Duration(milliseconds: 120),
                animationDuration: Duration(seconds: 1),
                curve: Curves.easeInOutCubicEmphasized,
                direction: Direction.vertical,
                offset: 0.5,
                child: Transform(
                  transform: new Matrix4.identity()
                    ..rotateZ(15 * 3.1415927 / 80),
                  child: Container(
                    height: 700,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: eight.withOpacity(0.3),
                    ),
                  ),
                ),
              ),
            ),
            ShowUpAnimation(
              delayStart: Duration(milliseconds: 150),
              animationDuration: Duration(seconds: 1),
              curve: Curves.easeInOutCubicEmphasized,
              direction: Direction.vertical,
              offset: 0.5,
              child: Center(
                child: Text(
                  "ColorMent.",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w800,
                      fontFamily: 'PopB',
                      color: one),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ShowUpAnimation(
                delayStart: Duration(milliseconds: 180),
                animationDuration: Duration(seconds: 1),
                curve: Curves.easeInOutCubicEmphasized,
                direction: Direction.vertical,
                offset: 0.5,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 18.0),
                  child: Text(
                    "By Srikanth Tiwari.",
                    style:
                        TextStyle(fontSize: 11, fontFamily: 'PopR', color: one),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
