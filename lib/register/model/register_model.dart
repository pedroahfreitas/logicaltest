class RegisterModel {
  final String? name;
  late final String? sobrenome;
  late final String? email;
  late final String? senha;
  late int? resposta1;
  late int? resposta2;
  late int? resposta3;
  late int? resposta4;
  late int? resposta5;
  late int? resposta6;
  late int? resposta7;
  // late int? resposta8;

  RegisterModel({
    this.name,
    this.sobrenome,
    this.email,
    this.senha,
    this.resposta1,
    this.resposta2,
    this.resposta3,
    this.resposta4,
    this.resposta5,
    this.resposta6,
    this.resposta7,
    // this.resposta8,
  });

  set nome(String? nome) {}
  RegisterModel copyWith({
    String? name,
    String? sobrenome,
    String? email,
    String? senha,
    int? resposta1,
    int? resposta2,
    int? resposta3,
    int? resposta4,
    int? resposta5,
    int? resposta6,
    int? resposta7,
    // int? resposta8,
  }) {
    return RegisterModel(
      name: name ?? this.name,
      sobrenome: sobrenome ?? this.sobrenome,
      email: email ?? this.email,
      senha: senha ?? this.senha,
      resposta1: resposta1 ?? this.resposta1,
      resposta2: resposta2 ?? this.resposta2,
      resposta3: resposta3 ?? this.resposta3,
      resposta4: resposta1 ?? this.resposta4,
      resposta5: resposta2 ?? this.resposta5,
      resposta6: resposta3 ?? this.resposta6,
      resposta7: resposta1 ?? this.resposta7,
      //resposta8: resposta2?? this.resposta8,
    );
  }

  @override
  String toString() =>
      'RegisterModel(name:$name, sobrenome:$sobrenome, email:$email, senha: $senha)';
}
