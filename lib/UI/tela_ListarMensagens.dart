import 'package:flutter/material.dart';

class TelaListarMensagens extends StatefulWidget{
  @override
  _TelaListarMensagensState createState() => _TelaListarMensagensState();
}

class _TelaListarMensagensState extends State<TelaListarMensagens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Mensagens"),
        )
    );
  }
}