import 'package:doar_app/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';



class LoginUsuario extends StatefulWidget {
  @override
  _LoginUsuarioState createState() => _LoginUsuarioState();
}

class _LoginUsuarioState extends State<LoginUsuario> {
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
  void cadastrar() {
    FirebaseAuth  auth = FirebaseAuth.instance;

    auth.createUserWithEmailAndPassword(email: email, password: senha).then((value) =>
        Navigator.push(context,MaterialPageRoute(builder:(context)=>HomeScreen()),)
    ).catchError((onError){_showDialog("Usuário já em uso, escolha outro nome ");});
    }

  void Logar(){
    FirebaseAuth auth = FirebaseAuth.instance;

   // var navega =Navigator.push(context,MaterialPageRoute(builder:(context)=>HomeScreen()),);
    auth.signInWithEmailAndPassword(email: email, password: senha)
       .then((value) => Navigator.push(context,MaterialPageRoute(builder:(context)=>HomeScreen()),))
      .catchError((onError) =>  _showDialog("Usuário ou senha incorretos !"));

  }

  void _showDialog(String mensagem) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // retorna um objeto do tipo Dialog
        return AlertDialog(
          title: new Text("Erro"),
          content: new Text(mensagem),
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

  String nome,senha,email,CNPJ;

  _getEmail(email){
    this.email = email;
//    this.email = "cacilds@gamil.com";

  }
  _getSenha(endereco){
    this.senha = endereco;
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bem vindo ',
      home: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              colorFilter: ColorFilter.mode(Colors.blueGrey, BlendMode.lighten),
                image: AssetImage("imagens/hand-giving-soup-bowl-needy-person.jpg"),
                fit: BoxFit.cover)),

        child:Scaffold(
          backgroundColor: Colors.transparent,

          appBar: AppBar(title:Text('Login / Registro'),
           //backgroundColor: Colors.transparent,
          ),
          body:SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
            child:Form(
              key:_formKeyScreen,

              child:Column(


                children: [
//                  Positioned.fill(child: Image(image:AssetImage('imagens/cacildis.jpg'),
//                  fit:BoxFit.fill)),
//                //Image.asset('imagens/cacildis.jpg'),


                  TextFormField(
                      keyboardType:TextInputType.text,
                      focusNode: myFocusNode,
                      decoration: InputDecoration(
                        labelText: 'Email:',
                      ),
                      onChanged:(String email){ _getEmail(email);}
                  ),TextFormField(
                      keyboardType:TextInputType.visiblePassword,
                      obscureText: true,
                      validator: (value) => "teste",
                      decoration: InputDecoration(
                        icon: Icon(Icons.lock),
                        labelText: 'Senha:',

                      ),
                      onChanged:(String senha){ _getSenha(senha);}
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [RaisedButton(onPressed: Logar,
                    color: Colors.blue,
                    child: Text('Logar'),

                  ),

                  InkWell(
                    hoverColor: Colors.red,
                    child:

                    Text("Registrar",
                         style : TextStyle(fontSize: 12,fontStyle: FontStyle.italic)

                    ),
                    onTap: cadastrar,
                  )])

                ],

              ),
            ),


          ),

        ),
      ),
    );
  }//  @override

  Widget build_old(BuildContext context) {
    return  Stack(
      children: <Widget>[
        Scaffold(

          appBar: AppBar(title:Text('Login / Registro')),
          body:SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
            child:Form(
              key:_formKeyScreen,

              child:Column(

                children: [

//                  Positioned.fill(child: Image(image:AssetImage('imagens/cacildis.jpg'),
//                  fit:BoxFit.fill)),
//                //Image.asset('imagens/cacildis.jpg'),

                  TextFormField(
                      keyboardType:TextInputType.text,
                      focusNode: myFocusNode,
                      decoration: InputDecoration(
                        labelText: 'Email:',
                      ),
                      onChanged:(String email){ _getEmail(email);}
                  ),TextFormField(
                      keyboardType:TextInputType.visiblePassword,
                      obscureText: true,
                      validator: (value) => "teste",
                      decoration: InputDecoration(
                        icon: Icon(Icons.lock),
                        labelText: 'Senha:',

                      ),
                      onChanged:(String senha){ _getSenha(senha);}
                  ),
                  RaisedButton(onPressed: Logar,
                    color: Colors.blue,
                    child: Text('Logar'),

                  ),
                  RaisedButton(onPressed: cadastrar,
                    child: Text('Registrar Usuário'),

                  ),


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

