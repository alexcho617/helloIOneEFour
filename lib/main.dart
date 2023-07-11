import 'package:flutter/material.dart';
import 'package:hello_i1e4/pages/listPage.dart';
import 'package:hello_i1e4/pages/newPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello E1A4',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlueAccent),
        useMaterial3: true,
      ),
      home:  ListPage(),
    );
  }
}
