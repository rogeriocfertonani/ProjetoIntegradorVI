import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Doacoes extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Doacoes> {
  bool checkboxvalue = false;
  FirebaseUser user;
  List lista = List();

  void recuperaDoacoes() async {
//      QuerySnapshot querySnapshot = await Firestore.instance.collection("Doações")
//          .getDocuments();
//      for(DocumentSnapshot item in querySnapshot.documents){
//        var dados = item.data;
//        print("doacoes" + dados.toString());
//
//      }


    Firestore.instance.collection("Doações").snapshots().listen(
            (snapshot) {
          for (DocumentSnapshot item in snapshot.documents) {
            var dados = item.data;
            print("doacoes" + dados.toString());
          }
        });
  }


  retornaUserId() async {
    String hashusuario;
    await FirebaseAuth.instance.currentUser().then((value) => user = value);
    return user.uid.toString();

  }

  retornaSnapshot()  {
    var stream   =  Firestore.instance.collection("Doações").snapshots();
      stream.forEach((element) {

      element.documents.forEach(
                (element) {
                  print(element["Instituicao"]);
//                  print(element.documentID);

                 lista.add(false);
              }

              );});
    return stream;
  }



  @override
  Widget build(BuildContext context) {
    //recuperaDoacoes();
//    return Container();
    return Stack(
        children: <Widget>[
          Scaffold(
              appBar: AppBar(title: Text('Doações disponíveis')),
              body:
              Container(
                  child: Scrollbar(
                        child:
//                          Column(
//                          children: <Widget>[
                          StreamBuilder(
                              stream: retornaSnapshot(),
                              builder: (context, snapshot) {
                                return Scrollbar(
                                  child:ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: snapshot.data.documents.length,
                                      itemBuilder: (context, index) {
                                        DocumentSnapshot ds = snapshot.data.documents[index];
                                        return Row(
                                            children: <Widget>[
                                              Expanded(
                                                child:Card(
                                                    child:Material(
                                                      elevation: 4.0,
                                                      borderRadius: BorderRadius.circular(5.0),
                                                      color: index%2==0?Colors.blue:Colors.black26,
                                                      child: ListTile(
                                                        leading:
                                                        Checkbox(value: lista[index],
                                                          key: Key(index.toString()),
                                                          onChanged: (bool value){
                                                            setState(() {
                                                              procederPedidoDeDoacao(ds.documentID.toString(),value);
                                                              lista[index] = value;
                                                            });
                                                          },
                                                        ),
                                                        title: Text(
                                                            ds["Instituicao"]),
                                                        subtitle: Text(ds["tipo"]),

                                                      ),
                                                    )
                                                ),
                                              ),

                                            ]

                                        );
                                      }
                                  ),


                                );
                                if(snapshot.hasData) {
                                }
                                else {print("erro");return Container(width: 0.0,height:0.0);}
                              }


                          )


                      )
                  //)
              )

          )
        ]
    );
  }

   procederPedidoDeDoacao (String codigodoacao, bool value) async{
    String usuario = await retornaUserId();
    Map<String,dynamic> mapainclusao;
    mapainclusao = {
      "codigodoacao": codigodoacao,
      "codigodonatario":usuario
    };

    DocumentReference documentReference = Firestore.instance
        .collection("DoacaoEfetuada").document();
    documentReference.setData(mapainclusao);
//documentReference.setData(mapainclusao).whenComplete(() => {
//      _limparFormulario(),
//      _showDialog()});


  }
}
//class Doacoes_old extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Stack(
//      children: [
//         Scaffold(
//            appBar: AppBar(title: Text('Procurar doações'),),
//            body: Column(
//              children: [
//                Card(
//                  child: ListTile(
//                    leading: Icon(Icons.done),
//                    title: Text('Casas André luiz'),
//                    subtitle: Text('Tipo: Cesta Básica'),
//                  ),
//                ),
//                Card(
//                  child: ListTile(
//                    leading: Icon(Icons.done),
//                    title: Text('Portas Abertas'),
//                    subtitle: Text('Tipo: Cesta Básica'),
//                  ),
//                ),
//                Card(
//                  child: ListTile(
//                    leading: Icon(Icons.done),
//                    title: Text('Ong Viver'),
//                    subtitle: Text('Tipo: Cesta Básica'),
//                  ),
//                ),
//                Card(
//                  child: ListTile(
//                    leading: Icon(Icons.done),
//                    title: Text('Projeto Generosidade'),
//                    subtitle: Text('Tipo: Cesta Básica'),
//                  ),
//                ),
//              ],
//            ),
//
//
//
//          ),
//
//      ],
//    );
//  }
//}
//
