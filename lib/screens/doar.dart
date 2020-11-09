import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Doar extends StatefulWidget {
  @override
  _DoarState createState() => _DoarState();
}

class _DoarState extends State<Doar> {
  final _formKeyScreen = GlobalKey<FormState>();
  FocusNode myFocusNode;

  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
  }
  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    myFocusNode.dispose();

    super.dispose();
  }
  void cadastrar(){

//    Firestore.instance
//        .collection("Instituicao")
//        .document("endereco")
//        .setData({"rua":"Angelina","numero":40});

//    print("Doaru!!!!!!!");
    Map<String,dynamic> mapainclusao;
    mapainclusao = {
      "Instituicao": this.nome,
      "CNPJ":this.CNPJ,
      "tipo":this.tipodoacao
    };

    DocumentReference documentReference = Firestore.instance
        .collection("Doações")
        .document();
    documentReference.setData(mapainclusao).whenComplete(() => {
      _limparFormulario(),
      _showDialog()});
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // retorna um objeto do tipo Dialog
        return AlertDialog(
          title: new Text("Doar"),
          content: new Text("Cadastramento de doação efetuado com sucesso !"),
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

  String nome,tipodoacao,email,CNPJ;

  _getNome(nome){
    this.nome = nome;

  }
  _getTipoDoacao(endereco){
    this.tipodoacao = endereco;
  }

  _getEmail(email){
    this.email = email;

  }
  _getCNPJ(CNPJ){
    this.CNPJ = CNPJ;
  }

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: <Widget>[
        Scaffold(
          appBar: AppBar(title:Text('Doar')),
          body:SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
            child: Form(
              key:_formKeyScreen,
              child:Column(
                children: [

                  TextFormField(
                      keyboardType:TextInputType.text,
                      focusNode: myFocusNode,
                      decoration: InputDecoration(
                        labelText: 'Nome',

                      ),
                      onChanged:(String nome){ _getNome(nome);}
                  ),TextFormField(
                      keyboardType:TextInputType.text,
                      decoration: InputDecoration(
                        labelText: 'Tipo de doação',

                      ),
                      onChanged:(String tipodoacao){ _getTipoDoacao(tipodoacao);}
                  ),
                  TextFormField(
                      keyboardType:TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'CNPJ',
                      ),
                      onChanged:(String CNPJ){ _getCNPJ(CNPJ);}
                  ),
                  RaisedButton(onPressed: cadastrar,
                    child: Text('Doar'),

                  )


                ],

              ),
            ),

          ),

        ),



      ],
    );
  }

  _limparFormulario() {

    _formKeyScreen.currentState?.reset();
    myFocusNode.requestFocus();
  }
}

