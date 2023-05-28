import 'package:flutter/material.dart';

import '../../validation.dart';
import '../model/register_model.dart';
import 'two_page.dart';

class OnePage extends StatefulWidget {
  const OnePage({Key? key}) : super(key: key);

  @override
  State<OnePage> createState() => _OnePageState();
}

class _OnePageState extends State<OnePage> {
  final Validation validar = Validation();
  final _formKey = GlobalKey<FormState>();
  final RegisterModel usuario = RegisterModel();
  final resposta1 = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    resposta1.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Desafio 1'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            child: Form(
                key: this._formKey,
                child: Container(
                    //padding: EdgeInsets.all(10.0),
                    child: Column(
                  children: [
                    Container(
                      child: Image.asset('assets/images/4.jpg'),
                      width: 300,
                      height: 300,
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(100, 30, 100, 30),
                      child: TextFormField(
                        controller: resposta1,
                        decoration: InputDecoration(
                          label: Text('Resposta'),
                          hintText: 'Digite sua resposta e tecle OK',
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 0.1,
                                  color: Colors.green,
                                  style: BorderStyle.solid)),
                        ),
                        validator: (resposta1) =>
                            validar.resposta1(resposta1.toString()),
                        onSaved: (String? resposta1) {
                          usuario.resposta1 = resposta1 as int?;
                        },
                      ),
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      child: Text('OK'),
                      onPressed: () {
                        _onSubmit(context);
                      },
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                        child: Text('Próximo desafio'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TwoPage()));
                        }),
                    SizedBox(height: 10),
                    ElevatedButton(
                      child: Text('Sair'),
                      onPressed: () {
                        Navigator.pushNamed(context, '/home');
                      },
                    )
                  ],
                )))));
  }

  void _onSubmit(inContext) {
    if (_formKey.currentState!.validate()) {
      print('Formulário Validado!');
      // Salva os dados preenchido no formulário através
      // das propriedades onSaved de cada campo do formulário
      _formKey.currentState!.save();
      // chama a rota nomeada enviando enviando os dados do usuário
      // só que agora os dados do usuário são enviados
      // como argumentos da rota
      Navigator.of(inContext).pushNamed('/jogo2', arguments: usuario);
      // Navigator.of(inContext)
      //     .pushNamed(RegisterModel(resposta1: int), arguments: usuario);
    } else {
      print('********* Formulário de validação de resposta. ********');
      showDialog(
        context: inContext,
        barrierDismissible: false,
        builder: (inContext) {
          return WillPopScope(
            onWillPop: () async => false,
            child: AlertDialog(
              title: Text('Não entrou com nenhuma resposta!'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(inContext);
                  },
                  child: Text('Cancelar'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(inContext);
                  },
                  child: Text('OK'),
                ),
              ],
            ),
          );
        },
      );
    }
  }
}
