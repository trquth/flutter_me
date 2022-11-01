import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MaterialStateScreen extends StatefulWidget {
  static const routeName = '/material_state';
  const MaterialStateScreen({Key? key}) : super(key: key);

  @override
  State<MaterialStateScreen> createState() => _MaterialStateScreenState();
}

class _MaterialStateScreenState extends State<MaterialStateScreen> {
  bool isChecked = true;
  Color changeColor(Set<MaterialState> states) {
    const Set<MaterialState> _interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(_interactiveStates.contains)) {
      return Colors.green;
    }
    return Colors.deepOrange;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Material State')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.resolveWith(changeColor)),
              child: const Text('Text Button'),
              onPressed: () {},
            ),
            Checkbox(
              checkColor: Colors.white,
              fillColor: MaterialStateProperty.resolveWith(changeColor),
              value: isChecked,
              onChanged: (value) {
                setState(() {
                  isChecked = value!;
                });
              },
            ),
            CheckboxListTile(
              title: const Text('Are you robot?'),
              subtitle: const Text('Check now!'),
              secondary: const Icon(Icons.abc),
              controlAffinity: ListTileControlAffinity.leading,
              value: isChecked,
              onChanged: (value) {},
            )
          ],
        ),
      ),
    );
  }
}
