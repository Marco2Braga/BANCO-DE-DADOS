/*Criando banco de dados*/
CREATE DATABASE folgasplanilha;
/*CRIANDO TABELA CADASTRO DE FUNCIONARIO NO BD PLANILHA DE FOLGAS*/
CREATE TABLE cad_funcionario (
    matricula SERIAL PRIMARY KEY,
    nome VARCHAR(50) UNIQUE NOT NULL,
    cargo VARCHAR(50),
    email VARCHAR(50) UNIQUE NOT NULL
);
/*CRIANDO TABELA TABELA GESTAO*/
CREATE TABLE gestao (
    id_gestao INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

/*CRIANDO TABELA DE REGISTRO DE FOLGAS*/
CREATE TABLE registro_folgas (
    matricula SERIAL PRIMARY KEY,
    nome INT,
    saldo INT NOT NULL,
    dt_folga DATE NOT NULL,
    qnt_dias INT NOT NULL,
    status INT NOT NULL,
    id_gestao INT,
    FOREIGN KEY (matricula) REFERENCES cad_funcionarios(matricula),
    FOREIGN KEY (id_gestao) REFERENCES gestao(id_gestao)
);


/*INSERINDO DADOS NA TABELA CAD_FUNCIONARIOS */
insert into cad_funcionario(nome,cargo,email)
values ('marco_braga','motorista','marco2brg@gmail.com'),
('francine_marins','adm','frannm@gmail.com'),
('thiago_dias','agente','thdias@gmail.com'),
('jean_carlos','motorista','jeancar@gmail.com'),
('rafael_faria','mostorista','fariaraf@gmail.com');

/*INSERINDO DADOS NA TABELA DE REGISTRO DE FOLGAS*/
insert into registro_folgas(matricula, nome, saldo, dt_folga, qnt_dias, status, id_gestao)
values ( 3, NULL, 13,'2024/11/18', 2, 'n', NULL),
( 5, NULL, 18,'2024/12/12', 5, 'n', NULL),
( 4, NULL, 10,'2024/11/18', 3, 's', NULL);

/*INSERINDO DADOS NA TABELA GESTAO*/
insert into gestao( id_gestao, nome, email) 
values (100, 'Joao_torres_j', 'jjt@active.com'),
(101,'Estefane_oliv', ' estoliv@qqhora.com'),
(102, 'Patricia_galino', 'pag@uma.com');


/*selecionando elementos na tabela*/
select * from cad_funcionario;
select matricula, nome from cad_funcionario;

/*ADICIONANDO UMA NOVA COLUNA NA TABELA REGISTRO DE FOLGAS */
alter table registro_folgas add column dt_resposta date;

/*COLUNA PARA EXCLUIR*/
ALTER TABLE registro_folgas ADD COLUMN type;

/*(REGISTRO_ FOLGAS) ATUALIZANDO TABELA COM PEDIDO DO FOLGAS ,
diminuindo de uma coluna e adicionando em outra*/
UPDATE registro_folgas 
SET saldo= saldo - qnt_dias, dt_folga = 2024/11/13, qnt_dias = 2   
WHERE matricula = 1;

UPDATE registro_folgas 
SET saldo= saldo - qnt_dias, dt_folga = 2024/12/13, qnt_dias = 4   
WHERE matricula = 3;

/*ATUALIZANDO A TABELA COM REPOSTA DA GESTAO*/
UPDATE registro_folgas 
SET status = 'n', id_gestao = 101 dt_autorizacao = NOW() 
WHERE matricula = 1;

UPDATE registro_folgas 
SET status = 's', id_gestao = 102, dt_resposta = NOW()  
WHERE matricula = 3;

/*deletando uma tabela inteira*/
drop table cad_funcionario;
