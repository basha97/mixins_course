import 'package:flutter/material.dart';
import 'dart:developer' as devtools show log;
import 'dart:io';
import 'package:meta/meta.dart';
import 'dart:convert';

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

extension GetOnUri on Object {
  Future<HttpClientResponse> getUrl(String url) => HttpClient()
      .getUrl(
        Uri.parse(url),
      )
      .then(
        (req) => req.close(),
      );
}

mixin CanMakeGetCall {
  String get url;
  @useResult
  Future<String> getString() => getUrl(
        url,
      ).then(
        (res) => res.transform(utf8.decoder).join(),
      );
}

@immutable
class GetPeople with CanMakeGetCall {
  const GetPeople();
  @override
  String get url => "http://192.168.1.13:5500/apis/people.json";
}

void testIt() async {
  final people = await const GetPeople().getString();
  people.log();
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
