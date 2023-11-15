import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unifranzfind/home/ui/home.dart';
import 'package:unifranzfind/login/ui/login.dart';

class splash extends StatelessWidget {
  const splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2), () {
      Get.to(LoginScreen());
    });
    return const Scaffold(
      backgroundColor: Colors.orange,
      body: Center(
        child: Text(
          'UNIFRANZ FIND',
          style: TextStyle(
            color: Colors.white,
            fontSize: 35,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
