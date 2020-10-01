import 'package:doar_app/screens/Cadastro.dart';
import 'package:doar_app/screens/doacoes.dart';
import 'package:flutter/material.dart';

import 'doar.dart';
import 'home.dart';

class HomeScreen extends StatelessWidget {
  final _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller:_pageController,
      //physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Home(),
        Doacoes(),
        Doar(),
        Cadastro(),

      ],
    );
  }
}
