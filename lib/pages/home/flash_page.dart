import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/json/service.dart';
import 'package:flutter_firebase_auth/pages/home/menu_screen_page.dart';

class FlashPage extends StatefulWidget {
  const FlashPage({Key? key}) : super(key: key);

  @override
  State<FlashPage> createState() => _FlashPageState();
}

class _FlashPageState extends State<FlashPage> with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    fetchJson().then((value) {
      setState(() {
        foodJson.addAll(value);
      });
    });

    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1))
          ..forward();
    animation = CurvedAnimation(parent: controller, curve: Curves.linear);

    Timer(
        Duration(seconds: 2),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => MenuScreenPage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ScaleTransition(
                scale: animation,
                child: Center(
                  child: Image.asset(
                    "assets/image/logofood.png",
                    width: 140,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Shooping Food",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Ăn ngon rẻ - Giao hàng lẹ",
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
