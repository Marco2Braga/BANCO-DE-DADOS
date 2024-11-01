CREATE DATEBASE PLANILHA_DE_FOLGAS;

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
nome VARCHAR(50) UNIQUE NOT NULL,
saldo INT ,
dt_folga DATE NULL,
qnt_dias INT ,
status VARCHAR(3) NULL,
id_gestao INT,
FOREIGN KEY (matricula) REFERENCES cad_funcionario(matricula),
FOREIGN KEY (id_gestao) REFERENCES gestao(id_gestao)
);

/*INSERINDO DADOS NA TABELA CAD_FUNCIONARIOS */
insert into cad_funcionario(nome,cargo,email)
values ('marco_braga','motorista','marco2brg@gmail.com'),
('francine_marins','adm','frannm@gmail.com'),
('thiago_dias','agente','thdias@gmail.com'),
('jean_carlos','motorista','jeancar@gmail.com'),
('rafael_faria','mostorista','fariaraf@gmail.com'),
('caio_vasconcelos','atendente','vasc@caiu.com.br'),
('raimunda_feliciana','adm','fei@carabo.bb'),
('tiago_m_rego','mechanico','tmelo@rego.com'),
('paulo_dorão','motorista','pdurao@fort.com'),
('raissa_capone','mostorista','raicapo@dfusca.br');

/*INSERINDO DADOS NA TABELA DE REGISTRO DE FOLGAS*/
insert into registro_folgas(matricula, nome, saldo)
values ( 3, 'thiago_dias', 13),
( 5, 'rafael_faria', 18),
( 4, 'fean_carlos', 10),
(8, 'tiago_m_rego', 33),
(7, 'raimunda_feliciana', 17),
(1, 'marco_braga', 30),
(2,'francine_marins', 28),
(6, 'caio_vasconcelos', 15),
(9, 'paulo_dorão', 32),
(10, 'raissa_capone', 30);

/*INSERINDO DADOS NA TABELA GESTAO*/
insert into gestao( id_gestao, nome, email)
values (100, 'Joao_torres_j', 'jjt@active.com'),
(101,'Estefane_oliv', ' estoliv@qqhora.com'),
(102, 'Patricia_galino', 'pag@uma.com');

/*UTILIZANDO ALGUNS COMANDOS NO DB*/

/*selecionando elementos na tabela*/
select * from cad_funcionario;
select matricula, nome from cad_funcionario;

/*ADICIONANDO UMA NOVA COLUNA NA TABELA REGISTRO DE FOLGAS */
alter table registro_folgas add column dt_resposta date;

/*COLUNA PARA EXCLUIR*/
ALTER TABLE registro_folgas drop COLUMN dt_resposta;

/*(REGISTRO_ FOLGAS) ATUALIZANDO TABELA COM PEDIDO DO FOLGAS ,
diminuindo de uma coluna e adicionando em outra*/
UPDATE registro_folgas
SET saldo= saldo - qnt_dias, dt_folga = '2024/11/13', qnt_dias = 2
WHERE matricula = 8;
UPDATE registro_folgas
SET saldo= saldo - qnt_dias, dt_folga = '2024/12/13', qnt_dias = 4
WHERE matricula = 3;
UPDATE registro_folgas
SET saldo= saldo - qnt_dias, dt_folga = '2024/12/13', qnt_dias = 7
WHERE matricula = 9;

/*ATUALIZANDO A TABELA COM REPOSTA DA GESTAO*/
UPDATE registro_folgas
SET status = 'n', id_gestao = 101, dt_resposta = NOW()
WHERE matricula = 8;
UPDATE registro_folgas
SET status = 's', id_gestao = 102, dt_resposta = NOW()
WHERE matricula = 3;
UPDATE registro_folgas
SET status = 'sim', id_gestao = 100, dt_resposta = NOW()
WHERE matricula = 9;

/*ordenando uma coluna em crescente*/
select matricula from registro_folgas order by matricula;

/*deletando uma linha da tabela*/
delete from registro_folgas
where matricula = 10;

/*deletando uma tabela inteira*/
drop table cad_funcionario;
