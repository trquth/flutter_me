import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_guide/sections/counter_bloc/bloc/counter_event.dart';
import 'package:flutter_complete_guide/sections/counter_bloc/bloc/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(initialState) {
    on(mapEventToState);
  }

  static get initialState => const CounterState();

  int countValue = 0;

  void mapEventToState(event, emit) {
    if (event is IncrementCounterEvent) {
      emit(CounterState(count: ++countValue));
    }
    if (event is AddToCounterEvent) {
      countValue = countValue + event.number;
      emit(CounterState(count: countValue));
    }
  }
}
