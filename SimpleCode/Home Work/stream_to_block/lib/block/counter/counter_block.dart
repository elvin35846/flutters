import 'dart:async';

import 'package:stream_to_block/block/counter/counter_event.dart';

class CounterBlock {
  int _counter = 0;

  // streamcontroller for EVENT
  final _counterEventStreamController = StreamController<CounterEvent>();
  StreamSink<CounterEvent> get counterEventSink =>
      _counterEventStreamController.sink;
  Stream<CounterEvent> get _counterEventStream =>
      _counterEventStreamController.stream;

  // streamcontroller for STATE
  final _counterStateStreamController = StreamController<int>();
  StreamSink<int> get _counterStateSink => _counterStateStreamController.sink;
  Stream<int> get counterStateStream => _counterStateStreamController.stream;

  void dispose() {
    _counterEventStreamController.close();
    _counterStateStreamController.close();
  }

  // listen EVENT enter data
  CounterBlock() {
    _counterEventStream.listen(_mapEventToState);
  }

  void _mapEventToState(CounterEvent event) {
    if (event is IncrementEvent) {
      _counter++;
    } else {
      _counter--;
    }

    // change data in STATE
    _counterStateSink.add(_counter);
  }
}
