import 'package:flutter/material.dart';
import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Animation'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  SequenceAnimation sequenceAnimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this);

    sequenceAnimation = SequenceAnimationBuilder()
        .addAnimatable(
            animatable: Tween<double>(begin: 0, end: 1),
            from: Duration(seconds: 0),
            to: Duration(seconds: 3),
            tag: 'opacity')
        .addAnimatable(
            animatable: Tween<double>(begin: 50, end: 400),
            from: Duration(seconds: 4),
            to: Duration(seconds: 8),
            tag: 'width')
        .addAnimatable(
            animatable: Tween<double>(begin: 50, end: 400),
            from: Duration(seconds: 4),
            to: Duration(seconds: 8),
            tag: 'height')
        .addAnimatable(
            animatable: BorderRadiusTween(
                begin: BorderRadius.circular(0),
                end: BorderRadius.circular(200)),
            from: Duration(seconds: 8),
            to: Duration(seconds: 10),
            curve: Curves.easeIn,
            tag: 'border')
        .animate(controller);

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: AnimatedBuilder(
        animation: controller,
        builder: (BuildContext context, Widget child) {
          return Opacity(
            opacity: sequenceAnimation['opacity'].value,
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: sequenceAnimation['border'].value,
                  color: Colors.red,
                ),
                width: sequenceAnimation['width'].value,
                height: sequenceAnimation['height'].value,
              ),
            ),
          );
        },
      ),
    );
  }
}
