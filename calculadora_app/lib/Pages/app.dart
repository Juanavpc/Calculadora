import 'package:flutter/material.dart';
import 'calculadora.dart';

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Calculadora(),
    );
  }
}