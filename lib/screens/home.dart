import 'package:doar_app/screens/Cadastro.dart';
import 'package:doar_app/screens/doacoes.dart';
import 'package:doar_app/screens/doar.dart';
import 'package:doar_app/screens/instituicao.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
class Home extends StatelessWidget {
  final PageController controller;

  const Home({Key key, this.controller}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(

      children: <Widget>[
        Scaffold(appBar: AppBar(title:Text('Doar'),
        ),
          body:


          Column(

            children:<Widget> [
          SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(45.0, 80.0, 10.0, 10.0),
            child: Row(

              children: [

                Column(

                  children: [

                    GestureDetector(
                      child:   IconButton(

                        icon: Icon(Icons.account_circle),
                        iconSize: 100.0,
                      ),
                      onTap: (){
                       Navigator.push(context,
                           MaterialPageRoute(builder:(context)=>Cadastro()),);


                      },
                    ),

                    Text('Cadastro'),

                    GestureDetector(
                      child:IconButton(
                        icon: Icon(Icons.monetization_on),
                        iconSize: 100.0,),
                       onTap:( ){
                        Navigator.push(context,
                         MaterialPageRoute(builder:(context)=>Doar()),);
                       },
                    ),
                    Text('Doar')

                  ],
                ),

                Column(
                  children: [
                    GestureDetector(
                    child:
                    IconButton(icon: Icon(Icons.search),
                      iconSize: 100.0,
                    ),
                    onTap:( ){Navigator.push(context,
                      MaterialPageRoute(builder:(context)=>Doacoes()),);},
                  ),
                    Text('Procurar Doações'),
                    GestureDetector(
                      child:
                      IconButton(
                        icon: Icon(Icons.home),
                        iconSize: 100.0,),
                      onTap:( ){Navigator.push(context,
                        MaterialPageRoute(builder:(context)=>Instituicao()),);},
                    ),





                    Text('Instituições')

                  ],
                )

              ],

            ),
          )

            ],
          ),
        ),

      ],
    );
  }
}
