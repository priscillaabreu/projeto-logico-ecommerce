CREATE DATABASE ecommerce;
use ecommerce;

-- Criação das tabelas
CREATE TABLE Cliente (
    ID INT PRIMARY KEY,
    Nome VARCHAR(100),
    CPFCNPJ VARCHAR(20),
    Tipo VARCHAR(2)
);

CREATE TABLE Produto (
    ID INT PRIMARY KEY,
    Nome VARCHAR(100),
    Preco DECIMAL(10, 2),
    Estoque INT
);

CREATE TABLE Pedido (
    ID INT PRIMARY KEY,
    Data DATE,
    ClienteID INT,
    FOREIGN KEY (ClienteID) REFERENCES Cliente(ID)
);

CREATE TABLE Pagamento (
    ID INT PRIMARY KEY,
    PedidoID INT,
    FormaPagamento VARCHAR(50),
    FOREIGN KEY (PedidoID) REFERENCES Pedido(ID)
);

CREATE TABLE Entrega (
    ID INT PRIMARY KEY,
    PedidoID INT,
    Status VARCHAR(50),
    CodigoRastreio VARCHAR(50),
    FOREIGN KEY (PedidoID) REFERENCES Pedido(ID)
);

CREATE TABLE Fornecedor (
    ID INT PRIMARY KEY,
    Nome VARCHAR(100)
);

CREATE TABLE Produto_Fornecedor (
    ProdutoID INT,
    FornecedorID INT,
    PRIMARY KEY (ProdutoID, FornecedorID),
    FOREIGN KEY (ProdutoID) REFERENCES Produto(ID),
    FOREIGN KEY (FornecedorID) REFERENCES Fornecedor(ID)
);

-- Criação da tabela Produto_Pedido
CREATE TABLE Produto_Pedido (
    ID INT PRIMARY KEY,
    ProdutoID INT,
    PedidoID INT,
    Quantidade INT,
    FOREIGN KEY (ProdutoID) REFERENCES Produto(ID),
    FOREIGN KEY (PedidoID) REFERENCES Pedido(ID)
);


-- Inserção de dados fictícios
INSERT INTO Cliente (ID, Nome, CPFCNPJ, Tipo) VALUES
(1, 'Cliente PF', '123.456.789-01', 'PF'),
(2, 'Cliente PJ', '12.345.678/0001-23', 'PJ');

INSERT INTO Produto (ID, Nome, Preco, Estoque) VALUES
(1, 'Produto 1', 100.00, 50),
(2, 'Produto 2', 200.00, 30);

INSERT INTO Pedido (ID, Data, ClienteID) VALUES
(1, '2023-08-29', 1),
(2, '2023-08-30', 2);

-- Inserção de dados nas tabelas Produto e Fornecedor
INSERT INTO Produto (ID, Nome, Preco, Estoque) VALUES
(3, 'Produto 3', 150.00, 20),
(4, 'Produto 4', 75.50, 40),
(5, 'Produto 5', 220.00, 15),
(6, 'Produto 6', 300.00, 25),
(7, 'Produto 7', 50.00, 60),
(8, 'Produto 8', 180.00, 30),
(9, 'Produto 9', 90.00, 10),
(10, 'Produto 10', 120.00, 5),
(11, 'Produto 11', 200.00, 12),
(12, 'Produto 12', 80.00, 18);

-- Inserção de dados na tabela Fornecedor
INSERT INTO Fornecedor (ID, Nome) VALUES
(3, 'Fornecedor A'),
(4, 'Fornecedor B'),
(5, 'Fornecedor C'),
(6, 'Fornecedor D'),
(7, 'Fornecedor E'),
(8, 'Fornecedor F'),
(9, 'Fornecedor G'),
(10, 'Fornecedor H'),
(11, 'Fornecedor I'),
(12, 'Fornecedor J');

-- Inserção de dados na tabela Produto_Fornecedor
INSERT INTO Produto_Fornecedor (ProdutoID, FornecedorID) VALUES
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12);

-- Inserção de produtos mais caros
INSERT INTO Produto (ID, Nome, Preco, Estoque) VALUES
(13, 'Produto 13', 500.00, 10),
(14, 'Produto 14', 450.00, 8),
(15, 'Produto 15', 600.00, 5),
(16, 'Produto 16', 700.00, 3);

-- Inserção de pedidos de clientes Pessoa Física
INSERT INTO Pedido (ID, Data, ClienteID) VALUES
(3, '2023-08-31', 1),
(4, '2023-09-01', 1),
(5, '2023-09-02', 1);


-- Inserção de vendas para calcular o total por fornecedor
-- Vendas do Produto 3 para Fornecedor 3
INSERT INTO Produto_Fornecedor (ProdutoID, FornecedorID) VALUES
(13, 3);

-- Vendas do Produto 4 para Fornecedor 4
INSERT INTO Produto_Fornecedor (ProdutoID, FornecedorID) VALUES
(14, 4);

-- Vendas do Produto 5 para Fornecedor 5
INSERT INTO Produto_Fornecedor (ProdutoID, FornecedorID) VALUES
(15, 5);

