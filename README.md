# Projeto Lógico de Sistema de E-commerce

Este projeto apresenta um esquema lógico para um sistema de e-commerce. O esquema foi projetado para armazenar informações sobre clientes, produtos, pedidos, pagamentos, entregas, fornecedores e associações entre produtos e fornecedores. O objetivo é criar um sistema de gerenciamento de e-commerce completo, capaz de rastrear clientes, produtos, pedidos e seus relacionamentos.

## Esquema do Banco de Dados

O esquema do banco de dados inclui as seguintes tabelas:

1. **Cliente**: Armazena informações sobre os clientes, como nome, CPF/CNPJ e tipo (PF ou PJ).

2. **Produto**: Registra detalhes dos produtos, incluindo nome, preço e estoque.

3. **Pedido**: Mantém informações sobre os pedidos, como a data em que foram feitos e a associação a um cliente.

4. **Pagamento**: Registra os detalhes do pagamento de cada pedido, incluindo a forma de pagamento.

5. **Entrega**: Rastreia o status das entregas de pedidos e fornece informações de rastreamento.

6. **Fornecedor**: Mantém informações sobre os fornecedores de produtos.

7. **Produto_Fornecedor**: Estabelece associações entre produtos e fornecedores.

8. **Produto_Pedido**: Registra os produtos incluídos em cada pedido, juntamente com a quantidade.

## Consultas Exemplificadas

O projeto inclui consultas SQL de exemplo para ilustrar como extrair informações úteis do banco de dados. As consultas incluem:

1. Quantos pedidos foram feitos por cada cliente?
2. Algum vendedor também é fornecedor?
3. Relação de produtos fornecedores e estoques.
4. Relação de nomes dos fornecedores e nomes dos produtos.
5. Produtos mais caros.
6. Pedidos do cliente PF.
7. Total de vendas por fornecedor.
8. Produtos com estoque baixo.
9. Pedidos entregues.
10. Média de preço dos produtos.

Entre outras consultas.

## Como Usar

Você pode criar o esquema e os dados do banco de dados executando os comandos SQL fornecidos neste projeto. 
