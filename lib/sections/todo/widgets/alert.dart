import 'package:flutter/material.dart';

class Alert extends StatelessWidget {
  final String _title;
  final String _description;

  const Alert({
    required String description,
    String title = 'Warning',
    Key? key,
  })  : _title = title,
        _description = description,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(_title),
      content: Text(_description),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('OK'))
      ],
    );
  }
}
