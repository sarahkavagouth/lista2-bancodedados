CREATE DATABASE db_ecommerce_exam;
USE db_ecommerce_exam;
CREATE TABLE produtos (
   produto_id INT AUTO_INCREMENT PRIMARY KEY,
   nome VARCHAR(100) NOT NULL,
   descricao TEXT,
   preco DECIMAL(10, 2) NOT NULL,
   estoque INT NOT NULL,
   data_adicionado DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE clientes (
   cliente_id INT AUTO_INCREMENT PRIMARY KEY,
   nome VARCHAR(100) NOT NULL,
   email VARCHAR(100) UNIQUE NOT NULL,
   telefone VARCHAR(15),
   endereco TEXT,
   data_registro DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE pedidos (
   pedido_id INT AUTO_INCREMENT PRIMARY KEY,
   cliente_id INT NOT NULL,
   data_pedido DATETIME DEFAULT CURRENT_TIMESTAMP,
   total DECIMAL(10, 2) NOT NULL,
   status VARCHAR(50),
   FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id)
);

CREATE TABLE itens_pedido (
   item_pedido_id INT AUTO_INCREMENT PRIMARY KEY,
   pedido_id INT NOT NULL,
   produto_id INT NOT NULL,
   quantidade INT NOT NULL,
   preco_unitario DECIMAL(10, 2) NOT NULL,
   FOREIGN KEY (pedido_id) REFERENCES pedidos(pedido_id),
   FOREIGN KEY (produto_id) REFERENCES produtos(produto_id)
);

-- Inserindo produtos
INSERT INTO produtos (nome, descricao, preco, estoque) VALUES
('Smartphone XYZ', 'Smartphone com 128GB de armazenamento', 1200.00, 50),
('Notebook ABC', 'Notebook com 16GB RAM e 512GB SSD', 3500.00, 30),
('Tablet DEF', 'Tablet com tela de 10 polegadas', 800.00, 40);

-- Inserindo clientes
INSERT INTO clientes (nome, email, telefone, endereco) VALUES
('João da Silva', 'joao.silva@email.com', '11999999999', 'Rua A, 123'),
('Maria Oliveira', 'maria.oliveira@email.com', '11888888888', 'Rua B, 456'),
('Carlos Pereira', 'carlos.pereira@email.com', '11777777777', 'Rua C, 789');

-- Inserindo pedidos
INSERT INTO pedidos (cliente_id, total, status) VALUES
(1, 2400.00, 'Processando'),
(2, 800.00, 'Enviado'),
(3, 3500.00, 'Entregue');

-- Inserindo itens dos pedidos
INSERT INTO itens_pedido (pedido_id, produto_id, quantidade, preco_unitario) VALUES
(1, 1, 2, 1200.00),
(2, 3, 1, 800.00),
(3, 2, 1, 3500.00);


CREATE DATABASE db_crm_exam;
USE db_crm_exam;
CREATE TABLE clientes (
   cliente_id INT AUTO_INCREMENT PRIMARY KEY,
   nome VARCHAR(100) NOT NULL,
   email VARCHAR(100) UNIQUE NOT NULL,
   telefone VARCHAR(15),
   endereco TEXT,
   data_registro DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE interacoes (
   interacao_id INT AUTO_INCREMENT PRIMARY KEY,
   cliente_id INT NOT NULL,
   tipo VARCHAR(50),
   data_interacao DATETIME DEFAULT CURRENT_TIMESTAMP,
   detalhes TEXT,
   FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id)
);

CREATE TABLE campanhas (
   campanha_id INT AUTO_INCREMENT PRIMARY KEY,
   nome VARCHAR(100) NOT NULL,
   descricao TEXT,
   data_inicio DATE,
   data_fim DATE
);

CREATE TABLE participacoes_campanha (
   participacao_id INT AUTO_INCREMENT PRIMARY KEY,
   cliente_id INT NOT NULL,
   campanha_id INT NOT NULL,
   data_participacao DATETIME DEFAULT CURRENT_TIMESTAMP,
   FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id),
   FOREIGN KEY (campanha_id) REFERENCES campanhas(campanha_id)
);

