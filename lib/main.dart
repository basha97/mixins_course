import 'package:flutter/material.dart';
import 'dart:developer' as devtools show log;

extension Log on Object {
  void log() => devtools.log(toString());
}

mixin CanRun {
  int get speed;
  void run() {
    "Running at the speed of $speed".log();
  }
}

class Cat with CanRun {
  @override
  int speed = 20;
}

testIt() {
  final cat = Cat();
  cat.run();
  cat.speed = 40;
  cat.run();
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    testIt();
    return const Scaffold(
      body: Center(child: Text("Mixin")),
    );
  }
}
