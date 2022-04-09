import 'package:flutter/material.dart';
import 'package:project_630710646/pages/Bmrpage.dart';
import 'package:project_630710646/pages/Bmipage.dart';
import 'package:project_630710646/pages/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: homepage(),
    );
  }
}

