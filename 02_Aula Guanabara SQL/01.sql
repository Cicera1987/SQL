-- criando um banco de dados--
-- create database cadastro
-- comando create é DDL de criar de definição
--- comando para entrar no banco - use 'nome do banco";
--- comando describe pessoas - descrete o que tem na tabela


--criando as tabelas do bancoo de dados no MYSQL
create database cadastro
default character set utf8
default collate utf8_general_ci;

-- Primeira tabela
create table pessoas (
id int not null auto_increment,
nome varchar(30) not null,
data_nascimento date,
sexo enum('M', 'F'),
peso decimal(5,2),
altura decimal(3,2), 
nacionalidade varchar(20) default 'Brasil',
primary key(id)
) default charset = utf8;

-- Para inserir um cadastro - insert into pessoas ---- values

insert into pessoas
(nome, data_nascimento, sexo, peso, altura, nacionalidade)
values
('Cicera', '1987-05-30', 'F', '65.5', '1.62', 'Brasil');

--Para selecionar um cadastro -> select * from pessoas

insert into pessoas
(nome, data_nascimento, sexo, peso, altura, nacionalidade)
values
('João', '1983-08-30', 'M', '99.5', '1.94', 'Brasil');

insert into pessoas
(id,nome, data_nascimento, sexo, peso, altura, nacionalidade)
values
(default,'Carol', '1999-02-12', 'F', '58.5', '1.73', 'Alemanha');

insert into pessoas
(id,nome, data_nascimento, sexo, peso, altura, nacionalidade)
values
(default,'Pedro', '1999-02-20', 'M', '99.5', '1.83', default);

-- Pode usar o modelo e (values) como abaixo caso a ordem da lista de dados seja 
-- exatamente igual
--- a definida na tabela do banco
insert into pessoas values
(default,'Mary', '1999-02-20', 'F', '62.5', '1.68', Irlanda);

-- Ou pode inserir dados desta maneira
insert into pessoas values
(default,'Pedro', '1999-02-20', 'M', '99.5', '1.83', default),
(default,'Carlos', '1995-02-20', 'M', '115.5', '1.93', 'Italia'),
(default,'Maria', '1999-02-20', 'F', '65.5', '1.73', default),
(default,'Felipe', '1988-02-10', 'M', '102.5', '1.73', 'Argentina'),
(default,'Luiz', '1975-02-20', 'M', '101.5', '1.93', default);

-- alterando uma tabela - alter table pessoas
-- adicionando um novo campo na tabela
-- desc pessoas; comando o para ver a descrição nop MYSQL


alter table pessoas
add column profissao varchar(10);

alter table pessoas
drop column profissao;

-- adicionando um campo depois de um campo
alter table pessoas
add column profissao varchar(10) after nome;

-- adicionando um campo em primeiro na lista
alter table pessoas
add column codigo int first;

-- ou assim- sem o column
alter table pessoas
add codigo int first;
