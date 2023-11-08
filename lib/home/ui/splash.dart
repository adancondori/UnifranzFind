import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unifranzfind/home/ui/home.dart';

class splash extends StatelessWidget {
  const splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2), () {
      Get.to(const MyHomePage(title: 'Sede:',));
    });
    return const Scaffold(
      backgroundColor: Colors.orange,
      body: Center(
        child: Text(
          'UNIFRANZ FIND',
          style: TextStyle(
            color: Colors.white,
            fontSize:35,
            fontWeight: FontWeight.bold, 
          ),),
      ),
    );
  }
}