-- Vendas do Produto 6 para Fornecedor 6
INSERT INTO Produto_Fornecedor (ProdutoID, FornecedorID) VALUES
(16, 6);

-- Inserção de produtos com estoque baixo
INSERT INTO Produto (ID, Nome, Preco, Estoque) VALUES
(17, 'Produto 17', 80.00, 5),
(18, 'Produto 18', 120.00, 3);

-- Inserção de pedidos com status de entrega 'Entregue'
INSERT INTO Entrega (ID, PedidoID, Status, CodigoRastreio) VALUES
(3, 3, 'Entregue', 'XYZ123'),
(4, 4, 'Entregue', 'ABC456'),
(5, 5, 'Entregue', 'DEF789');


-- Inserção de cliente sem pedidos
INSERT INTO Cliente (ID, Nome, CPFCNPJ, Tipo) VALUES
(3, 'Victor Oliveira', '111.222.333-44', 'PF');

-- Inserção de produtos vendidos em pedidos
-- Produto 1 no Pedido 1
INSERT INTO Pedido (ID, Data, ClienteID) VALUES
(6, '2023-09-03', 1);

INSERT INTO Produto (ID, Nome, Preco, Estoque) VALUES
(19, 'Produto 19', 50.00, 10);

INSERT INTO Produto_Fornecedor (ProdutoID, FornecedorID) VALUES
(19, 7);

INSERT INTO Produto_Pedido (ID,ProdutoID, PedidoID, Quantidade) VALUES
(1,1, 6, 2),
(2,19, 6, 5);

-- Inserção de produtos para calcular a média de preços
-- Produto 20
INSERT INTO Produto (ID, Nome, Preco, Estoque) VALUES
(20, 'Produto 20', 75.00, 15);

-- Inserção de pedidos pagos em dinheiro
INSERT INTO Pagamento (ID, PedidoID, FormaPagamento) VALUES
(6, 6, 'Dinheiro'),
(7, 4, 'Dinheiro');


INSERT INTO Produto_Pedido (ID, ProdutoID, PedidoID, Quantidade) VALUES
(3, 1, 1, 2);

INSERT INTO Produto_Pedido (ID, ProdutoID, PedidoID, Quantidade) VALUES
(4, 19, 6, 5);


-- Quantos pedidos foram feitos por cada cliente?
SELECT c.Nome, COUNT(p.ID) AS TotalPedidos
FROM Cliente c
LEFT JOIN Pedido p ON c.ID = p.ClienteID
GROUP BY c.Nome;


-- Relação de produtos fornecedores e estoques
SELECT p.Nome AS Produto, f.Nome AS Fornecedor, p.Estoque
FROM Produto_Fornecedor pf
JOIN Produto p ON pf.ProdutoID = p.ID
JOIN Fornecedor f ON pf.FornecedorID = f.ID;

-- Relação de nomes dos fornecedores e nomes dos produtos
SELECT f.Nome AS Fornecedor, group_concat(p.Nome, ', ') AS Produtos
FROM Fornecedor f
JOIN Produto_Fornecedor pf ON f.ID = pf.FornecedorID
JOIN Produto p ON pf.ProdutoID = p.ID
GROUP BY f.Nome;

-- Consulta de produtos mais caros
SELECT Nome, Preco
FROM Produto
ORDER BY Preco DESC;

-- Consulta de pedidos do Cliente PF
SELECT c.Nome AS Cliente, p.ID AS Pedido, p.Data
FROM Cliente c
JOIN Pedido p ON c.ID = p.ClienteID
WHERE c.Tipo = 'PF';

-- Consulta de total de vendas por fornecedor
SELECT f.Nome AS Fornecedor, SUM(p.Preco) AS TotalVendas
FROM Fornecedor f
JOIN Produto_Fornecedor pf ON f.ID = pf.FornecedorID
JOIN Produto p ON pf.ProdutoID = p.ID
GROUP BY f.Nome;

-- Consulta de produtos com estoque baixo
SELECT Nome, Estoque
FROM Produto
WHERE Estoque < 10;

-- Consulta de pedidos entregues
SELECT p.ID AS Pedido, e.Status AS StatusEntrega
FROM Pedido p
JOIN Entrega e ON p.ID = e.PedidoID
WHERE e.Status = 'Entregue';


-- Consulta de clientes sem pedidos
SELECT c.Nome AS Cliente
FROM Cliente c
LEFT JOIN Pedido p ON c.ID = p.ClienteID
WHERE p.ID IS NULL;


-- Consulta de produtos vendidos em pedidos
SELECT p.Nome AS Produto, SUM(pp.Quantidade) AS QuantidadeVendida
FROM Produto_Pedido pp
JOIN Produto p ON pp.ProdutoID = p.ID
GROUP BY p.Nome;

-- Consulta de média de preço dos produtos
SELECT AVG(Preco) AS MediaPreco
FROM Produto;


-- Consulta de pedidos com pagamento em dinheiro
SELECT p.ID AS Pedido, pa.FormaPagamento
FROM Pedido p
JOIN Pagamento pa ON p.ID = pa.PedidoID
WHERE pa.FormaPagamento = 'Dinheiro';




