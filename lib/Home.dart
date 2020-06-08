import 'package:flutter/material.dart';
import 'package:youtube/telas/Biblioteca.dart';
import 'package:youtube/telas/CustomSearchDelegate.dart';
import 'package:youtube/telas/EmAlta.dart';
import 'package:youtube/telas/Inscricao.dart';
import 'package:youtube/telas/Inicio.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String resultado = "";
  int _indiceAtual = 0;

  @override
  Widget build(BuildContext context) {

    List<Widget> telas = [
      Inicio(this.resultado),
      EmAlta(),
      Inscricao(),
      Biblioteca(),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Image.asset("imagens/youtube.png",
        scale: 10,),
        iconTheme: IconThemeData(
          color: Colors.grey
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: ()async {
              String result = await showSearch(context: context, delegate: CustomSearchDelegate()) as String;
              print("result $result");
              setState(() {
                resultado = result;
              });
            },
          ),
//          IconButton(
//            icon: Icon(Icons.videocam),
//            onPressed: (){},
//          ),
//
//          IconButton(
//            icon: Icon(Icons.account_circle),
//            onPressed: (){},
//          )
        ],
      ),
      body: Container(child: Center(
        child: telas[_indiceAtual],
      ),),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.red,
          currentIndex: _indiceAtual,
          onTap: (indice){
          setState(() {
            _indiceAtual = indice;
          });
          },
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                backgroundColor: Colors.orange,
                title: Text("Início"),
                icon: Icon(Icons.home)
            ),
            BottomNavigationBarItem(
                backgroundColor: Colors.red,
                title: Text("Em alta"),
                icon: Icon(Icons.whatshot)
            ),
            BottomNavigationBarItem(
                backgroundColor: Colors.blue,
                title: Text("Inscrições"),
                icon: Icon(Icons.subscriptions)
            ),
            BottomNavigationBarItem(
                backgroundColor: Colors.blue,
                title: Text("Biblioteca"),
                icon: Icon(Icons.folder)
            ),
          ]
      ),
    );
  }
}
