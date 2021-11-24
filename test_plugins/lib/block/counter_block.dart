import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_state.dart';

class CounterBlock extends Cubit<CounterState> {
  CounterBlock() : super(CounterState(counterValue: 0));
  void increment() => emit(CounterState(counterValue: state.counterValue + 1));
  void decrement() => emit(CounterState(counterValue: state.counterValue - 1));
}
