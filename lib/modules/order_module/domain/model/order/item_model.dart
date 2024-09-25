// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ItemModel {
   String id;
   String idProduto;
   String nome;
   int quantidade;
   num valorUnitario;
  ItemModel({
    required this.id,
    required this.idProduto,
    required this.nome,
    required this.quantidade,
    required this.valorUnitario,
  });

  ItemModel copyWith({
    String? id,
    String? idProduto,
    String? nome,
    int? quantidade,
    num? valorUnitario,
  }) {
    return ItemModel(
      id: id ?? this.id,
      idProduto: idProduto ?? this.idProduto,
      nome: nome ?? this.nome,
      quantidade: quantidade ?? this.quantidade,
      valorUnitario: valorUnitario ?? this.valorUnitario,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'idProduto': idProduto,
      'nome': nome,
      'quantidade': quantidade,
      'valorUnitario': valorUnitario,
    };
  }

  factory ItemModel.fromMap(Map<String, dynamic> map) {
    return ItemModel(
      id: map['id'] as String,
      idProduto: map['idProduto'] as String,
      nome: map['nome'] as String,
      quantidade: map['quantidade'] as int,
      valorUnitario: map['valorUnitario'] as num,
    );
  }

  String toJson() => json.encode(toMap());

  factory ItemModel.fromJson(String source) => ItemModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ItemModel(id: $id, idProduto: $idProduto, nome: $nome, quantidade: $quantidade, valorUnitario: $valorUnitario)';
  }

  @override
  bool operator ==(covariant ItemModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.idProduto == idProduto &&
      other.nome == nome &&
      other.quantidade == quantidade &&
      other.valorUnitario == valorUnitario;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      idProduto.hashCode ^
      nome.hashCode ^
      quantidade.hashCode ^
      valorUnitario.hashCode;
  }
}
