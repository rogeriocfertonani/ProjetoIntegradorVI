import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Doacoes extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Doacoes> {

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


  @override
  Widget build(BuildContext context) {
    //recuperaDoacoes();
//    return Container();
    return Stack(
        children: <Widget>[
          Scaffold(
              appBar: AppBar(title: Text('Doações disponíveis')),
              body: SingleChildScrollView(
                  padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                  child: Form(
                      child: Column(
                          children: [
                            StreamBuilder(
                                stream: Firestore.instance.collection("Doações").snapshots(),
                                builder: (context, snapshot) {
                                  return ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: snapshot.data.documents.length,
                                      itemBuilder: (context, index) {
                                        DocumentSnapshot ds = snapshot.data
                                            .documents[index];
                                        return Row(

                                            children: <Widget>[
                                              Expanded(
                                                  child:Card(
                                                    child: ListTile(
                                                      leading: Icon(Icons.done),
                                                      title: Text(ds["Instituicao"]),
                                                      subtitle: Text(ds["tipo"]),
                                                    ),
                                                  ),
                                              ),

                                            ]

                                        );
                                      }
                                  );
                                }


                            )
                          ]
                      )
                  )
              )
          )
        ]
    );
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
