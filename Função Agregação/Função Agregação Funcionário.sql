create database Exerc01;
use Exerc01;

drop table tbFunc
create table tbFunc(
codfunc int not null,
Nome_func varchar(100) not null,
Uf char not null,
Idade int not null,
Qtde_filhos int not null,
primary key (Codfunc)
);


drop table tbFuncional
create table tbFuncional(
Codfuncional int not null,
Cargo varchar(100) not null,
Salário Money not null,
Tempo_empresa int not null,
Tempo_cargo int not null,
Sindicalizado char not null,
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
(Codfuncional, Cargo, Salário, Tempo_empresa, Tempo_cargo, Sindicalizado)
(100, ),
(101, ),
(102, ),
(103, ),
(104, ),
(105, ),
(106, ),
(107, ),
(108, ),
(109, ),

