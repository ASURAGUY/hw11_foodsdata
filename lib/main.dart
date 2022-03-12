import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hw11_foodsdata/pages/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'อร่อยทุกเมนู Foods',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        scaffoldBackgroundColor: Colors.amber.shade100,
      ),
      home:  HomePage(),
    );
  }
}
