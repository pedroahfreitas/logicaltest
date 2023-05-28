//import 'dart:html';
//import 'dart:js';
//import 'package:flutter/material.dart';

class Validation {
  String? campoNome(String nome) {
    if (nome.isEmpty) {
      return 'Entre com seu nome';
    }
    return null;
  }

  String? campoSobreNome(String sobrenome) {
    if (sobrenome.isEmpty) {
      return 'Entre com seu nome';
    }
    return null;
  }

  String? campoEmail(String email) {
    if (email.isEmpty) {
      return 'Entre com seu e-mail';
    }
    if (!email.contains('@')) {
      return 'O email deve ser por exemplo seu-nome@mail.com';
    }
    if (email.length < 3) {
      return 'E-mail em formato inadequado';
    }
    return null;
  }

  String? campoSenha(String senha) {
    if (senha.isEmpty) {
      return 'Entre com sua senha';
    }
    if (senha.length < 4) {
      return 'A senha deve ter no mínimo 4 dígitos';
    }
    return null;
  }

//validação dos exercícios
  String? resposta1(String resposta1) {
    if (resposta1.isEmpty) {
      return 'Entre com a resposta';
    }
    if (resposta1 == '4') {
      return 'Parabéns!';
    }
    if (resposta1 != '4') {
      int _counter = 0;
      _counter++;
      if (_counter == 2) {
        return 'Você tem mais uma chance!';
      }
      if (_counter == 3) {
        return 'ir para rota';
      }
    }
    return null;
  }

  String? resposta2(String resposta2) {
    if (resposta2.isEmpty) {
      return 'Entre com a resposta';
    }
    if (resposta2 == '7') {
      return 'Parabéns!';
    }
    if (resposta2 != '7') {
      int _counter = 0;
      _counter++;
      if (_counter == 2) {
        return 'Você tem mais uma chance!';
      }
      if (_counter == 3) {
        return 'ir para rota';
      }
    }
    return null;
  }

  String? resposta3(String resposta3) {
    if (resposta3.isEmpty) {
      return 'Entre com a resposta';
    }
    if (resposta3 == '8') {
      return 'Parabéns!';
    }
    if (resposta1 != '8') {
      int _counter = 0;
      _counter++;
      if (_counter == 2) {
        return 'Você tem mais uma chance!';
      }
      if (_counter == 3) {
        return 'ir para rota';
      }
    }
    return null;
  }

  String? resposta4(String resposta4) {
    if (resposta4.isEmpty) {
      return 'Entre com a resposta';
    }
    if (resposta4 == '10') {
      return 'Parabéns!';
    }
    if (resposta4 != '10') {
      int _counter = 0;
      _counter++;
      if (_counter == 2) {
        return 'Você tem mais uma chance!';
      }
      if (_counter == 3) {
        return 'ir para rota';
      }
    }
    return null;
  }

  String? resposta5(String resposta5) {
    if (resposta5.isEmpty) {
      return 'Entre com a resposta';
    }
    if (resposta5 == '13') {
      return 'Parabéns!';
    }
    if (resposta5 != '13') {
      int _counter = 0;
      _counter++;
      if (_counter == 2) {
        return 'Você tem mais uma chance!';
      }
      if (_counter == 3) {
        return 'ir para rota';
      }
    }
    return null;
  }

  String? resposta6(String resposta6) {
    if (resposta6.isEmpty) {
      return 'Entre com a resposta';
    }
    if (resposta6 == '14') {
      return 'Parabéns!';
    }
    if (resposta6 != '14') {
      int _counter = 0;
      _counter++;
      if (_counter == 2) {
        return 'Você tem mais uma chance!';
      }
      if (_counter == 3) {
        return 'ir para rota';
      }
    }
    return null;
  }

  String? resposta7(String resposta7) {
    if (resposta7.isEmpty) {
      return 'Entre com a resposta';
    }
    if (resposta7 == '25a') {
      return 'Parabéns!';
    }
    if (resposta7 != '25a') {
      int _counter = 0;
      _counter++;
      if (_counter == 2) {
        return 'Você tem mais uma chance!';
      }
      if (_counter == 3) {
        return 'ir para rota';
      }
    }
    return null;
  }

  // String? resposta8(String resposta8) {
  //   if (resposta8.isEmpty) {
  //     return 'Entre com a resposta';
  //   }
  //   if (resposta8 == '25b') {
  //     return 'Parabéns!';
  //   }
  //   if (resposta8 != '25b') {
  //     int _counter = 0;
  //     _counter++;
  //     if (_counter == 2) {
  //       return 'Você tem mais uma chance!';
  //     }
  //     if (_counter == 3) {
  //       return 'ir para rota';
  //     }
  //   }
  //   return null;
  // }
}
