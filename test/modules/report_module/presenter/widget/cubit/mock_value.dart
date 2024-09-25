
import 'package:order_app/modules/order_module/domain/model/order/order_model.dart';

List<OrderModel> getAllOrdersModel() {
  List<OrderModel> listOrderModel = [];
  for (var e in listOrderModelMock) {
    listOrderModel.add(OrderModel.fromMap(e));
  }

  return listOrderModel;
}


var listOrderModelMock = [
  {
    "id": "9477b7a9-83c2-400b-8a6b-6be6bb541bf0",
    "numero": 1,
    "dataCriacao": "2024-08-06T16:49:56.3470055+00:00",
    "dataAlteracao": "2024-09-25T16:49:56.3470067+00:00",
    "status": "APROVADO",
    "desconto": 10,
    "frete": 25,
    "subTotal": 270.7,
    "valorTotal": 305.7,
    "cliente": {
      "id": "11b02b6d-39be-4d46-a46b-ac97a33fe989",
      "cnpj": "",
      "cpf": "68471698005",
      "nome": "Barry Allen",
      "razaoSocial": "",
      "email": "theflash@teamflash.com",
      "dataNascimento": "1999-09-25T16:49:56.3470076+00:00"
    },
    "enderecoEntrega": {
      "id": "dea46c91-a124-4286-b3e3-e2f2c145f4c6",
      "endereco": "Star Labs",
      "numero": "100",
      "cep": "00000000",
      "bairro": "Midtown",
      "cidade": "Central City",
      "estado": "KS",
      "complemento": "",
      "referencia": ""
    },
    "itens": [
      {
        "id": "3ed07192-6815-4b77-b3dc-b7bdb5f24b47",
        "idProduto": "c8bddecb-f3b2-4b4c-b655-ae1c1d732762",
        "nome": "Tênis Stark Runner",
        "quantidade": 1,
        "valorUnitario": 120.50
      },
      {
        "id": "57ee2448-26d2-4172-a23d-95835b8c724e",
        "idProduto": "23280712-21e6-426a-a7fc-ee95be9b7b69",
        "nome": "Tênis Luthor Confort",
        "quantidade": 1,
        "valorUnitario": 150.20
      }
    ],
    "pagamento": [
      {
        "id": "7241f1b9-5e1f-4e55-a043-82daa2f7c4cc",
        "parcela": 1,
        "valor": 152.85,
        "codigo": "pagseguro",
        "nome": "PagSeguro"
      },
      {
        "id": "a3255ce6-71da-44a9-b2a7-5a1fe2a32a43",
        "parcela": 2,
        "valor": 152.85,
        "codigo": "pagseguro",
        "nome": "PagSeguro"
      }
    ]
  },
  {
    "id": "612df19e-a1dc-4471-ac9f-d4de79c7df3b",
    "numero": 2,
    "dataCriacao": "2024-08-08T16:49:56.3470306+00:00",
    "dataAlteracao": "2024-09-25T16:49:56.347031+00:00",
    "status": "APROVADO",
    "desconto": 0,
    "frete": 0,
    "subTotal": 659.5,
    "valorTotal": 659.5,
    "cliente": {
      "id": "b48ffd3e-2217-4ad6-b541-7b5041857870",
      "cnpj": "",
      "cpf": "32192133839",
      "nome": "Kara Danvers",
      "razaoSocial": "",
      "email": "supergirl@kripton.com",
      "dataNascimento": "2002-09-25T16:49:56.3470317+00:00"
    },
    "enderecoEntrega": {
      "id": "3af22847-d11d-47d4-afa4-bb25e31222f0",
      "endereco": "Supergirl Street",
      "numero": "s/n",
      "cep": "00000000",
      "bairro": "",
      "cidade": "Argo City",
      "estado": "KT",
      "complemento": "",
      "referencia": ""
    },
    "itens": [
      {
        "id": "a7a84baa-6493-4be7-9ecd-6b256f0fd5be",
        "idProduto": "c8bddecb-f3b2-4b4c-b655-ae1c1d732762",
        "nome": "Tênis Stark Runner",
        "quantidade": 1,
        "valorUnitario": 120.50
      },
      {
        "id": "25413144-7701-4717-9438-1c741a60e5a9",
        "idProduto": "59f93be7-27b1-4ad6-bcc8-328dd65f5777",
        "nome": "Boné Acme Co.",
        "quantidade": 1,
        "valorUnitario": 99.00
      },
      {
        "id": "c02c8bbb-da80-467f-ad8a-63b4de262512",
        "idProduto": "88259961-8ca0-4399-af7f-b3b8fed4a80b",
        "nome": "Jaqueta Oscorp Industries",
        "quantidade": 2,
        "valorUnitario": 220
      }
    ],
    "pagamento": [
      {
        "id": "0fd7ac19-cd24-4341-8b99-545a647a3720",
        "parcela": 1,
        "valor": 219.84,
        "codigo": "boleto",
        "nome": "Boleto"
      },
      {
        "id": "40403475-57c5-4618-94f3-2be7b24c1b0a",
        "parcela": 2,
        "valor": 219.83,
        "codigo": "boleto",
        "nome": "Boleto"
      },
      {
        "id": "b0a3e14b-dada-4169-b659-bacdbc575189",
        "parcela": 3,
        "valor": 219.83,
        "codigo": "boleto",
        "nome": "Boleto"
      }
    ]
  },
  {
    "id": "66718449-1f55-4e6f-b423-2a5f0f64f322",
    "numero": 3,
    "dataCriacao": "2024-08-09T16:49:56.3470353+00:00",
    "dataAlteracao": "2024-09-25T16:49:56.3470356+00:00",
    "status": "APROVADO",
    "desconto": 0,
    "frete": 15,
    "subTotal": 290,
    "valorTotal": 305,
    "cliente": {
      "id": "63ed92d9-9989-4cd2-8050-52a7ef912900",
      "cnpj": "",
      "cpf": "39132455887",
      "nome": "Oliver Queen",
      "razaoSocial": "",
      "email": "arrow@arrowverse.com",
      "dataNascimento": "1991-09-25T16:49:56.3470361+00:00"
    },
    "enderecoEntrega": {
      "id": "d2189267-fef5-41bb-8003-9c654d334f64",
      "endereco": "Queen Corporation",
      "numero": "10",
      "cep": "00000000",
      "bairro": "Long Beach",
      "cidade": "Star City",
      "estado": "CA",
      "complemento": "",
      "referencia": ""
    },
    "itens": [
      {
        "id": "d724fc57-9f56-4577-aa14-0ba4196e3d20",
        "idProduto": "1651961c-59e0-4294-ab67-7702710267fa",
        "nome": "Agasalho Queen Industries c/ capuz",
        "quantidade": 1,
        "valorUnitario": 290
      }
    ],
    "pagamento": [
      {
        "id": "58a1586f-de84-4648-a71e-6207fe1116ae",
        "parcela": 1,
        "valor": 305,
        "codigo": "transf",
        "nome": "Transferência"
      }
    ]
  },
  {
    "id": "4bfb2b44-117e-47ac-9627-fa94d3e714cc",
    "numero": 4,
    "dataCriacao": "2024-08-16T16:49:56.3470381+00:00",
    "dataAlteracao": "2024-09-25T16:49:56.3470385+00:00",
    "status": "APROVADO",
    "desconto": 0,
    "frete": 0,
    "subTotal": 1146,
    "valorTotal": 1146,
    "cliente": {
      "id": "b48ffd3e-2217-4ad6-b541-7b5041857870",
      "cnpj": "",
      "cpf": "32192133839",
      "nome": "Kara Danvers",
      "razaoSocial": "",
      "email": "supergirl@kripton.com",
      "dataNascimento": "2002-09-25T16:49:56.347039+00:00"
    },
    "enderecoEntrega": {
      "id": "3af22847-d11d-47d4-afa4-bb25e31222f0",
      "endereco": "Supergirl Street",
      "numero": "s/n",
      "cep": "00000000",
      "bairro": "",
      "cidade": "Argo City",
      "estado": "KT",
      "complemento": "",
      "referencia": ""
    },
    "itens": [
      {
        "id": "7c3a709b-43f7-489c-97b8-405a27e75548",
        "idProduto": "c8bddecb-f3b2-4b4c-b655-ae1c1d732762",
        "nome": "Tênis Stark Runner",
        "quantidade": 2,
        "valorUnitario": 120.50
      },
      {
        "id": "b1f8148e-f8bc-4af4-aece-6f5b880b661c",
        "idProduto": "68f03782-78c5-4f53-8863-13adde2d3156",
        "nome": "Camiseta Wayne Industries",
        "quantidade": 1,
        "valorUnitario": 230
      },
      {
        "id": "c4942317-60ab-4488-b057-c00bea52c4cb",
        "idProduto": "3626bbf3-7f05-4e9b-9019-ed3193125be2",
        "nome": "Camiseta Star Labs Preta",
        "quantidade": 2,
        "valorUnitario": 190
      },
      {
        "id": "bff807f6-5afa-4903-8773-937333d9b204",
        "idProduto": "995fc463-a179-4b07-ba45-2c4d284c6b24",
        "nome": "Agasalho S.H.I.E.L.D.",
        "quantidade": 1,
        "valorUnitario": 295
      }
    ],
    "pagamento": [
      {
        "id": "29bc08c5-4015-4ceb-b226-0585cefc8336",
        "parcela": 1,
        "valor": 286.5,
        "codigo": "boleto",
        "nome": "Boleto"
      },
      {
        "id": "b85724d5-42cd-4a0f-8a58-07dec7da8046",
        "parcela": 2,
        "valor": 286.5,
        "codigo": "boleto",
        "nome": "Boleto"
      },
      {
        "id": "777ae237-06b8-4b5e-9346-777fe3a6d9a9",
        "parcela": 3,
        "valor": 286.5,
        "codigo": "boleto",
        "nome": "Boleto"
      },
      {"id": "f3c720b9-8ed8-43b9-92d3-db152cea0b55", "parcela": 4, "valor": 286.5, "codigo": "boleto", "nome": "Boleto"}
    ]
  },
  {
    "id": "7bff3abb-6377-4924-b1ce-51a22c14f1f7",
    "numero": 5,
    "dataCriacao": "2024-08-28T16:49:56.3470427+00:00",
    "dataAlteracao": "2024-09-25T16:49:56.347043+00:00",
    "status": "CANCELADO",
    "desconto": 0,
    "frete": 20,
    "subTotal": 584.9,
    "valorTotal": 604.9,
    "cliente": {
      "id": "57465ed9-a895-4081-a37d-fc00e72a4710",
      "cnpj": "",
      "cpf": "36429844870",
      "nome": "Harrison Wells",
      "razaoSocial": "",
      "email": "hr@reverseflash.com",
      "dataNascimento": "1970-09-25T16:49:56.3470435+00:00"
    },
    "enderecoEntrega": {
      "id": "dea46c91-a124-4286-b3e3-e2f2c145f4c6",
      "endereco": "Star Labs",
      "numero": "100",
      "cep": "00000000",
      "bairro": "Midtown",
      "cidade": "Central City",
      "estado": "KS",
      "complemento": "",
      "referencia": ""
    },
    "itens": [
      {
        "id": "95c4a071-801d-456e-9b20-c2fa72ea9943",
        "idProduto": "995fc463-a179-4b07-ba45-2c4d284c6b24",
        "nome": "Agasalho S.H.I.E.L.D.",
        "quantidade": 1,
        "valorUnitario": 295
      },
      {
        "id": "e29d8afe-e029-411e-8c7a-8637e8a21d9e",
        "idProduto": "8d9d9311-edfa-4c9b-9f4e-40a8a810d703",
        "nome": "Boné Luthor Corp. Aba Reta",
        "quantidade": 1,
        "valorUnitario": 99.90
      },
      {
        "id": "53774ccc-2dfc-48ea-91cf-026c45a6f20c",
        "idProduto": "3626bbf3-7f05-4e9b-9019-ed3193125be2",
        "nome": "Camiseta Star Labs Preta",
        "quantidade": 1,
        "valorUnitario": 190
      }
    ],
    "pagamento": [
      {
        "id": "2f4c2126-1d66-4fc1-b03d-c397dd218e6a",
        "parcela": 1,
        "valor": 302.45,
        "codigo": "boleto",
        "nome": "Boleto"
      },
      {
        "id": "6bf13ad4-90a5-4ae0-a83f-9d1124905b08",
        "parcela": 2,
        "valor": 302.45,
        "codigo": "boleto",
        "nome": "Boleto"
      }
    ]
  },
  {
    "id": "10ca1e5c-dea5-4f1d-abae-61712ccc596b",
    "numero": 6,
    "dataCriacao": "2024-08-28T16:49:56.3470465+00:00",
    "dataAlteracao": "2024-09-25T16:49:56.3470468+00:00",
    "status": "APROVADO",
    "desconto": 50,
    "frete": 20,
    "subTotal": 584.9,
    "valorTotal": 554.9,
    "cliente": {
      "id": "57465ed9-a895-4081-a37d-fc00e72a4710",
      "cnpj": "",
      "cpf": "36429844870",
      "nome": "Harrison Wells",
      "razaoSocial": "",
      "email": "hr@reverseflash.com",
      "dataNascimento": "1970-09-25T16:49:56.3470473+00:00"
    },
    "enderecoEntrega": {
      "id": "f2511b93-eb02-46a6-9f57-ee0d21bea899",
      "endereco": "Reverse Flash Street",
      "numero": "50",
      "cep": "00000000",
      "bairro": "Queens",
      "cidade": "Central City",
      "estado": "KS",
      "complemento": "",
      "referencia": ""
    },
    "itens": [
      {
        "id": "a7ae0176-17bf-4cf9-9012-3c1d332b7567",
        "idProduto": "995fc463-a179-4b07-ba45-2c4d284c6b24",
        "nome": "Agasalho S.H.I.E.L.D.",
        "quantidade": 1,
        "valorUnitario": 295
      },
      {
        "id": "e6dc6b27-caab-4c0d-a510-e0bfb702f385",
        "idProduto": "8d9d9311-edfa-4c9b-9f4e-40a8a810d703",
        "nome": "Boné Luthor Corp. Aba Reta",
        "quantidade": 1,
        "valorUnitario": 99.90
      },
      {
        "id": "e727d426-e25f-410a-b6a2-44302bfbeaf4",
        "idProduto": "3626bbf3-7f05-4e9b-9019-ed3193125be2",
        "nome": "Camiseta Star Labs Preta",
        "quantidade": 1,
        "valorUnitario": 190
      }
    ],
    "pagamento": [
      {
        "id": "e609fe31-aa14-4d8c-b752-0ea967d6ef20",
        "parcela": 1,
        "valor": 277.45,
        "codigo": "pagseguro",
        "nome": "PagSeguro"
      },
      {
        "id": "a288d2f0-3d06-4824-9926-d7c3d55b27b9",
        "parcela": 2,
        "valor": 277.45,
        "codigo": "pagseguro",
        "nome": "PagSeguro"
      }
    ]
  },
  {
    "id": "6c80a7cb-b1db-4248-986f-754fd324e2ee",
    "numero": 7,
    "dataCriacao": "2024-09-10T16:49:56.3470504+00:00",
    "dataAlteracao": "2024-09-25T16:49:56.3470507+00:00",
    "status": "APROVADO",
    "desconto": 10.9,
    "frete": 0,
    "subTotal": 910.9,
    "valorTotal": 900,
    "cliente": {
      "id": "b9ce5caf-4aa8-4b09-8bc7-3bd92b195aab",
      "cnpj": "",
      "cpf": "36429844870",
      "nome": "Iris West",
      "razaoSocial": "",
      "email": "iris@teamflash.com",
      "dataNascimento": "2005-09-25T16:49:56.3470513+00:00"
    },
    "enderecoEntrega": {
      "id": "dea46c91-a124-4286-b3e3-e2f2c145f4c6",
      "endereco": "Star Labs",
      "numero": "100",
      "cep": "00000000",
      "bairro": "Midtown",
      "cidade": "Central City",
      "estado": "KS",
      "complemento": "",
      "referencia": ""
    },
    "itens": [
      {
        "id": "419773e6-49e2-4f6b-828c-997a101cacb7",
        "idProduto": "3626bbf3-7f05-4e9b-9019-ed3193125be2",
        "nome": "Camiseta Star Labs Preta",
        "quantidade": 3,
        "valorUnitario": 190
      },
      {
        "id": "d9fd1f2d-c1f5-4e1d-9a4c-59a21c3082a8",
        "idProduto": "8d9d9311-edfa-4c9b-9f4e-40a8a810d703",
        "nome": "Boné Luthor Corp. Aba Reta",
        "quantidade": 1,
        "valorUnitario": 99.90
      },
      {
        "id": "c559a575-8735-445b-b263-5a4061fd8fad",
        "idProduto": "c8bddecb-f3b2-4b4c-b655-ae1c1d732762",
        "nome": "Tênis Stark Runner",
        "quantidade": 2,
        "valorUnitario": 120.50
      }
    ],
    "pagamento": [
      {"id": "09423464-0ae5-4b7d-b621-989e70196225", "parcela": 1, "valor": 300, "codigo": "boleto", "nome": "Boleto"},
      {"id": "6e731b59-f784-4de2-90c0-fa9b01c3ef69", "parcela": 2, "valor": 300, "codigo": "boleto", "nome": "Boleto"},
      {"id": "15845e14-a3db-4a6e-a147-991cb6d95ae1", "parcela": 3, "valor": 300, "codigo": "boleto", "nome": "Boleto"}
    ]
  },
  {
    "id": "7966ca29-2b57-4e43-a4d7-04f0c6aae15e",
    "numero": 8,
    "dataCriacao": "2024-09-10T16:49:56.3470544+00:00",
    "dataAlteracao": "2024-09-25T16:49:56.3470548+00:00",
    "status": "APROVADO",
    "desconto": 0,
    "frete": 12.5,
    "subTotal": 800.4,
    "valorTotal": 812.9,
    "cliente": {
      "id": "d86ef58f-1aa5-4df8-8690-99b6596d11d5",
      "cnpj": "",
      "cpf": "05376834883",
      "nome": "Ray Palmer",
      "razaoSocial": "",
      "email": "r.palmer@palmertech.com",
      "dataNascimento": "1982-09-25T16:49:56.347056+00:00"
    },
    "enderecoEntrega": {
      "id": "2e094e7d-4da3-4278-ad3b-1a4a038e8c52",
      "endereco": "Palmer Technology",
      "numero": "50",
      "cep": "00000000",
      "bairro": "Long Beach",
      "cidade": "Star City",
      "estado": "CA",
      "complemento": "",
      "referencia": ""
    },
    "itens": [
      {
        "id": "b8a18c46-a3db-4680-8232-313e12b972b5",
        "idProduto": "23280712-21e6-426a-a7fc-ee95be9b7b69",
        "nome": "Tênis Luthor Confort",
        "quantidade": 2,
        "valorUnitario": 150.20
      },
      {
        "id": "3149b61c-9196-4f93-bc72-bba01384fda3",
        "idProduto": "a33482f6-dcec-4685-9648-a3294cd8bf53",
        "nome": "Jaqueta Umbrella Corp.",
        "quantidade": 2,
        "valorUnitario": 250
      }
    ],
    "pagamento": [
      {
        "id": "271f0828-0646-4cd6-8c12-037c567e67ad",
        "parcela": 1,
        "valor": 812.9,
        "codigo": "transf",
        "nome": "Transferência"
      }
    ]
  },
  {
    "id": "048ee410-3178-4c8a-8ed0-4aef622f5372",
    "numero": 9,
    "dataCriacao": "2024-09-10T16:49:56.3470585+00:00",
    "dataAlteracao": "2024-09-25T16:49:56.3470588+00:00",
    "status": "APROVADO",
    "desconto": 0,
    "frete": 0,
    "subTotal": 718.4,
    "valorTotal": 718.4,
    "cliente": {
      "id": "b48ffd3e-2217-4ad6-b541-7b5041857870",
      "cnpj": "",
      "cpf": "32192133839",
      "nome": "Kara Danvers",
      "razaoSocial": "",
      "email": "supergirl@kripton.com",
      "dataNascimento": "2002-09-25T16:49:56.3470593+00:00"
    },
    "enderecoEntrega": {
      "id": "3af22847-d11d-47d4-afa4-bb25e31222f0",
      "endereco": "Supergirl Street",
      "numero": "s/n",
      "cep": "00000000",
      "bairro": "",
      "cidade": "Argo City",
      "estado": "KT",
      "complemento": "",
      "referencia": ""
    },
    "itens": [
      {
        "id": "a9a550e7-4620-487f-ac05-ef8d74a64727",
        "idProduto": "88259961-8ca0-4399-af7f-b3b8fed4a80b",
        "nome": "Jaqueta Oscorp Industries",
        "quantidade": 1,
        "valorUnitario": 220
      },
      {
        "id": "9c7f3848-b983-4eb9-826a-1c50feccc34c",
        "idProduto": "59f93be7-27b1-4ad6-bcc8-328dd65f5777",
        "nome": "Boné Acme Co.",
        "quantidade": 2,
        "valorUnitario": 99.00
      },
      {
        "id": "d9838850-0695-42ea-9e8d-0471008ea293",
        "idProduto": "23280712-21e6-426a-a7fc-ee95be9b7b69",
        "nome": "Tênis Luthor Confort",
        "quantidade": 2,
        "valorUnitario": 150.20
      }
    ],
    "pagamento": [
      {
        "id": "1c3d0f7c-09e3-411f-80e7-684df945f045",
        "parcela": 1,
        "valor": 359.2,
        "codigo": "boleto",
        "nome": "Boleto"
      },
      {"id": "bfbe78a4-3ae8-4185-b0b7-4d4efda9ef25", "parcela": 2, "valor": 359.2, "codigo": "boleto", "nome": "Boleto"}
    ]
  },
  {
    "id": "d093e949-5f03-4333-a92f-9185a41c8a3c",
    "numero": 10,
    "dataCriacao": "2024-09-15T16:49:56.3470623+00:00",
    "dataAlteracao": "2024-09-25T16:49:56.3470626+00:00",
    "status": "APROVADO",
    "desconto": 40,
    "frete": 15,
    "subTotal": 580,
    "valorTotal": 555,
    "cliente": {
      "id": "11b02b6d-39be-4d46-a46b-ac97a33fe989",
      "cnpj": "",
      "cpf": "68471698005",
      "nome": "Barry Allen",
      "razaoSocial": "",
      "email": "theflash@teamflash.com",
      "dataNascimento": "1999-09-25T16:49:56.347063+00:00"
    },
    "enderecoEntrega": {
      "id": "dea46c91-a124-4286-b3e3-e2f2c145f4c6",
      "endereco": "Star Labs",
      "numero": "100",
      "cep": "00000000",
      "bairro": "Midtown",
      "cidade": "Central City",
      "estado": "KS",
      "complemento": "",
      "referencia": ""
    },
    "itens": [
      {
        "id": "b115facd-559d-450f-9c8d-9d6daf8d7b9d",
        "idProduto": "1651961c-59e0-4294-ab67-7702710267fa",
        "nome": "Agasalho Queen Industries c/ capuz",
        "quantidade": 2,
        "valorUnitario": 290
      }
    ],
    "pagamento": [
      {
        "id": "c30a3e29-65dc-40b2-afb9-bd659b354a17",
        "parcela": 1,
        "valor": 555,
        "codigo": "pagseguro",
        "nome": "PagSeguro"
      }
    ]
  }
];
