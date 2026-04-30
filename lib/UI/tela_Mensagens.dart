import 'package:flutter/material.dart';

class TelaMensagens extends StatefulWidget{
  @override
  _TelaMensagensState createState() => _TelaMensagensState();
}

class _TelaMensagensState extends State<TelaMensagens> {

  final TextEditingController _EnviarController = TextEditingController();
  final TextEditingController _ReceberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mensagens"),
      ),
      body: _body(context),
    );
  }

  _body(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [

          Column(
            children: [
              Text(
                "Conversas com seu amigo:",
                style: TextStyle(fontSize: 18, color: Colors.black87),
              ),
              TextField(
                controller: _EnviarController,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ],
          ),


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
            child: Text("Enviar"),
          ),


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
            child: Text("Receber"),
          ),

        ],
      ),
    );
  }
}