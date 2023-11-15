import 'package:flutter/material.dart';

class ImageLogin extends StatelessWidget {
  Widget build(BuildContext context) {
    final img = Container(
      child: Image.network(
        "https://upload.wikimedia.org/wikipedia/commons/b/bc/Unifranz.png",
        height: 200.0,
        width: 200.0,
      ),
      decoration: BoxDecoration(
        color: Colors.black87,
      ),
    );
    return img;
  }
}
