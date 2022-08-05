import 'package:flutter/material.dart';

class Color extends StatelessWidget {
  final String colorText;

  Color(this.colorText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 50),
      child: Text(
        colorText,
        style: TextStyle(fontSize: 28),
        textAlign: TextAlign.center,
      ),
    );
  }
}
