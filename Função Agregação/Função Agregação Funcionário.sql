create database Exerc01;
use Exerc01;

drop table tbFunc
create table tbFunc(
codfunc int not null,
Nome_func varchar(100) not null,
Uf varchar(2) not null,
Idade int not null,
Qtde_filhos int not null,
primary key (Codfunc)
);


drop table tbFuncional
create table tbFuncional(
Codfuncional int not null,
Cargo varchar(100) not null,
Salário DECIMAL(10, 3) not null,
Tempo_empresa int not null,
Tempo_cargo int not null,
Sindicalizado varchar (4) not null,
codfunc int not null,
primary key(Codfuncional),
FOREIGN KEY (codfunc) REFERENCES tbFunc(codfunc)
);

insert into tbFunc
(codfunc, nome_func, Uf, Idade, Qtde_filhos) values
(1, 'Lucas Silva',  'SP', 23, 0),
(2, 'Sofia Martins', 'RJ', 21, 1),
(3, 'Gabriel Ferreira', 'RS', 19, 0),
(4, 'Julia Oliveira', 'SP', 28, 2),
(5, 'Mateus Santos', 'BH', 30, 0),
(6, 'Leticia Rodrigues', 'BA', 24, 2),
(7, 'Pedro José', 'PE', 43, 4),
(8, 'Amanda Costa', 'SE', 20, 0),
(9, 'Francisca Lima', 'AL', 61, 6),
(10, 'Beatriz Pereira', 'MS', 31, 1);

insert into tbFuncional
(Codfuncional, Cargo, Salário, Tempo_empresa, Tempo_cargo, Sindicalizado, codfunc) values
(100, 'Diretor de Projeto', 3.701, 1, 1, 'Sim', 1),
(101, 'Designer de Jogabilidade', 3.245, 10, 3, 'Não', 2),
(102, 'Desenvolvedor de Engine', 5.167, 21, 8, 'Sim', 3),
(103, 'Artista Conceitual', 4.792, 1, 1, 'Sim', 4),
(104, 'Programador de Jogabilidade', 3.265, 11, 4, 'Não', 5),
(105, 'Designer de Niveis', 3.067, 2, 2, 'Não', 6),
(106, 'Animador 3D', 4.625, 12, 10, 'Sim', 7),
(107, 'Testador de Qualidade', 1.661, 5, 2, 'Não', 8),
(108, 'Produtor Executivo', 10.667, 10, 9, 'Não', 9),
(109, 'Especialista em Efeitos Visuais', 9.545, 9, 8, 'Sim', 10);

-- APRESENTAR
select * from tbFunc
select * from tbFuncional

-- SOMATÓRIA (1 - 6)
select sum(codfunc) from tbFunc;
select sum(Idade) from tbFunc;
select sum(Qtde_filhos) from tbFunc;
select sum(Salário) from tbFuncional;
select sum(Tempo_empresa) from tbFuncional;
select sum(Tempo_cargo) from tbFuncional;

-- MAIOR E MENOR (7 - 15)

