import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Instituicao extends StatefulWidget {
  @override

  _InstituicaoState createState() => _InstituicaoState();
}

class _InstituicaoState extends State<Instituicao> {
  final _formKeyScreen = GlobalKey<FormState>();
  FocusNode myFocusNode;
  String razaoSocial, email, endereco, cnpj;

  _getNome(nome) {
    this.razaoSocial = nome;
  }

  _getEndereco(endereco) {
    this.endereco = endereco;
  }

  _getEmail(email) {
    this.email = email;
  }

  _getCNPJ(CNPJ) {
    this.cnpj = CNPJ;
  }

  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
    //print("passou no focusnode");
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    myFocusNode.dispose();

    super.dispose();
  }

  void cadastrar() {
//    Firestore.instance
//        .collection("Instituicao")
//        .document("endereco")

//        .setData({"rua":"Angelina","numero":40});

//    print("cadastrou!!!!!!!");
    Map<String, dynamic> mapainclusao;
    mapainclusao = {
      "Nome": this.razaoSocial,
      "Endereco": this.endereco,
      "email": this.email,
      "CNPJ": this.cnpj
    };

    DocumentReference documentReference = Firestore.instance
        .collection("Instituição")
        .document();
    documentReference.setData(mapainclusao).whenComplete(() =>
    {
      _limparFormulario(),
      _showDialog()});
  }


  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // retorna um objeto do tipo Dialog
        return AlertDialog(
          title: new Text("Cadastro"),
          content: new Text(
              "Cadastramento de Instituição efetuado com sucesso !"),
          actions: <Widget>[
            // define os botões na base do dialogo
            new FlatButton(
              child: new Text("Fechar"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  _limparFormulario() {
    _formKeyScreen.currentState?.reset();
    myFocusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Scaffold(

          appBar: AppBar(title: Text('Cadastro de instituição')),

          body: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),

            child: Form(
              key:_formKeyScreen,
              child: Column(
              children: [

                TextFormField(
                    keyboardType: TextInputType.text,
                    focusNode: myFocusNode,
                    decoration: InputDecoration(
                      labelText: 'Razao Social',
                    ),
                    onChanged: (String nome) {
                      _getNome(nome);
                    }),

                TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Endereço',
                    ),
                    onChanged: (String endereco) {
                      _getEndereco(endereco);
                    }),

                TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'email',
                    ),
                    onChanged: (String email) {
                      _getEmail(email);
                    }),

                TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Cnpj',
                    ),
                    onChanged: (String CNPJ) {
                      _getCNPJ(CNPJ);
                    }),
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
