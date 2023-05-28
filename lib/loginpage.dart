import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'signuppage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  // Função para realizar o login do usuário
  Future<void> _loginUser() async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());
      if (userCredential.user != null) {
        // Navegue para a próxima página após o login
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
        title: Text('Login'),
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
                onPressed: _loginUser,
                child: Text('Entrar'),
              ),
              ElevatedButton(
                child: Text('Cadastrar'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignupPage()),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
