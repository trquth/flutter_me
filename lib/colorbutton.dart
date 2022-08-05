import 'package:flutter/material.dart';

class ColorButton extends StatelessWidget {
  final VoidCallback onPressHandler;
  final String color;

  ColorButton(this.onPressHandler, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        color: Colors.blue,
        child: Text(
          color,
          //style: TextStyle(color: Colors.white),
        ),
        onPressed: onPressHandler,
        textColor: Colors.white,
      ),
    );
  }
}
