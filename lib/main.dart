import 'package:awsapi/screens/route53Screen.dart';
import 'package:flutter/material.dart';
import 'screens/main_page.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: MainPage.id,
      routes: {
        MainPage.id: (context) => MainPage(),
        Route53View.id: (context)=> Route53View(),
      },
    );
  }
}