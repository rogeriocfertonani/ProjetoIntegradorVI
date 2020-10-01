import 'package:flutter/material.dart';
class Cadastro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Scaffold(
          appBar: AppBar(title:Text('Cadastre-se')),
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
                RaisedButton(onPressed: (){},
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
