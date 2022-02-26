import 'package:flutter/material.dart';
import 'package:tracking_depense/home_page.dart';
import 'controller/form_controller.dart';
import 'model/form.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(title: 'Flutter Google Sheet Demo'),
    );
  }
}
