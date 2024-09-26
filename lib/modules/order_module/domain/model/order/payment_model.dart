// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PaymentModel {
  final String id;
  final int parcela;
  final num valor;
  final String codigo;
  final String nome;
  PaymentModel({
    required this.id,
    required this.parcela,
    required this.valor,
    required this.codigo,
    required this.nome,
  });

  PaymentModel copyWith({
    String? id,
    int? parcela,
    num? valor,
    String? codigo,
    String? nome,
  }) {
    return PaymentModel(
      id: id ?? this.id,
      parcela: parcela ?? this.parcela,
      valor: valor ?? this.valor,
      codigo: codigo ?? this.codigo,
      nome: nome ?? this.nome,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'parcela': parcela,
      'valor': valor,
      'codigo': codigo,
      'nome': nome,
    };
  }

  factory PaymentModel.fromMap(Map<String, dynamic> map) {
    return PaymentModel(
      id: map['id'] as String,
      parcela: map['parcela'] as int,
      valor: map['valor'] as num,
      codigo: map['codigo'] as String,
      nome: map['nome'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PaymentModel.fromJson(String source) => PaymentModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PaymentModel(id: $id, parcela: $parcela, valor: $valor, codigo: $codigo, nome: $nome)';
  }

  @override
  bool operator ==(covariant PaymentModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.parcela == parcela &&
      other.valor == valor &&
      other.codigo == codigo &&
      other.nome == nome;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      parcela.hashCode ^
      valor.hashCode ^
      codigo.hashCode ^
      nome.hashCode;
  }
}
