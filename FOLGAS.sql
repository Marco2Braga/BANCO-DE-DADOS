CREATE DATABASE folgasplanilha;
CREATE TABLE cad_funcionario (
	matricula INT NOT NULL PRIMARY KEY,
	nome VARCHAR(50) NOT NULL,
	funcao VARCHAR(20) NOT NULL,
	phone INT NOT NULL 
	);

CREATE TABLE folgas (
matricula INT NOT NULL,
nome VARCHAR(50) NOT NULL,
saldo_de_folgas INT NULL,
FOREIGN KEY (matricula) REFERENC TABLE (cad_funcionario)
);

CREATE TABLE folicitacoes (
matricula INT NOT NULL,
nome VARCHAR(50) NOT NULL,
data_desejada date NULL,
decisao VARCHAR(4) NULL
);

INSERT INTO cad_funcionario(matricula,nome,funcao,phone) VALUES (98990120, 'MARCO BRAGA', 'AGT V', 21995282680);
INSERT INTO cad_funcionario(matricula,nome,funcao,phone) VALUES (98960299, 'RAMOM POZE', 'AGT M', 21995290878);
