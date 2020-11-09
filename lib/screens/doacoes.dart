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

  retornaSnapshot() {
    var stream = Firestore.instance.collection("Doações").snapshots();

    stream.forEach((element) {
      element.documents.forEach(
              (element) {print(element["Instituicao"]);

              });});



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
                            StreamBuilder(
                                stream: retornaSnapshot(),
                                builder: (context, snapshot) {
                                  return Scrollbar(
                                      child:ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: snapshot.data.documents.length,
                                          itemBuilder: (context, index) {
                                            DocumentSnapshot ds = snapshot.data
                                                .documents[index];
                                            return Row(
                                                children: <Widget>[
                                                  Expanded(

                                                    child: Card(

                                                      child:Material(
                                                        elevation: 4.0,
                                                        borderRadius: BorderRadius.circular(5.0),
                                                      color: index%2==0?Colors.lime:Colors.black26,
                                                      child: ListTile(
                                                        leading: Icon(Icons.done),
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
                                      )
                                  );
                                  if(snapshot.hasData) {
                                }
                                else {print("deu merda");return Container(width: 0.0,height:0.0);}
                                }


                            )


                      )
                  //)
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
