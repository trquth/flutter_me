import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class UserInterfaceScreen extends StatelessWidget {
  static const routeName = '/user_interface';
  const UserInterfaceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        color: Colors.blue,
        child: const Text(
          'Child widget',
          style: TextStyle(fontSize: 20),
        ),
        constraints: const BoxConstraints.expand(width: 100, height: 100),
      ),
    );
  }
}
