import 'package:flutter/material.dart';
class Instituicao extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Scaffold(
          appBar: AppBar(title:Text('Cadastro de instituição')),
          body:SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
            child: Form(child:Column(
              children: [

                TextFormField(
                  keyboardType:TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Razao Social',
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
                    labelText: 'Cnpj',
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
