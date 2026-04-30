import 'package:flutter/material.dart';

class TelaMensagens extends StatefulWidget{
  @override
  _TelaMensagensState createState() => _TelaMensagensState();
}

class _TelaMensagensState extends State<TelaMensagens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mensagens"),
      )
    );
  }
}