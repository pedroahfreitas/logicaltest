import 'package:flutter/material.dart';
import '../../validation.dart';
import '../model/register_model.dart';
import 'four_page.dart';

class ThreePage extends StatefulWidget {
  const ThreePage({Key? key}) : super(key: key);

  @override
  State<ThreePage> createState() => _ThreePageState();
}

class _ThreePageState extends State<ThreePage> {
  final Validation validar = Validation();
  final _formKey = GlobalKey<FormState>();
  final RegisterModel usuario = RegisterModel();
  final resposta3 = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    resposta3.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Desafio 3'),
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
                      child: Image.asset('assets/images/8.jpg'),
                      width: 300,
                      height: 300,
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(100, 30, 100, 30),
                      child: TextFormField(
                        controller: resposta3,
                        decoration: InputDecoration(
                          label: Text('Resposta'),
                          hintText: 'Digite sua resposta e tecle OK',
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 0.1,
                                  color: Colors.green,
                                  style: BorderStyle.solid)),
                        ),
                        validator: (resposta3) =>
                            validar.resposta3(resposta3.toString()),
                        onSaved: (String? resposta3) {
                          usuario.resposta3 = resposta3 as int?;
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
                                  builder: (context) => FourPage()));
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
      Navigator.of(inContext).pushNamed('/jogo3', arguments: usuario);
      // Navigator.of(inContext)
      //     .pushNamed(Routes.PAGINA_JOGO2, arguments: usuario);
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
