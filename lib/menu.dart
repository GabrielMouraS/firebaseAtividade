import 'package:flutter/material.dart';

import 'UI/tela_Mensagens.dart';
import 'UI/tela_ListarMensagens.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {

  final TextEditingController _userController = TextEditingController();
  final TextEditingController _friendController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Escolha a opção"),
        backgroundColor: Colors.blue,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              _abreTelaAdicionar(context, TelaMensagens());
            },
            tooltip: 'Clique para adicionar registros',
          ),
          IconButton(
            icon: Icon(Icons.public),
            onPressed: () {
              _abreTelaListar(context, TelaListarMensagens());
            },
            tooltip: 'Clique para visualizar os registros',
          )
        ],
      ),
      body: _body(context),
    );
  }

  _abreTelaAdicionar(ctx, page) {
    Navigator.push(ctx, MaterialPageRoute(builder: (BuildContext context) {
      return page;
    }));
  }

  _abreTelaListar(ctx, page) {
    Navigator.push(ctx, MaterialPageRoute(builder: (BuildContext context) {
      return page;
    }));
  }

  _body(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [


          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFFFF5252),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
            ),
            onPressed: () {

            },
            child: Text("Conversar", style: TextStyle(fontSize: 16)),
          ),


          Column(
            children: [
              Text(
                "Seu usuário:",
                style: TextStyle(fontSize: 18, color: Colors.black87),
              ),
              TextField(
                controller: _userController,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ],
          ),


          Divider(color: Colors.grey, thickness: 1),


          Column(
            children: [
              Text(
                "Com quem você quer conversar?",
                style: TextStyle(fontSize: 18, color: Colors.black87),
              ),
              TextField(
                controller: _friendController,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ],
          ),


          Divider(color: Colors.grey, thickness: 1),


          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFFFF5252),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
            ),
            onPressed: () {

            },
            child: Text("Histórico de mensagens", style: TextStyle(fontSize: 16)),
          ),

        ],
      ),
    );
  }
}