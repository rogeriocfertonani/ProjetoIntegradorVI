import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Usuarios extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Usuarios> {

  void recuperaDonatarios() async {
//      QuerySnapshot querySnapshot = await Firestore.instance.collection("Doações")
//          .getDocuments();
//      for(DocumentSnapshot item in querySnapshot.documents){
//        var dados = item.data;
//        print("Usuarios" + dados.toString());
//
//      }
    Firestore.instance.collection("Doações").snapshots().listen(
            (snapshot) {
          for (DocumentSnapshot item in snapshot.documents) {
            var dados = item.data;
            print("Usuarios" + dados.toString());
          }
        });
  }


  @override
  Widget build(BuildContext context) {
    //recuperaDonatarios();
//    return Container();
    return Stack(
        children: <Widget>[
          Scaffold(
              appBar: AppBar(title: Text('Usuários Cadastrados')),
              body:
              Center(
                      child: Scrollbar(
                          child: StreamBuilder(
                                stream: Firestore.instance.collection("Donatário").snapshots(),
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
                                                      leading: Icon(Icons.verified_user),
                                                      title: Text(ds["Nome"]),
                                                      subtitle: Text(ds["email"]),
                                                    ),
                                                  ),
                                              ),

                                            ]

                                        );
                                      }
                                  );
                                }


                            )
                            )


                      )

              )

        ]
    );
  }
}
//class Usuarios_old extends StatelessWidget {
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