-- Inserindo clientes
INSERT INTO clientes (nome, email, telefone, endereco) VALUES
('Lucas Andrade', 'lucas.andrade@email.com', '11555555555', 'Avenida D, 1001'),
('Fernanda Costa', 'fernanda.costa@email.com', '11666666666', 'Rua E, 202'),
('Renata Souza', 'renata.souza@email.com', '11777777777', 'Rua F, 303');

-- Inserindo interações
INSERT INTO interacoes (cliente_id, tipo, detalhes) VALUES
(1, 'Telefone', 'Ligação para esclarecimento sobre produto'),
(2, 'Email', 'Enviado e-mail promocional da campanha de verão'),
(3, 'Chat', 'Suporte técnico solicitado via chat online');

-- Inserindo campanhas
INSERT INTO campanhas (nome, descricao, data_inicio, data_fim) VALUES
('Campanha Verão 2024', 'Descontos especiais para produtos de verão', '2024-01-01', '2024-03-31'),
('Campanha Black Friday', 'Ofertas de Black Friday 2024', '2024-11-25', '2024-11-30');

-- Inserindo participações em campanhas
INSERT INTO participacoes_campanha (cliente_id, campanha_id) VALUES
(1, 1),
(2, 2),
(3, 1);


CREATE DATABASE db_financas_exam;
USE db_financas_exam;

