import 'package:flutter/material.dart';
import 'screen/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  //const MyApp({super.key});
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ToDo app',
      home: Home(),
    );
  }
}
