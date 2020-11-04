import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Doar extends StatefulWidget {
  @override
  _DoarState createState() => _DoarState();
}

class _DoarState extends State<Doar> {
  String nomeCidade="";
  var _instituicoes;
//  var _instituicoes =['Santos','Porto Alegre','Campinas','Rio de Janeiro'];
//  var _instituicoes =['Portuguesxxxxxxxxxxx','Porto Alegre','Campinas','Rio de Janeiro'];
//
 // var _itemSelecionado = _instituicoes.first;
//  var _itemSelecionado = 'Portuguesxxxxxxxxxxx';
   var _itemSelecionado;


  void  recuperaDoacoes() async {
    QuerySnapshot querySnapshot = await Firestore.instance.collection("Instituição")
        .getDocuments();
//    List<String> listadoacoes = List<String>();

    for (DocumentSnapshot item in querySnapshot.documents) {
      var dados = item.data;
      _instituicoes.add(dados["Nome"]);
    }
    print(_instituicoes.toString());

  }

  criaDropDownButton() {
    recuperaDoacoes();
    return Container(
      child: Column(
        children: <Widget>[
          Text("Selecione a cidade"),
          TextField(
            onSubmitted: (String userInput) {
              setState(() {
                debugPrint('chamei setState');
                nomeCidade = userInput;
              });
            },
          ),
          DropdownButton<String>(
              items : _instituicoes.map((String dropDownStringItem) {
                return DropdownMenuItem<String>(
                  value: dropDownStringItem,
                  child: Text(dropDownStringItem),
                );
              }).toList(),
              onChanged: ( String novoItemSelecionado) {
                _dropDownItemSelected(novoItemSelecionado);
                setState(() {
                  this._itemSelecionado =  novoItemSelecionado;
                });
              },
              value: _itemSelecionado
          ),
          Text("A cidade selecionada foi \n$_itemSelecionado",
            style: TextStyle(fontSize: 20.0),
          ),
        ],
      ),
    );
  }
  void _dropDownItemSelected(String novoItem){
    setState(() {
      this._itemSelecionado = novoItem;
    });
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fazer doação"),
        backgroundColor: Colors.blue,
      ),
      body: criaDropDownButton(),
    );
  }

//  static List<String> pesquisaDoacoes()  {
//          QuerySnapshot querySnapshot =  Firestore.instance.collection("Instituição").getDocuments() ;
//          List<String> instituicoes = List<String>();
//
//      for(DocumentSnapshot item in querySnapshot.documents){
//        var dados = item.data;
//        instituicoes.add(dados["nome"]);
//      }
//    return instituicoes;
//
//  }

}
//class Doar extends StatefulWidget {
//  @override
//  _DoarState createState() => _DoarState();
//}
//
//class _DoarState extends State<Doar> {
//  String nomeCidade="";
////  var _instituicoes =  List<String>();
//  var _instituicoes =  ['Santos','Porto Alegre','Campinas','Rio de Janeiro'];
////  var _instituicoes =  ["Portuguese" 	, "Bar e café seila"	, "Casas Andre luiz"];
//
//
//  var _itemSelecionado = '';
//
//  void  recuperaDoacoes() async {
//    QuerySnapshot querySnapshot = await Firestore.instance.collection("Instituição")
//        .getDocuments();
//    List<String> listadoacoes = List<String>();
//
//    for (DocumentSnapshot item in querySnapshot.documents) {
//      var dados = item.data;
//      _instituicoes.add(dados["Nome"]);
//    }
//    print(_instituicoes.toString());
//
//  }
//
//  criaDropDownButton() {
////    recuperaDoacoes();
//    return Container(
//      child: Column(
//        children: <Widget>[
//          Text("Selecione a cidade"),
//          TextField(
//            onSubmitted: (String userInput) {
//              setState(() {
//                debugPrint('chamei setState');
//                nomeCidade = userInput;
//              });
//            },
//          ),
//          DropdownButton<String>(
//              items : _instituicoes.map((String dropDownStringItem) {
//                return DropdownMenuItem<String>(
//                  value: dropDownStringItem,
//                  child: Text(dropDownStringItem),
//                );
//              }).toList(),
//              onChanged: ( String novoItemSelecionado) {
//                _dropDownItemSelected(novoItemSelecionado);
//                setState(() {
//                  this._itemSelecionado =  novoItemSelecionado;
//                });
//              },
//              value: _itemSelecionado
//          ),
//          Text("A cidade selecionada foi \n$_itemSelecionado",
//            style: TextStyle(fontSize: 20.0),
//          ),
//        ],
//      ),
//    );
//  }
//
//void _dropDownItemSelected(String novoItem){
//  setState(() {
//    this._itemSelecionado = novoItem;
//  });
//}
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text("Fazer doação"),
//        backgroundColor: Colors.blue,
//      ),
//      body: criaDropDownButton(),
//    );
//  }
//
////  static List<String> pesquisaDoacoes()  {
////          QuerySnapshot querySnapshot =  Firestore.instance.collection("Instituição").getDocuments() ;
////          List<String> instituicoes = List<String>();
////
////      for(DocumentSnapshot item in querySnapshot.documents){
////        var dados = item.data;
////        instituicoes.add(dados["nome"]);
////      }
////    return instituicoes;
////
////  }
//
//}
