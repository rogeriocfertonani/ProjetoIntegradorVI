import 'package:flutter/material.dart';

class Doacoes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
         Scaffold(
            appBar: AppBar(title: Text('Procurar doações'),),
            body: Column(
              children: [
                Card(
                  child: ListTile(
                    leading: Icon(Icons.done),
                    title: Text('Casas André luiz'),
                    subtitle: Text('Tipo: Cesta Básica'),
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: Icon(Icons.done),
                    title: Text('Portas Abertas'),
                    subtitle: Text('Tipo: Cesta Básica'),
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: Icon(Icons.done),
                    title: Text('Ong Viver'),
                    subtitle: Text('Tipo: Cesta Básica'),
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: Icon(Icons.done),
                    title: Text('Projeto Generosidade'),
                    subtitle: Text('Tipo: Cesta Básica'),
                  ),
                ),
              ],
            ),



          ),

      ],
    );
  }
}

