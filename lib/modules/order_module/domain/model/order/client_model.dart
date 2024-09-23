// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ClientModel {
  final String id;
  final String cnpj;
  final String cpf;
  final String nome;
  final String razaoSocial;
  final String email;
  final String dataNascimento;
  ClientModel({
    required this.id,
    required this.cnpj,
    required this.cpf,
    required this.nome,
    required this.razaoSocial,
    required this.email,
    required this.dataNascimento,
  });

  ClientModel copyWith({
    String? id,
    String? cnpj,
    String? cpf,
    String? nome,
    String? razaoSocial,
    String? email,
    String? dataNascimento,
  }) {
    return ClientModel(
      id: id ?? this.id,
      cnpj: cnpj ?? this.cnpj,
      cpf: cpf ?? this.cpf,
      nome: nome ?? this.nome,
      razaoSocial: razaoSocial ?? this.razaoSocial,
      email: email ?? this.email,
      dataNascimento: dataNascimento ?? this.dataNascimento,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'cnpj': cnpj,
      'cpf': cpf,
      'nome': nome,
      'razaoSocial': razaoSocial,
      'email': email,
      'dataNascimento': dataNascimento,
    };
  }

  factory ClientModel.fromMap(Map<String, dynamic> map) {
    return ClientModel(
      id: map['id'] as String,
      cnpj: map['cnpj'] as String,
      cpf: map['cpf'] as String,
      nome: map['nome'] as String,
      razaoSocial: map['razaoSocial'] as String,
      email: map['email'] as String,
      dataNascimento: map['dataNascimento'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ClientModel.fromJson(String source) => ClientModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ClientModel(id: $id, cnpj: $cnpj, cpf: $cpf, nome: $nome, razaoSocial: $razaoSocial, email: $email, dataNascimento: $dataNascimento)';
  }

  @override
  bool operator ==(covariant ClientModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.cnpj == cnpj &&
      other.cpf == cpf &&
      other.nome == nome &&
      other.razaoSocial == razaoSocial &&
      other.email == email &&
      other.dataNascimento == dataNascimento;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      cnpj.hashCode ^
      cpf.hashCode ^
      nome.hashCode ^
      razaoSocial.hashCode ^
      email.hashCode ^
      dataNascimento.hashCode;
  }
}
