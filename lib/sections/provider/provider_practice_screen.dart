import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/sections/provider/providers/changing_content.dart';
import 'package:flutter_complete_guide/sections/provider/providers/counting_the_number.dart';
import 'package:provider/provider.dart';

class ProviderPracticeScreen extends StatelessWidget {
  const ProviderPracticeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _counter = Provider.of<CountingTheNumber>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Provider')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('You have been pushed button this many time:'),
            const SizedBox(
              height: 30,
            ),
            Text(
              '${_counter.counting}',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  _counter.increaseCounting();
                },
                child: const Text('Increase')),
            const SizedBox(
              height: 5,
            ), //RaisedButton
            TextButton(
                onPressed: () {
                  _counter.decreaseCounting();
                },
                child: const Text('Decrease')),
            const SizedBox(
              height: 5,
            ), //FlatButton
            Consumer<ChangingContent>(
                builder: (context, value, child) => Column(
                      children: [
                        OutlinedButton(
                            onPressed: () {
                              value.changeContent();
                            },
                            child: const Text('Change New Content')),
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    )),
            Consumer<ChangingContent>(
              builder: (context, value, child) => Text(
                value.selectedContent,
                style: const TextStyle(color: Colors.blue, fontSize: 20),
              ),
            ) //OutlineButton,
          ],
        ),
      ),
    );
  }
}
