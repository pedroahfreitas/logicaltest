import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  // Função para criar um novo usuário no Firebase Authentication
  Future<void> _createUser() async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
              email: _emailController.text.trim(),
              password: _passwordController.text.trim());
      if (userCredential.user != null) {
        // Armazena informações adicionais do usuário no Firestore
        await _db.collection('users').doc(userCredential.user!.uid).set({
          'email': userCredential.user!.email,
        });

        // Navegue para a próxima página após o cadastro
        Navigator.pushReplacementNamed(context, '/home');
      }
    } catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Erro'),
            content: Text(e.toString()),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, insira um email válido';
                  }
                  return null;
                },
              ),
              SizedBox(height: 8.0),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Senha'),
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, insira uma senha válida';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _createUser,
                child: Text('Cadastrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
