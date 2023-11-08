import 'package:flutter/material.dart';

class TextFieldEmail extends StatelessWidget {
  final TextEditingController controller;
  final String hint2;

  TextFieldEmail({required this.hint2, required this.controller});

  @override
  Widget build(BuildContext context) {
    final password = Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 25.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.indigo,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 15.0),
          child: TextFormField(
            controller: controller,
            style: const TextStyle(
              fontSize: 15.0,
              fontFamily: "Lato",
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hint2,
            ),
          ),
        ),
      ),
    );
    return password;
  }
}
