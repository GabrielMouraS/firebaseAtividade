import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebaseconexao/models/mensagens.dart';

class MessagesFirestore extends StatefulWidget {
  final String user;
  final String friend;

  const MessagesFirestore({super.key, required this.user, required this.friend});

  @override
  State<MessagesFirestore> createState() => _MessagesFirestoreState();
}

class _MessagesFirestoreState extends State<MessagesFirestore> {
  final TextEditingController _user = TextEditingController();
  final TextEditingController _friend = TextEditingController();
  final TextEditingController _msg = TextEditingController();

  List _resultsList = [];
  late QuerySnapshot result;

  @override
  void initState() {
    super.initState();
    _user.text = widget.user;
    _friend.text = widget.friend;
    inicializarFirebase();
  }


  Future<void> inicializarFirebase() async {
    await Firebase.initializeApp();
    print("Conectado no Firebase");
  }

  Future<void> _buscaRegistro() async {
    var banco = FirebaseFirestore.instance.collection("msg");
    var consulta = await banco
        .where("friend", isEqualTo: _friend.text.trim())
        .where("user", isEqualTo: _user.text.trim())
        .limit(100)
        .get();

    setState(() {
      _resultsList = consulta.docs;
    });
  }

  void _clicksend() {
    if (_msg.text.trim().isEmpty) return;

    Mensagens ms = Mensagens();
    ms.friend = _friend.text.toString().trim();
    ms.user = _user.text.toString().trim();
    ms.msg = _msg.text.toString().trim();
    ms.dt = DateTime.now();

    CollectionReference instanciaColecaoFirestore = FirebaseFirestore.instance.collection("msg");

    instanciaColecaoFirestore
        .doc(ms.dt.toString().trim())
        .set(ms.toJson())
        .then((value) {
      print("Mensagem adicionada");
      _msg.clear();
      _buscaRegistro();
    })
        .catchError((onError) => print("Erro ao gravar no banco $onError"));
  }


  Widget buildMessageCard(BuildContext context, DocumentSnapshot document) {
    final mensagem = Mensagens.fromSnapshot(document);
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: ListTile(
        title: Text(mensagem.msg),
        subtitle: Text(mensagem.dt.toString(), style: const TextStyle(fontSize: 10)),
      ),
    );
  }

  Widget ContainerOldMessages() {
    return ListView.builder(
      itemCount: _resultsList.length,
      itemBuilder: (BuildContext ctx, int index) =>
          buildMessageCard(ctx, _resultsList[index]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mensagens"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            Text(
              "Conversas com seu amigo: ${_friend.text}",
              style: const TextStyle(color: Color(0xFFFF5252), fontSize: 16),
            ),


            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: ContainerOldMessages(),
              ),
            ),


            const Text(
              "Digite a mensagem:",
              style: TextStyle(color: Color(0xFFFF5252), fontSize: 20),
            ),


            TextField(
              controller: _msg,
              decoration: const InputDecoration(

                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFFF5252)),
                ),
              ),
            ),
            const SizedBox(height: 20),


            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFF5252),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
              onPressed: _clicksend,
              child: const Text("Enviar", style: TextStyle(fontSize: 16)),
            ),
            const SizedBox(height: 10),


            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFF5252),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
              onPressed: _buscaRegistro,
              child: const Text("Receber", style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}