create database Fixacao;
use Fixacao;

create table Seila(
id int not null,
Nome varchar(100) not null,
Cargo varchar(100) not null,
Nascimento date not null,
Taxa_presença decimal (2, 1) not null,
Salario_base decimal (10, 3) not null,
Avaliaçao decimal (2,2) not null,
primary key (id),
);

insert into Seila
(id, Nome, Cargo, Nascimento, Taxa_presença, Salario_base, Avaliaçao) values
(1, 'João Maria de Jesus', 'Administrativo', '07/23/1978', 80.2, 10.600, 8.7),
(2, 'Felipe dos Santos', 'Técnico', '88/11/08', 90, 18.200, 5.6),
(3, 'Maria José Silva', 'Técnico', '90/12/23', 87.3, 15.000, 4.5),
(4, 'José Silva', 'Asministrativo', '78/12/23', 60, 16.200, 9.3),
(5, 'Mário Antunes', 'RH', '77/02/11', 54.2, 8.000, 7.2),
(6, 'Paulo Roberto Silva', 'RH', '1976/10/13', 87.2333, 8.900, 9.9),
(7, 'Teresa Jardim', 'RH', '80/01/13', 100, 4.000, 7.7),
(8, 'Roberto Carlos Alves', 'RH', '83/12/10', 23.64, 4.000, 7.7),
(9, 'Paulo Jardim', 'RH', '45/06/28', 34.89, 30.500, 10),
(10, 'Maria Eduarda Carvalho da Rosa', 'Administrativo', '70/08/30', 90.78, 9.000, 6.6),
(11, 'Pedro Henrique Teixeira', 'Técnico', '78/12/23', 100, 7.400, 7.2);

select * from Seila

drop table Seila;