CREATE TABLE contas (
   conta_id INT AUTO_INCREMENT PRIMARY KEY,
   nome VARCHAR(100) NOT NULL,
   tipo VARCHAR(50),
   saldo DECIMAL(15, 2) DEFAULT 0.00,
   data_criacao DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE transacoes (
   transacao_id INT AUTO_INCREMENT PRIMARY KEY,
   conta_id INT NOT NULL,
   tipo VARCHAR(50),
   valor DECIMAL(15, 2) NOT NULL,
   data_transacao DATETIME DEFAULT CURRENT_TIMESTAMP,
   descricao TEXT,
   FOREIGN KEY (conta_id) REFERENCES contas(conta_id)
);

CREATE TABLE orcamentos (
   orcamento_id INT AUTO_INCREMENT PRIMARY KEY,
   categoria VARCHAR(100),
   valor_planejado DECIMAL(15, 2) NOT NULL,
   data_inicio DATE,
   data_fim DATE
);

-- Inserindo contas
INSERT INTO contas (nome, tipo, saldo) VALUES
('Conta Corrente', 'Conta Corrente', 5000.00),
('Poupança', 'Conta Poupança', 12000.00),
('Investimentos', 'Conta Investimento', 20000.00);

-- Inserindo transações
INSERT INTO transacoes (conta_id, tipo, valor, descricao) VALUES
(1, 'Débito', 1000.00, 'Pagamento de aluguel'),
(2, 'Crédito', 1500.00, 'Depósito mensal'),
(3, 'Crédito', 5000.00, 'Rendimento de investimentos');

-- Inserindo orçamentos
INSERT INTO orcamentos (categoria, valor_planejado, data_inicio, data_fim) VALUES
('Alimentação', 2000.00, '2024-01-01', '2024-01-31'),
('Transporte', 800.00, '2024-01-01', '2024-01-31'),
('Lazer', 1000.00, '2024-01-01', '2024-01-31');


CREATE DATABASE db_prontuario_exam;
USE db_prontuario_exam;

CREATE TABLE pacientes (
   paciente_id INT AUTO_INCREMENT PRIMARY KEY,
   nome VARCHAR(100) NOT NULL,
   data_nascimento DATE,
   sexo VARCHAR(10),
   telefone VARCHAR(15),
   endereco TEXT,
   data_registro DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE prontuarios (
   prontuario_id INT AUTO_INCREMENT PRIMARY KEY,
   paciente_id INT NOT NULL,
   data_consulta DATETIME DEFAULT CURRENT_TIMESTAMP,
   medico VARCHAR(100),
   diagnostico TEXT,
   prescricao TEXT,
   observacoes TEXT,
   FOREIGN KEY (paciente_id) REFERENCES pacientes(paciente_id)
);

CREATE TABLE consultas (
   consulta_id INT AUTO_INCREMENT PRIMARY KEY,
   paciente_id INT NOT NULL,
   medico VARCHAR(100),
   data_consulta DATETIME DEFAULT CURRENT_TIMESTAMP,
   motivo TEXT,
   FOREIGN KEY (paciente_id) REFERENCES pacientes(paciente_id)
);

-- Inserindo pacientes
INSERT INTO pacientes (nome, data_nascimento, sexo, telefone, endereco) VALUES
('Ana Lima', '1985-04-23', 'Feminino', '11911111111', 'Rua G, 101'),
('Bruno Souza', '1978-11-10', 'Masculino', '11822222222', 'Rua H, 202'),
('Carla Mendes', '1990-08-30', 'Feminino', '11733333333', 'Rua I, 303');

-- Inserindo prontuários
INSERT INTO prontuarios (paciente_id, medico, diagnostico, prescricao, observacoes) VALUES
(1, 'Dr. Silva', 'Gripe', 'Antitérmicos e repouso', 'Paciente deve retornar em 7 dias'),
(2, 'Dra. Pereira', 'Hipertensão', 'Controle da pressão e mudança de dieta', 'Acompanhamento mensal necessário'),
(3, 'Dr. Santos', 'Enxaqueca', 'Analgésicos e redução de estresse', 'Recomendado exame neurológico');

-- Inserindo consultas
INSERT INTO consultas (paciente_id, medico, motivo) VALUES
(1, 'Dr. Silva', 'Consulta de retorno após tratamento de gripe'),
(2, 'Dra. Pereira', 'Primeira consulta de acompanhamento da hipertensão'),
(3, 'Dr. Santos', 'Consulta inicial para avaliação de enxaqueca crônica');


CREATE DATABASE db_logistica_exam;
USE db_logistica_exam;

CREATE TABLE fornecedores (
   fornecedor_id INT AUTO_INCREMENT PRIMARY KEY,
   nome VARCHAR(100) NOT NULL,
   contato VARCHAR(100),
   telefone VARCHAR(15),
   endereco TEXT
);

CREATE TABLE produtos (
   produto_id INT AUTO_INCREMENT PRIMARY KEY,
   nome VARCHAR(100) NOT NULL,
   descricao TEXT,
   preco DECIMAL(10, 2) NOT NULL,
   fornecedor_id INT,
   estoque INT NOT NULL,
   FOREIGN KEY (fornecedor_id) REFERENCES fornecedores(fornecedor_id)
);

CREATE TABLE armazens (
   armazem_id INT AUTO_INCREMENT PRIMARY KEY,
   nome VARCHAR(100) NOT NULL,
   localizacao VARCHAR(100)
);

CREATE TABLE movimentacao_estoque (
   movimentacao_id INT AUTO_INCREMENT PRIMARY KEY,
   produto_id INT NOT NULL,
   armazem_id INT NOT NULL,
   quantidade INT NOT NULL,
   tipo_movimentacao VARCHAR(50),
   data_movimentacao DATETIME DEFAULT CURRENT_TIMESTAMP,
   FOREIGN KEY (produto_id) REFERENCES produtos(produto_id),
   FOREIGN KEY (armazem_id) REFERENCES armazens(armazem_id)
);

CREATE TABLE entregas (
   entrega_id INT AUTO_INCREMENT PRIMARY KEY,
   produto_id INT NOT NULL,
   quantidade INT NOT NULL,
   endereco_entrega TEXT,
   data_entrega DATETIME,
   status VARCHAR(50),
   FOREIGN KEY (produto_id) REFERENCES produtos(produto_id)
);

-- Inserindo fornecedores
INSERT INTO fornecedores (nome, contato, telefone, endereco) VALUES
('Fornecedor A', 'Carlos Lima', '11444444444', 'Av. J, 1000'),
('Fornecedor B', 'Mariana Costa', '11333333333', 'Rua K, 500'),
('Fornecedor C', 'Renato Santos', '11222222222', 'Rua L, 300');

-- Inserindo produtos
INSERT INTO produtos (nome, descricao, preco, fornecedor_id, estoque) VALUES
('Produto X', 'Descrição do produto X', 100.00, 1, 100),
('Produto Y', 'Descrição do produto Y', 200.00, 2, 50),
('Produto Z', 'Descrição do produto Z', 150.00, 3, 75);

-- Inserindo armazéns
INSERT INTO armazens (nome, localizacao) VALUES
('Armazém Central', 'Centro'),
('Armazém Norte', 'Zona Norte'),
('Armazém Sul', 'Zona Sul');

-- Inserindo movimentações de estoque
INSERT INTO movimentacao_estoque (produto_id, armazem_id, quantidade, tipo_movimentacao) VALUES
(1, 1, 50, 'Entrada'),
(2, 2, 30, 'Saída'),
(3, 3, 20, 'Entrada');

-- Inserindo entregas
INSERT INTO entregas (produto_id, quantidade, endereco_entrega, data_entrega, status) VALUES
(1, 10, 'Rua M, 120', '2024-09-15', 'Enviado'),
(2, 5, 'Rua N, 220', '2024-09-16', 'Entregue'),
(3, 15, 'Rua O, 320', '2024-09-17', 'Pendente');


-- 1. E-commerce e Gestão de Inventário

/*
1. Exercício 1:
Escreva uma consulta SQL que recupere todos os pedidos juntamente com o nome e o email dos clientes que fizeram esses pedidos. Utilize INNER JOIN para combinar as tabelas de pedidos e clientes.*/

SELECT 
    pedidos.pedido_id,
    clientes.nome AS cliente_nome,
    clientes.email AS cliente_email
FROM 
    pedidos
INNER JOIN 
    clientes ON pedidos.cliente_id = clientes.cliente_id;


/*
2. Exercício 2:
Crie uma consulta para listar todos os produtos e, caso existam, os detalhes dos pedidos em que esses produtos foram vendidos. Utilize LEFT JOIN para incluir todos os produtos, mesmo aqueles que não foram vendidos.*/

SELECT 
    produtos.produto_id,
    produtos.nome AS produto_nome,
    produtos.descricao,
    produtos.preco,
    pedidos.pedido_id,
    itens_pedido.quantidade,
    itens_pedido.preco_unitario
FROM 
    produtos
LEFT JOIN 
    itens_pedido ON produtos.produto_id = itens_pedido.produto_id
LEFT JOIN 
    pedidos ON itens_pedido.pedido_id = pedidos.pedido_id;


/*
3. Exercício 3:
Desenvolva uma consulta para obter o nome do cliente e o total do pedido para todos os pedidos realizados, incluindo clientes que possam não ter nenhum pedido associado. Use LEFT JOIN.*/

SELECT 
    clientes.nome AS cliente_nome,
    pedidos.total
FROM 
    clientes
LEFT JOIN 
    pedidos ON clientes.cliente_id = pedidos.cliente_id;


/*
4. Exercício 4:
Escreva uma consulta para listar todos os itens de pedido junto com o nome dos produtos. Utilize INNER JOIN para combinar as tabelas de itens de pedido e produtos.*/

SELECT 
    itens_pedido.item_pedido_id,
    produtos.nome AS produto_nome,
    itens_pedido.quantidade,
    itens_pedido.preco_unitario
FROM 
    itens_pedido
INNER JOIN 
    produtos ON itens_pedido.produto_id = produtos.produto_id;


/*
5. Exercício 5:
Elabore uma consulta para exibir todos os clientes e seus pedidos, mas também inclua clientes que ainda não fizeram pedidos. Utilize LEFT JOIN entre as tabelas de clientes e pedidos.*/

SELECT 
    clientes.nome AS cliente_nome,
    pedidos.pedido_id,
    pedidos.total,
    pedidos.status
FROM 
    clientes
LEFT JOIN 
    pedidos ON clientes.cliente_id = pedidos.cliente_id;


/*
6. Exercício 6:
Elabore uma consulta para exibir os detalhes de cada pedido (pedido_id, nome do cliente, total do pedido) e todos os itens do pedido (nome do produto, quantidade, preço unitário). Utilize INNER JOIN para combinar as tabelas de pedidos, clientes e itens de pedido.*/

SELECT 
    pedidos.pedido_id,
    clientes.nome AS cliente_nome,
    pedidos.total AS total_pedido,
    produtos.nome AS produto_nome,
    itens_pedido.quantidade,
    itens_pedido.preco_unitario
FROM 
    pedidos
INNER JOIN 
    clientes ON pedidos.cliente_id = clientes.cliente_id
INNER JOIN 
    itens_pedido ON pedidos.pedido_id = itens_pedido.pedido_id
INNER JOIN 
    produtos ON itens_pedido.produto_id = produtos.produto_id;
    
    
    

-- 2. Sistema de Gestão de Relacionamento com o Cliente (CRM)

/*1. Exercício 1:
Crie uma consulta que recupere todos os clientes e as interações que eles tiveram. Utilize LEFT JOIN para incluir todos os clientes, mesmo aqueles sem interações.*/

SELECT 
    clientes.cliente_id,
    clientes.nome AS cliente_nome,
    interacoes.interacao_id,
    interacoes.tipo,
    interacoes.detalhes
FROM 
    clientes
LEFT JOIN 
    interacoes ON clientes.cliente_id = interacoes.cliente_id;


/*
2. Exercício 2:
Desenvolva uma consulta que liste todas as campanhas e os clientes que participaram delas. Utilize INNER JOIN para combinar as tabelas de campanhas e participações de campanha.*/

SELECT 
    campanhas.campanha_id,
    campanhas.nome AS campanha_nome,
    campanhas.descricao,
    clientes.cliente_id,
    clientes.nome AS cliente_nome
FROM 
    campanhas
INNER JOIN 
    participacoes_campanha ON campanhas.campanha_id = participacoes_campanha.campanha_id
INNER JOIN 
    clientes ON participacoes_campanha.cliente_id = clientes.cliente_id;


/*
3. Exercício 3:
Elabore uma consulta para obter todos os clientes, incluindo os que não participaram de nenhuma campanha. Utilize LEFT JOIN entre as tabelas de clientes e participações de campanha.*/

SELECT 
    clientes.cliente_id,
    clientes.nome AS cliente_nome,
    campanhas.campanha_id,
    campanhas.nome AS campanha_nome
FROM 
    clientes
LEFT JOIN 
    participacoes_campanha ON clientes.cliente_id = participacoes_campanha.cliente_id
LEFT JOIN 
    campanhas ON participacoes_campanha.campanha_id = campanhas.campanha_id;


/*
4. Exercício 4:
Escreva uma consulta para listar todos os clientes e as campanhas que participaram, mesmo que não haja clientes associados a uma campanha específica. Utilize RIGHT JOIN entre as tabelas de clientes e campanhas.*/

SELECT 
    clientes.cliente_id,
    clientes.nome AS cliente_nome,
    campanhas.campanha_id,
    campanhas.nome AS campanha_nome
FROM 
    campanhas
RIGHT JOIN 
    participacoes_campanha ON campanhas.campanha_id = participacoes_campanha.campanha_id
RIGHT JOIN 
    clientes ON participacoes_campanha.cliente_id = clientes.cliente_id;


/*
5. Exercício 5:
Crie uma consulta para exibir os detalhes de todas as interações feitas por clientes, incluindo o nome do cliente, o tipo de interação e os detalhes. Utilize INNER JOIN para associar as tabelas de interações e clientes.*/

SELECT 
    clientes.nome AS cliente_nome,
    interacoes.tipo,
    interacoes.detalhes
FROM 
    interacoes
INNER JOIN 
    clientes ON interacoes.cliente_id = clientes.cliente_id;


/*
6. Exercício 6:
Crie uma consulta que liste todas as campanhas e o número total de clientes que participaram de cada campanha. Inclua campanhas que não tiveram participações. Utilize LEFT JOIN entre as tabelas de campanhas e participações de campanha.*/

SELECT 
    campanhas.campanha_id,
    campanhas.nome AS campanha_nome,
    COUNT(participacoes_campanha.cliente_id) AS numero_clientes
FROM 
    campanhas
LEFT JOIN 
    participacoes_campanha ON campanhas.campanha_id = participacoes_campanha.campanha_id
GROUP BY 
    campanhas.campanha_id, campanhas.nome;



-- 3. Finanças e Controle Orçamentário

/*1. Exercício 1:
Escreva uma consulta que liste todas as transações junto com o nome da conta associada a cada transação. Utilize INNER JOIN para combinar as tabelas de transações e contas.*/

SELECT 
    transacoes.transacao_id,
    contas.nome AS conta_nome,
    transacoes.tipo AS tipo_transacao,
    transacoes.valor,
    transacoes.descricao
FROM 
    transacoes
INNER JOIN 
    contas ON transacoes.conta_id = contas.conta_id;


/*
2. Exercício 2:
Desenvolva uma consulta para obter todas as contas e suas transações, incluindo contas que ainda não têm transações registradas. Utilize LEFT JOIN entre as tabelas de contas e transações.*/

SELECT 
    contas.conta_id,
    contas.nome AS conta_nome,
    transacoes.transacao_id,
    transacoes.tipo AS tipo_transacao,
    transacoes.valor,
    transacoes.descricao
FROM 
    contas
LEFT JOIN 
    transacoes ON contas.conta_id = transacoes.conta_id;


/*
3. Exercício 3:
Crie uma consulta para listar todas as transações com a categoria do orçamento associada, se houver. Utilize LEFT JOIN para incluir todas as transações.*/

SELECT 
    transacoes.transacao_id,
    transacoes.tipo AS tipo_transacao,
    transacoes.valor,
    transacoes.descricao,
    orcamentos.categoria
FROM 
    transacoes
LEFT JOIN 
    orcamentos ON transacoes.conta_id = orcamentos.orcamento_id;


/*
4. Exercício 4:
Elabore uma consulta para exibir todos os orçamentos e as transações relacionadas a eles, incluindo orçamentos que não possuem transações associadas. Utilize RIGHT JOIN.*/

SELECT 
    orcamentos.orcamento_id,
    orcamentos.categoria,
    orcamentos.valor_planejado,
    transacoes.transacao_id,
    transacoes.tipo AS tipo_transacao,
    transacoes.valor,
    transacoes.descricao
FROM 
    orcamentos
RIGHT JOIN 
    transacoes ON orcamentos.orcamento_id = transacoes.conta_id;


/*
5. Exercício 5:
Crie uma consulta para obter o nome da conta, tipo de conta, tipo de transação e o valor para todas as transações, utilizando INNER JOIN entre as tabelas de contas e transações.*/

SELECT 
    contas.nome AS conta_nome,
    contas.tipo AS tipo_conta,
    transacoes.tipo AS tipo_transacao,
    transacoes.valor
FROM 
    transacoes
INNER JOIN 
    contas ON transacoes.conta_id = contas.conta_id;


/*
6. Exercício 6:
Escreva uma consulta que mostre o saldo total de todas as contas, bem como o número total de transações associadas a cada conta. Inclua contas que não têm transações. Utilize LEFT JOIN entre as tabelas de contas e transações.*/

SELECT 
    contas.nome AS conta_nome,
    contas.saldo AS saldo_total,
    COUNT(transacoes.transacao_id) AS numero_transacoes
FROM 
    contas
LEFT JOIN 
    transacoes ON contas.conta_id = transacoes.conta_id
GROUP BY 
    contas.nome, contas.saldo;



-- 4. Saúde e Gestão de Prontuários Eletrônicos

/*1. Exercício 1:
Crie uma consulta que recupere todos os prontuários, incluindo o nome do paciente e o nome do médico que o atendeu. Utilize INNER JOIN entre as tabelas de prontuários e pacientes.*/

SELECT 
    prontuarios.prontuario_id,
    pacientes.nome AS paciente_nome,
    prontuarios.medico
FROM 
    prontuarios
INNER JOIN 
    pacientes ON prontuarios.paciente_id = pacientes.paciente_id;


/*
2. Exercício 2:
Elabore uma consulta para listar todos os pacientes e suas consultas, incluindo pacientes que não têm consultas registradas. Utilize LEFT JOIN entre as tabelas de pacientes e consultas.*/

SELECT 
    pacientes.paciente_id,
    pacientes.nome AS paciente_nome,
    consultas.consulta_id,
    consultas.medico AS medico_consulta,
    consultas.data_consulta,
    consultas.motivo
FROM 
    pacientes
LEFT JOIN 
    consultas ON pacientes.paciente_id = consultas.paciente_id;


/*
3. Exercício 3:
Desenvolva uma consulta que liste todas as consultas, incluindo o nome do paciente e o motivo da consulta. Utilize INNER JOIN entre as tabelas de consultas e pacientes.*/

SELECT 
    consultas.consulta_id,
    pacientes.nome AS paciente_nome,
    consultas.medico AS medico_consulta,
    consultas.data_consulta,
    consultas.motivo
FROM 
    consultas
INNER JOIN 
    pacientes ON consultas.paciente_id = pacientes.paciente_id;


/*
4. Exercício 4:
Crie uma consulta para exibir todos os pacientes e os prontuários relacionados, incluindo pacientes sem prontuários. Utilize LEFT JOIN entre as tabelas de pacientes e prontuários.*/

SELECT 
    pacientes.paciente_id,
    pacientes.nome AS paciente_nome,
    prontuarios.prontuario_id,
    prontuarios.data_consulta,
    prontuarios.diagnostico
FROM 
    pacientes
LEFT JOIN 
    prontuarios ON pacientes.paciente_id = prontuarios.paciente_id;


/*
5. Exercício 5:
Escreva uma consulta para listar todos os prontuários, incluindo os detalhes da consulta (como médico e data) se houver. Utilize LEFT JOIN entre as tabelas de prontuários e consultas.*/

SELECT 
    prontuarios.prontuario_id,
    prontuarios.paciente_id,
    prontuarios.data_consulta AS data_prontuario,
    prontuarios.diagnostico,
    consultas.medico AS medico_consulta,
    consultas.data_consulta,
    consultas.motivo
FROM 
    prontuarios
LEFT JOIN 
    consultas ON prontuarios.paciente_id = consultas.paciente_id AND prontuarios.data_consulta = consultas.data_consulta;


/*
6. Exercício 6:
Desenvolva uma consulta que liste todos os pacientes e o número total de consultas que cada um teve. Inclua pacientes que não tiveram consultas registradas. Utilize LEFT JOIN entre as tabelas de pacientes e consultas.*/

SELECT 
    pacientes.paciente_id,
    pacientes.nome AS paciente_nome,
    COUNT(consultas.consulta_id) AS numero_consultas
FROM 
    pacientes
LEFT JOIN 
    consultas ON pacientes.paciente_id = consultas.paciente_id
GROUP BY 
    pacientes.paciente_id, pacientes.nome;



-- 5. Logística e Cadeia de Suprimentos

/*1. Exercício 1:
Crie uma consulta para listar todos os produtos e seus fornecedores, incluindo produtos sem fornecedores. Utilize LEFT JOIN entre as tabelas de produtos e fornecedores.*/

SELECT 
    produtos.produto_id,
    produtos.nome AS produto_nome,
    fornecedores.nome AS fornecedor_nome
FROM 
    produtos
LEFT JOIN 
    fornecedores ON produtos.fornecedor_id = fornecedores.fornecedor_id;


/*
2. Exercício 2:
Desenvolva uma consulta que recupere todos os movimentos de estoque e o nome do produto associado a cada movimento. Utilize INNER JOIN entre as tabelas de movimentação de estoque e produtos.*/

SELECT 
    movimentacao_estoque.movimentacao_id,
    produtos.nome AS produto_nome,
    movimentacao_estoque.quantidade,
    movimentacao_estoque.tipo_movimentacao,
    movimentacao_estoque.data_movimentacao
FROM 
    movimentacao_estoque
INNER JOIN 
    produtos ON movimentacao_estoque.produto_id = produtos.produto_id;


/*
3. Exercício 3:
Escreva uma consulta para obter todos os armazéns e os movimentos de estoque realizados neles, incluindo armazéns sem movimentos registrados. Utilize LEFT JOIN entre as tabelas de armazéns e movimentação de estoque.*/

SELECT 
    armazens.armazem_id,
    armazens.nome AS armazem_nome,
    movimentacao_estoque.movimentacao_id,
    movimentacao_estoque.produto_id,
    movimentacao_estoque.quantidade,
    movimentacao_estoque.tipo_movimentacao
FROM 
    armazens
LEFT JOIN 
    movimentacao_estoque ON armazens.armazem_id = movimentacao_estoque.armazem_id;


/*
4. Exercício 4:
Elabore uma consulta para listar todos os produtos e suas entregas, incluindo produtos que ainda não foram entregues. Utilize LEFT JOIN entre as tabelas de produtos e entregas.*/

SELECT 
    produtos.produto_id,
    produtos.nome AS produto_nome,
    entregas.entrega_id,
    entregas.quantidade,
    entregas.endereco_entrega,
    entregas.data_entrega,
    entregas.status
FROM 
    produtos
LEFT JOIN 
    entregas ON produtos.produto_id = entregas.produto_id;


/*
5. Exercício 5:
Crie uma consulta para exibir todos os fornecedores e os produtos fornecidos por eles, incluindo fornecedores que não forneceram produtos. Utilize LEFT JOIN entre as tabelas de fornecedores e produtos.*/

SELECT 
    fornecedores.fornecedor_id,
    fornecedores.nome AS fornecedor_nome,
    produtos.produto_id,
    produtos.nome AS produto_nome
FROM 
    fornecedores
LEFT JOIN 
    produtos ON fornecedores.fornecedor_id = produtos.fornecedor_id;


/*
6. Exercício 6:
Escreva uma consulta que recupere todos os produtos e a quantidade total disponível em todos os armazéns. Inclua produtos que não têm movimentações de estoque. Utilize LEFT JOIN entre as tabelas de produtos e movimentação de estoque.*/

SELECT 
    produtos.produto_id,
    produtos.nome AS produto_nome,
    COALESCE(SUM(movimentacao_estoque.quantidade), 0) AS quantidade_total
FROM 
    produtos
LEFT JOIN 
    movimentacao_estoque ON produtos.produto_id = movimentacao_estoque.produto_id
GROUP BY 
    produtos.produto_id, produtos.nome;
