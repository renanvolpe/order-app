# order_app

# Desafio: Lista de Pedidos

- O projeto consiste em uma aplicação que deverá consumir a API que retornará uma Lista de Pedidos.
A consulta da API retornará os seguintes dados: cliente, endereço de entrega, itens e parcelas de pagamento.
Os dados DEVERÃO ser armazenados em banco de dados uƟlizando HIVE para persistência de dados, para
posteriormente serem manipulados nas telas.
URL da API hƩps://desafiotecnicosƟ3.azurewebsites.net/pedido

# Tela Inicial
- A tela inicial deverá conter o menu lateral com as opções: Pedidos e Relatórios

# Tela de Pedidos
- Na tela de pedidos deverá ter um botão Consultar que ao clicar deverá consumir o webservice para trazer uma Lista
de Pedidos que serão os dados que deverão ser armazenados no banco de dados(check)

- Deverá ter um campo Pesquisa, que irá buscar no banco de dados pelo Nome do Cliente
 e uma tabela abaixo com as seguintes colunas: Número, Data, Clientes, Status, Valor Total.(check)

- Cada item da lista corresponde a um Pedido de um Cliente, com 1 ou vários produtos e 1 ou várias parcelas.(check)
- Ao clicar 1x no item da lista, exibir na coluna lateral todos os dados do Pedido correspondente.
- Ao clicar 2x ou num botão Detalhes, abrir uma nova tela (modal) para exibir os dados dos produtos e parcelas
correspondentes ao Pedido selecionado. (check)



# Tela Relatórios (Desafio Extra)
Nesta tela deverá conter um combo box para selecionar as seguintes opções e apresentar os seguintes dados numa
tabela abaixo:
• Listagem de Produtos mais vendidos
    o Produto, QuanƟdade e Valor Médio(check)

• Totalização de Formas de Pagamento por Dia
    o Data do Pedido, Forma de Pagamento e Valor(check)

• Totalização de Vendas por Cidade
    o Cidade, QuanƟdade dos Pedidos e Valor Total(check)

• Totalização de Vendas por Faixa Etária
    o Faixa Etária, QuanƟdade de Pedidos e Valor Total(check)

# Comenários sobre a produção do código
- Utilizei o banco de dados local -> Hive
- Gerenciamento de estados -> BLoC
- Injeção de dependencia -> Flutter Modular
- Navegação -> Flutter Modular
- Estrutua de projeto: Clean Arch UI <-> BLoC <-> UseCase <-> Repository <-> DataSource
- Utilizei o Cubit para a parte de relatórios e suas funcionaliades
- Não foquei tanto em tratamento de erro e Layout UI visto que nao era critério de avaliação mas tenho exemplos em meu github desses usos

# Libs importantes
- dio para requisições http
- dartz para tratamento de erros(nao muito explorado)
- logger visualização melhorada do terminal
- intl uso e tratamento de datas
- bloc_test teste para verificação de lógica correta
  