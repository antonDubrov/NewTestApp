import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
        body: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _hellothere = 'Hello there';
  final Random _random = Random();
  double _fontSize = 25;
  late Color _backgroundColor = Colors.black;
  Timer? _timer;

  Color generateRandomRGBColor() {
    return Color.fromRGBO(
        _random.nextInt(256), _random.nextInt(256), _random.nextInt(256), 1);
  }

  void incrementText() {
    if (_fontSize <= 65) {
      _fontSize++;
    }
    _backgroundColor = generateRandomRGBColor();
  }

  void decrementFontSize() {
    setState(() {
      if (_fontSize > 25) {
        _fontSize--;
      }
    });
  }

  void timerDuration() {
    _timer?.cancel();
    _timer = Timer.periodic(Duration(milliseconds: 400), (timer) {
      decrementFontSize();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          incrementText();
          timerDuration();
        });
      },
      child: Container(
        color: _backgroundColor,
        child: Center(
          child: Text(
            _hellothere,
            style: TextStyle(fontSize: _fontSize),
          ),
        ),
      ),
    );
  }
}
