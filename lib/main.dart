import 'package:flutter/material.dart';
import 'dart:developer' as devtools show log;

extension Log on Object {
  void log() => devtools.log(toString());
}

abstract class Animal {
  const Animal();
}

mixin CanRun on Animal {
  int get speed;
  void run() {
    "Running at the speed of $speed".log();
  }
}

class Cat extends Animal with CanRun {
  @override
  int speed = 20;
}

class Dog with CanRun{
  @override
  // TODO: implement speed
  int get speed => throw UnimplementedError();
  
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
