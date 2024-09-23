// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AddressOrderModel {
  final String id;
  final String endereco;
  final String numero;
  final String cep;
  final String bairro;
  final String cidade;
  final String estado;
  final String complemento;
  final String referencia;
  AddressOrderModel({
    required this.id,
    required this.endereco,
    required this.numero,
    required this.cep,
    required this.bairro,
    required this.cidade,
    required this.estado,
    required this.complemento,
    required this.referencia,
  });

  AddressOrderModel copyWith({
    String? id,
    String? endereco,
    String? numero,
    String? cep,
    String? bairro,
    String? cidade,
    String? estado,
    String? complemento,
    String? referencia,
  }) {
    return AddressOrderModel(
      id: id ?? this.id,
      endereco: endereco ?? this.endereco,
      numero: numero ?? this.numero,
      cep: cep ?? this.cep,
      bairro: bairro ?? this.bairro,
      cidade: cidade ?? this.cidade,
      estado: estado ?? this.estado,
      complemento: complemento ?? this.complemento,
      referencia: referencia ?? this.referencia,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'endereco': endereco,
      'numero': numero,
      'cep': cep,
      'bairro': bairro,
      'cidade': cidade,
      'estado': estado,
      'complemento': complemento,
      'referencia': referencia,
    };
  }

  factory AddressOrderModel.fromMap(Map<String, dynamic> map) {
    return AddressOrderModel(
      id: map['id'] as String,
      endereco: map['endereco'] as String,
      numero: map['numero'] as String,
      cep: map['cep'] as String,
      bairro: map['bairro'] as String,
      cidade: map['cidade'] as String,
      estado: map['estado'] as String,
      complemento: map['complemento'] as String,
      referencia: map['referencia'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AddressOrderModel.fromJson(String source) => AddressOrderModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AddressOrderModel(id: $id, endereco: $endereco, numero: $numero, cep: $cep, bairro: $bairro, cidade: $cidade, estado: $estado, complemento: $complemento, referencia: $referencia)';
  }

  @override
  bool operator ==(covariant AddressOrderModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.endereco == endereco &&
      other.numero == numero &&
      other.cep == cep &&
      other.bairro == bairro &&
      other.cidade == cidade &&
      other.estado == estado &&
      other.complemento == complemento &&
      other.referencia == referencia;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      endereco.hashCode ^
      numero.hashCode ^
      cep.hashCode ^
      bairro.hashCode ^
      cidade.hashCode ^
      estado.hashCode ^
      complemento.hashCode ^
      referencia.hashCode;
  }
}
