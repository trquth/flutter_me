import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_guide/sections/counter_bloc/bloc/counter_bloc.dart';
import 'package:flutter_complete_guide/sections/counter_bloc/bloc/counter_event.dart';
import 'package:flutter_complete_guide/sections/counter_bloc/bloc/counter_state.dart';

class CounterBlocScreen extends StatefulWidget {
  static const routeName = '/counter-bloc';
  const CounterBlocScreen({Key? key}) : super(key: key);

  @override
  State<CounterBlocScreen> createState() => _CounterBlocScreenState();
}

class _CounterBlocScreenState extends State<CounterBlocScreen> {
  CounterBloc? bloc;

  @override
  void initState() {
    bloc = BlocProvider.of<CounterBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter Bloc')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('You have pushed the button this many times:'),
            BlocBuilder(
              bloc: BlocProvider.of<CounterBloc>(context),
              builder: (context, state) {
                return Text(
                  '${(state as CounterState).count}',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 30),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          // BlocProvider.of<CounterBloc>(context)
          //     .add(AddToCounterEvent(number: 10));
          bloc?.add(AddToCounterEvent(number: 100));
        },
      ),
    );
  }
}
