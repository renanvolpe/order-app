import 'package:hive/hive.dart';
import 'package:order_app/modules/order_module/domain/model/order/order_model.dart';

import '../order_module/domain/model/order/address_order_model.dart';
import '../order_module/domain/model/order/client_model.dart';
import '../order_module/domain/model/order/item_model.dart';
import '../order_module/domain/model/order/payment_model.dart';

class OrderAdapter extends TypeAdapter<OrderModel> {
  @override
  int get typeId => 0;

  @override
  OrderModel read(BinaryReader reader) {
    final id = reader.readString();
    final numero = reader.readInt();
    final dataCriacao = reader.readString();
    final dataAlteracao = reader.readString();
    final status = reader.readString();
    final desconto = reader.readDouble();
    final frete = reader.readDouble();
    final subTotal = reader.readDouble();
    final valorTotal = reader.readDouble();

    final clientRef = reader.read();
    final client = clientRef is ClientModel ? clientRef : null;

    final addressRef = reader.read();
    final address = addressRef is AddressOrderModel ? addressRef : null;

    final int itemCount = reader.readInt();
    final itens = List<ItemModel>.generate(itemCount, (i) => reader.read());

    final int paymentCount = reader.readInt();
    final pagamentos = List<PaymentModel>.generate(paymentCount, (i) => reader.read());

    return OrderModel(
      id: id,
      numero: numero,
      dataCriacao: dataCriacao,
      dataAlteracao: dataAlteracao,
      status: status,
      desconto: desconto,
      frete: frete,
      subTotal: subTotal,
      valorTotal: valorTotal,
      cliente: client!,
      enderecoEntrega: address!,
      itens: itens,
      pagamento: pagamentos,
    );
  }

  @override
  void write(BinaryWriter writer, OrderModel obj) {
    writer.writeString(obj.id);
    writer.writeInt(obj.numero);
    writer.writeString(obj.dataCriacao);
    writer.writeString(obj.dataAlteracao);
    writer.writeString(obj.status);
    writer.writeDouble(obj.desconto.toDouble());
    writer.writeDouble(obj.frete.toDouble());
    writer.writeDouble(obj.subTotal.toDouble());
    writer.writeDouble(obj.valorTotal.toDouble());

    writer.write(obj.cliente);
    writer.write(obj.enderecoEntrega);

    writer.writeInt(obj.itens.length);
    for (final item in obj.itens) {
      writer.write(item);
    }

    writer.writeInt(obj.pagamento.length);
    for (final payment in obj.pagamento) {
      writer.write(payment);
    }
  }
}

class ClienteModelAdapter extends TypeAdapter<ClientModel> {
  @override
  int get typeId => 3;

  @override
  ClientModel read(BinaryReader reader) {
    final id = reader.readString();
    final cnpj = reader.readString();
    final cpf = reader.readString();
    final nome = reader.readString();
    final razaoSocial = reader.readString();
    final email = reader.readString();
    final dataNascimento = reader.readString(); // Assuming dataNascimento is stored as a string

    return ClientModel(
      id: id,
      cnpj: cnpj,
      cpf: cpf,
      nome: nome,
      razaoSocial: razaoSocial,
      email: email,
      dataNascimento: dataNascimento,
    );
  }

  @override
  void write(BinaryWriter writer, ClientModel obj) {
    writer.writeString(obj.id);
    writer.writeString(obj.cnpj);
    writer.writeString(obj.cpf);
    writer.writeString(obj.nome);
    writer.writeString(obj.razaoSocial);
    writer.writeString(obj.email);
    writer.writeString(obj.dataNascimento); // Assuming dataNascimento is stored as a string
  }
}

class ItemModelAdapter extends TypeAdapter<ItemModel> {
  @override
  int get typeId => 2;

  @override
  ItemModel read(BinaryReader reader) {
    final id = reader.readString();
    final idProduto = reader.readString();
    final nome = reader.readString();
    final quantidade = reader.readInt();
    final valorUnitario = reader.readDouble();

    return ItemModel(
      id: id,
      idProduto: idProduto,
      nome: nome,
      quantidade: quantidade,
      valorUnitario: valorUnitario,
    );
  }

  @override
  void write(BinaryWriter writer, ItemModel obj) {
    writer.writeString(obj.id);
    writer.writeString(obj.idProduto);
    writer.writeString(obj.nome);
    writer.writeInt(obj.quantidade);
    writer.writeDouble(obj.valorUnitario.toDouble());
  }
}

class PaymentAdapter extends TypeAdapter<PaymentModel> {
  @override
  PaymentModel read(BinaryReader reader) {
    final id = reader.readString();
    final parcela = reader.readInt();
    final valor = reader.readDouble();
    final codigo = reader.readString();
    final nome = reader.readString();

    return PaymentModel(
      id: id,
      parcela: parcela,
      valor: valor,
      codigo: codigo,
      nome: nome,
    );
  }

  @override
  void write(BinaryWriter writer, PaymentModel obj) {
    writer.writeString(obj.id);
    writer.writeInt(obj.parcela);
    writer.writeDouble(obj.valor.toDouble());
    writer.writeString(obj.codigo);
    writer.writeString(obj.nome);
  }

  @override
  int get typeId => 1;
}

class AddressOrderModelAdapter extends TypeAdapter<AddressOrderModel> {
  @override
  int get typeId => 4;
  
  @override
  AddressOrderModel read(BinaryReader reader) {
    final id = reader.readString();
    final endereco = reader.readString();
    final numero = reader.readString();
    final cep = reader.readString();
    final bairro = reader.readString();
    final cidade = reader.readString();
    final estado = reader.readString();
    final complemento = reader.readString();
    final referencia = reader.readString();

    return AddressOrderModel(
      id: id,
      endereco: endereco,
      numero: numero,
      cep: cep,
      bairro: bairro,
      cidade: cidade,
      estado: estado,
      complemento: complemento,
      referencia: referencia,
    );
  }

  @override
  void write(BinaryWriter writer, AddressOrderModel obj) {
    writer.writeString(obj.id);
    writer.writeString(obj.endereco);
    writer.writeString(obj.numero);
    writer.writeString(obj.cep);
    writer.writeString(obj.bairro);
    writer.writeString(obj.cidade);
    writer.writeString(obj.estado);
    writer.writeString(obj.complemento);
    writer.writeString(obj.referencia);
  }
}
