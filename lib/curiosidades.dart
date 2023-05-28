import 'package:flutter/material.dart';
import 'register/model/register_model.dart';

class CuriosidadesPage extends StatefulWidget {
  const CuriosidadesPage({Key? key}) : super(key: key);

  @override
  State<CuriosidadesPage> createState() => _CuriosidadesPageState();
}

class _CuriosidadesPageState extends State<CuriosidadesPage> {
  late RegisterModel registerModel;

  @override
  void dispose() {
    super.dispose();
    //   resposta2.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          title: Text('Curiosidades'),
          backgroundColor: Colors.black,
          leading: IconButton(
            icon: Icon(Icons.menu),
            tooltip: 'Menu',
            onPressed: () {},
          ) //IconButton
          ), //AppBar
      body: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Tooltip(
                message: 'Text',
                child: Text(
                  'Você sabia que os testes de lógica são mais fáceis do que se imagina?',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
            color: Colors.blueAccent,
            width: 300,
            height: 175,
          ),
        ],
      )),
    ); //MaterialApp
  }
}
