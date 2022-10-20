
--Atividade SQL DDL Create table
/*________________________________________________________________________________________________________________
--Faça o modelo conceitual do enunciado abaixo e também faça os comandos DDL para a criação deste banco de dados.
__________________________________________________________________________________________________________________
*/


/*Projeto(codigo,nome)
categoria(codigo, nome)
Colaborador(matricula, nome, emai,senha)*/


create table colaboradores(
    id int auto_increment primary key,
    numero_matricula varchar(20) not null unique,  
    nome varchar(100) not null,
    email varchar(100) not null,
    senha varchar(30) not null,
    id_coordenador int, 
    constraint colaboradores_fk_coordenadores
        foreign key(id_coordenador) references colaboradores(id) 
        on delete set null
);

create table departamentos(
    id int auto_increment primary key,
    nome varchar(100) not null
);

create table projetos(
    id int auto_increment primary key,
    nome varchar(100) not null,
    descricao varchar(200),
    estimativa_duracao int
);

create table projetos_colaboradores
(
    id int auto_increment primary key,
    id_colaborador int not null,
    id_projeto int not null, 
    constraint colaboradores_fk_projetos_colaboradores
        foreign key(id_colaborador) references colaboradores(id),
    constraint projetos_fk_projetos_colaboradores
        foreign key(id_projeto) references projetos(id)
);

create table projetos_comentarios(
    id int auto_increment primary key,
    descricao varchar(500) not null, 
    data_e_hora timestamp not null, -- 2022-10-06 20:08:00
    id_projeto int not null,
    id_colaborador int not null,
    constraint projetos_fk_comentarios
        foreign key(id_projeto) references projetos(id),
    constraint colaboradores_fk_comentarios
        foreign key(id_colaborador) references colaboradores(id)
        on delete restrict 
        on update cascade
);

create table projetos_melhoria_processos
(
    id_projeto int primary key,
    resultados_esperados varchar(1000),
    id_departamento int not null, 
    constraint projetos_fk_projetos_melhoria_processos
        foreign key(id_projeto) references projetos(id)
        on delete cascade,
    constraint departamentos_fk_projetos_melhoria_processos
        foreign key(id_departamento) references departamentos(id)
        on delete restrict 
);

create table projetos_sociais
(
    id_projeto int primary key, 
    publico_beneficiario varchar(100),
    constraint projetos_fk_projetos_sociais
        foreign key(id_projeto) references projetos(id)
        on delete cascade
        on update cascade
);


-- alter table 
alter table projetos add column data_criacao date;

alter table projetos drop column data_criacao;
alter table projetos add column data_criacao date;
alter table projetos drop column data_criacao;

alter table projetos modify data_criacao int;
ALTER TABLE t1 MODIFY a BIGINT
ALTER TABLE projetos RENAME COLUMN data_criacao TO data_emissao;

-- ------------------


ALTER TABLE projetos_sociais 
        DROP FOREIGN KEY projetos_fk_projetos_sociais; 
ALTER TABLE projetos_sociais 
        ADD aconstraint projetos_fk_projetos_sociais
        foreign key(id_projeto) references projetos(id)
        on delete cascade
        on update cascade

        ALTER TABLE projetos_sociais 
			ADD CONSTRAINT projetos_fk_projetos_sociais 
			 foreign key(id_projeto) references projetos(id)
                on delete cascade
                on update cascade


-- Comandos básicos DML

-- inserir uma nova tupla
insert into departamentos(nome) values('construcao');
