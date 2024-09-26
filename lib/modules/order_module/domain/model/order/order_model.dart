// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:order_app/modules/order_module/domain/model/order/address_order_model.dart';
import 'package:order_app/modules/order_module/domain/model/order/item_model.dart';
import 'package:order_app/modules/order_module/domain/model/order/payment_model.dart';

import 'client_model.dart';

class OrderModel {
  final String id;
  final int numero;
  final String dataCriacao;
  final String dataAlteracao;
  final String status;
  final num desconto;
  final num frete;
  final num subTotal;
  final num valorTotal;
  final ClientModel cliente;
  final AddressOrderModel enderecoEntrega;
  final List<ItemModel> itens; // !! REMOVE as List<int> in fromMap
  final List<PaymentModel> pagamento; // !! REMOVE as List<int> in fromMap
  OrderModel({
    required this.id,
    required this.numero,
    required this.dataCriacao,
    required this.dataAlteracao,
    required this.status,
    required this.desconto,
    required this.frete,
    required this.subTotal,
    required this.valorTotal,
    required this.cliente,
    required this.enderecoEntrega,
    required this.itens,
    required this.pagamento,
  });

  OrderModel copyWith({
    String? id,
    int? numero,
    String? dataCriacao,
    String? dataAlteracao,
    String? status,
    num? desconto,
    num? frete,
    num? subTotal,
    num? valorTotal,
    ClientModel? cliente,
    AddressOrderModel? enderecoEntrega,
    List<ItemModel>? itens,
    List<PaymentModel>? pagamento,
  }) {
    return OrderModel(
      id: id ?? this.id,
      numero: numero ?? this.numero,
      dataCriacao: dataCriacao ?? this.dataCriacao,
      dataAlteracao: dataAlteracao ?? this.dataAlteracao,
      status: status ?? this.status,
      desconto: desconto ?? this.desconto,
      frete: frete ?? this.frete,
      subTotal: subTotal ?? this.subTotal,
      valorTotal: valorTotal ?? this.valorTotal,
      cliente: cliente ?? this.cliente,
      enderecoEntrega: enderecoEntrega ?? this.enderecoEntrega,
      itens: itens ?? this.itens,
      pagamento: pagamento ?? this.pagamento,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'numero': numero,
      'dataCriacao': dataCriacao,
      'dataAlteracao': dataAlteracao,
      'status': status,
      'desconto': desconto,
      'frete': frete,
      'subTotal': subTotal,
      'valorTotal': valorTotal,
      'cliente': cliente.toMap(),
      'enderecoEntrega': enderecoEntrega.toMap(),
      'itens': itens.map((x) => x.toMap()).toList(),
      'pagamento': pagamento.map((x) => x.toMap()).toList(),
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      id: map['id'] as String,
      numero: map['numero'] as int,
      dataCriacao: map['dataCriacao'] as String,
      dataAlteracao: map['dataAlteracao'] as String,
      status: map['status'] as String,
      desconto: map['desconto'] as num,
      frete: map['frete'] as num,
      subTotal: map['subTotal'] as num,
      valorTotal: map['valorTotal'] as num,
      cliente: ClientModel.fromMap(map['cliente'] as Map<String,dynamic>),
      enderecoEntrega: AddressOrderModel.fromMap(map['enderecoEntrega'] as Map<String,dynamic>),
      itens: List<ItemModel>.from((map['itens'] ).map<ItemModel>((x) => ItemModel.fromMap(x as Map<String,dynamic>),),),
      pagamento: List<PaymentModel>.from((map['pagamento'] ).map<PaymentModel>((x) => PaymentModel.fromMap(x as Map<String,dynamic>),),),
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderModel.fromJson(String source) => OrderModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'OrderModel(id: $id, numero: $numero, dataCriacao: $dataCriacao, dataAlteracao: $dataAlteracao, status: $status, desconto: $desconto, frete: $frete, subTotal: $subTotal, valorTotal: $valorTotal, cliente: $cliente, enderecoEntrega: $enderecoEntrega, itens: $itens, pagamento: $pagamento)';
  }

  @override
  bool operator ==(covariant OrderModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.numero == numero &&
        other.dataCriacao == dataCriacao &&
        other.dataAlteracao == dataAlteracao &&
        other.status == status &&
        other.desconto == desconto &&
        other.frete == frete &&
        other.subTotal == subTotal &&
        other.valorTotal == valorTotal &&
        other.cliente == cliente &&
        other.enderecoEntrega == enderecoEntrega &&
        listEquals(other.itens, itens) &&
        listEquals(other.pagamento, pagamento);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        numero.hashCode ^
        dataCriacao.hashCode ^
        dataAlteracao.hashCode ^
        status.hashCode ^
        desconto.hashCode ^
        frete.hashCode ^
        subTotal.hashCode ^
        valorTotal.hashCode ^
        cliente.hashCode ^
        enderecoEntrega.hashCode ^
        itens.hashCode ^
        pagamento.hashCode;
  }
}
