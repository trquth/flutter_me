import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ButtonsPage(),
    );
  }
}

class ButtonsPage extends StatelessWidget {
  const ButtonsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Row txtBtn = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [TextButton(onPressed: () {}, child: Text("TextButton"))],
    );

    Row elevatedBtn = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(onPressed: () {}, child: Text("ElevatedButton"))
      ],
    );

    Row iconBtn = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [IconButton(onPressed: () {}, icon: Icon(Icons.add_outlined))],
    );

    Row outlinedBtn = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        OutlinedButton(onPressed: () {}, child: Text("OutlinedButton"))
      ],
    );

    Row dropdownBtn = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DropdownButton(
            items: ["Orange", "Mango", "Melon"]
                .map((e) => DropdownMenuItem(
                      value: e,
                      child: Text(e),
                    ))
                .toList(),
            onChanged: (value) {})
      ],
    );

    Row backBtn = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [BackButton()],
    );

    Row closeBtn = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [CloseButton()],
    );

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            txtBtn,
            elevatedBtn,
            iconBtn,
            outlinedBtn,
            dropdownBtn,
            backBtn,
            closeBtn
          ],
        ),
      ),
    );
  }
}
