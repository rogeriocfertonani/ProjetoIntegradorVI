import 'package:doar_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
void main()=> runApp(new Doar());
class Doar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Doar Protótipo',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home:HomeScreen(),

        );
  }
}


