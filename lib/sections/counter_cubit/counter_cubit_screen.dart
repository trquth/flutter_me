import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_guide/sections/counter_cubit/cubit/counter_cubit.dart';
import 'package:flutter_complete_guide/sections/counter_cubit/cubit/counter_state.dart';

class CounterCubitScreen extends StatelessWidget {
  static const routeName = '/counter-cubit';
  const CounterCubitScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter Cubit')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('You have pushed the button this many times:'),
            BlocBuilder(
              bloc: BlocProvider.of<CounterCubit>(context),
              builder: (context, state) {
                print(state);
                return Text(
                  '${(state as CounterState).count}',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 30),
                );
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          BlocProvider.of<CounterCubit>(context).increment();
        },
      ),
    );
  }
}
