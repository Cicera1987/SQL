create database fornecedor
default character set utf8
default collate utf8_general_ci;

create table produtos (
    id int not null auto_increment,
    nome varchar(30) not null,
    descricao varchar(200),
    data_cadastro timestamp ,
    valor_unitario  decimal(5,2),
    primary key(id)
)default charset = utf8;

create table categorias (
    id int not null auto_increment,
    nome_produto varchar(200),
    primary key(id)
)default charset = utf8;

create table fornecedores (
    id int not null auto_increment,
    cnpj varchar(30) not null unique,
    razao_social varchar(70) not null,
    primary key(id)
)default charset = utf8;

create table pedidos (
    id int not null auto_increment,
    qnt int not null,
    valor_unitario int not null,
    data_pedidos timestamp not null
     primary key(id)
)default charset = utf8;

--- alterando tabelas
alter table fornecedores
add column data_ultima_compra timestamp not null;

alter table pedidos
add column data__pedido timestamp not null; 

alter table produtos
drop column data_cadastro;

alter table fornecedores
modify column razao_social varchar(30) not null;

alter table pedidos
add column numero_pedido decimal(5,2);

insert into fornecedores values
(default, '03.301.604/0008-68', 'Casas Joana', '2022-10-10'),
(default, '05.601.604/0002-65', 'Restaurante dos Mares','2022-10-10' ),
(default, '10.501.604/0004-33', 'Ceralheria Gomes', '2022-10-10'),
(default, '51.101.604/0006-25', 'Casas de Vinhos', '2022-10-10');


insert into produtos values
(default, 'vinho', 'Vinho tinto', '2022-10-10', '65'),
(default, 'vinho', 'Vinho seco', '2022-10-10', '65');

insert into pedidos values
(default, '2', '65', '2022-10-10'),
(default, '4', '36', '2022-10-10',);
