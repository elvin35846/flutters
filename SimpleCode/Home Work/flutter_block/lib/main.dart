import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream/counter_block/counter_block.dart';
import 'package:stream/counter_block/counter_event.dart';
import 'package:stream/counter_block/counter_state.dart';
import 'package:stream/theme_cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeData>(builder: (context, theme) {
        return MaterialApp(
          title: 'Flutter Block',
          theme: theme,
          home: BlocProvider(
            create: (context) => CounterBlock(),
            child: MyHomePage(),
          ),
        );
      }),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Block Demo'),
      ),
      body: MyCenterWidget(),
      floatingActionButton: MyActions(),
    );
  }
}

class MyCenterWidget extends StatelessWidget {
  const MyCenterWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'You have pushed the button this many times:',
          ),
          BlocBuilder<CounterBlock, CounterState>(
            builder: (context, counterState) {
              return Text(
                counterState.counter.toString(),
                style: Theme.of(context).textTheme.headline4,
              );
            },
          ),
        ],
      ),
    );
  }
}

class MyActions extends StatelessWidget {
  const MyActions({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        FloatingActionButton(
          heroTag: '1',
          onPressed: () {
            context.read<CounterBlock>().add(CounterIncrement());
          },
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
        SizedBox(height: 5),
        FloatingActionButton(
          heroTag: '2',
          onPressed: () {
            context.read<CounterBlock>().add(CounterDecrement());
          },
          tooltip: 'Increment',
          child: Icon(Icons.remove),
        ),
        SizedBox(height: 5),
        FloatingActionButton(
          heroTag: '3',
          onPressed: () {
            context.read<ThemeCubit>().changTheme();
          },
          tooltip: 'Theme',
          child: Icon(Icons.brightness_6),
        ),
      ],
    );
  }
}
