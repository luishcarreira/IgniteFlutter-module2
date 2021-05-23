import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var notes = <String>["Primeiro Item"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Notes'),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              var description =
                  await Navigator.pushNamed(context, "/create-note");
              if (description != null) {
                notes.add(description as String);
                setState(() {});
              }
            },
            icon: Icon(Icons.add),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            for (var i = 0; i < notes.length; i++)
              Card(
                child: ListTile(
                  title: Text(notes[i]),
                  onTap: () async {
                    var response = await Navigator.pushNamed(
                        context, "/create-note",
                        arguments: notes[i]);
                    //verificando se retorno é != nulo
                    if (response != null) {
                      //inserindo retorno na variavel para descrição da nota
                      var description = response as String;

                      //se retorno vazio *remover item da lista
                      //senao insere na lista
                      if (response.isEmpty) {
                        notes.removeAt(i);
                      } else {
                        notes[i] = description;
                      }

                      setState(() {});
                    }
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
