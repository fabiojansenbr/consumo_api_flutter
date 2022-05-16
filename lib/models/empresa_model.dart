import 'dart:convert';

class EmpresaModel {
  final String id;
  final String nome;
  final String email;

  EmpresaModel({
    required this.id,
    required this.nome,
    required this.email,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'nome': nome});
    result.addAll({'email': email});

    return result;
  }

  factory EmpresaModel.fromMap(Map<String, dynamic> map) {
    return EmpresaModel(
      id: map['id'] ?? '',
      nome: map['nome'] ?? '',
      email: map['email'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory EmpresaModel.fromJson(String source) =>
      EmpresaModel.fromMap(json.decode(source));
}
