import 'package:flutter/material.dart';
class Doar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Scaffold(
          appBar: AppBar(title:Text('Doar')),
          body:SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
            child: Form(child:Column(
              children: [

                TextFormField(
                    keyboardType:TextInputType.number,
                    decoration: InputDecoration(
                      labelText: '0.00',
                    ),),
                RaisedButton(onPressed: (){},
                child: Text('Doar'),)


              ],

            ),
            ),

          ),

        ),



      ],
    );
  }
}
