import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream/counter_block/counter_event.dart';
import 'package:stream/counter_block/counter_state.dart';

class CounterBlock extends Bloc<CounterEvent, CounterState> {
  CounterBlock() : super(CounterState(0));

  @override
  Stream<CounterState> mapEventToState(CounterEvent event) async* {
    if (event is CounterIncrement) {
      yield CounterState(state.counter + 1);
    }
    if (event is CounterDecrement) {
      yield CounterState(state.counter - 1);
    }
  }
}
