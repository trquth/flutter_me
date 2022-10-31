import 'package:flutter/material.dart';
import './providers/counter.dart';
import 'package:provider/provider.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final subTree = ConstantWidget(child: const Text('Hello World'));
    return Scaffold(
      appBar: AppBar(title: const Text('Counter')),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('${context.watch<Counter>().counter}'),
          ElevatedButton(
              onPressed: () {
                context.read<Counter>().increase();
              },
              child: const Text('+')),
          ElevatedButton(
              onPressed: () {
                context.read<Counter>().decrease();
              },
              child: const Text('-')),
          const SizedBox(
            height: 10,
          ),
          subTree
        ],
      )),
    );
  }

  Widget _widget() => const Text('Hi');

  ConstantWidget({required Text child}) {
    return Text('Hello');
  }
}
