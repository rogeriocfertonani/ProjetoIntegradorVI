import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Cadastro extends StatefulWidget {
  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  void cadastrar(){

    Firestore.instance
        .collection("Instituicao")
        .document("endereco")
        .setData({"rua":"Angelina","numero":40});

    print("cadastrou!!!!!!!");

  }

  String nome;
  _getNome(String nome){
    this.nome = nome;

  }


  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: <Widget>[
        Scaffold(
          appBar: AppBar(title:Text('Cadastro')),
          body:SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
            child: Form(child:Column(
              children: [

                TextFormField(
                  keyboardType:TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Nome',

                  ),
                  onChanged: _getNome(nome) ,
                ),

                TextFormField(
                  keyboardType:TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Endereço',
                  ),),
                TextFormField(
                  keyboardType:TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'email',
                  ),),
                TextFormField(
                  keyboardType:TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'CPF',
                  ),),
                RaisedButton(onPressed: cadastrar,
                  child: Text('Cadastrar'),)


              ],

            ),
            ),

          ),

        ),



      ],
    );
  }
}

class Cadastro_old extends StatelessWidget {

 void cadastrar(){

  Firestore.instance
      .collection("Instituicao")
      .document("endereco")
      .setData({"rua":"Angelina","numero":40});

  print("cadastrou!!!!!!!");

 }


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Scaffold(
          appBar: AppBar(title:Text('Cadastro')),
          body:SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
            child: Form(child:Column(
              children: [

                TextFormField(
                  keyboardType:TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Nome',
                  ),),

                TextFormField(
                  keyboardType:TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Endereço',
                  ),),
                TextFormField(
                  keyboardType:TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'email',
                  ),),
                TextFormField(
                  keyboardType:TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'CPF',
                  ),),
                RaisedButton(onPressed: cadastrar,
                  child: Text('Cadastrar'),)


              ],

            ),
            ),

          ),

        ),



      ],
    );
  }
}
