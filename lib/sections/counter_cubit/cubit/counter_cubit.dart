import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_guide/sections/counter_cubit/cubit/counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(count: 0));

  int count = 0;

  increment() async {
    emit(CounterState(count: ++count));
  }

  addNumberToCounter(int counter) async {
    count += counter;
    emit(CounterState(count: count));
  }
}
