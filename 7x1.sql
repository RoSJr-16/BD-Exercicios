create database Fixacao;
use Fixacao;

create table Seila(
id int not null,
Nome varchar(100) not null,
Cargo varchar(100) not null,
Nascimento date not null,
Taxa_presen�a decimal (2, 1) not null,
Salario_base decimal (10, 3) not null,
Avalia�ao decimal (2,2) not null,
primary key (id),
);

insert into Seila
(id, Nome, Cargo, Nascimento, Taxa_presen�a, Salario_base, Avalia�ao) values
(1, 'Jo�o Maria de Jesus', 'Administrativo', 07/23/78, 80.2, 10600, 8.7),
(2, 'Felipe dos Santos', 'T�cnico', 11/08/88, 90, 18200, 5.6),
(3, 'Maria Jos� Silva', 'T�cnico', 12/23/90, 87.3, 15000, 4.5),
(4, 'Jos� Silva', 'Asministrativo', 12/23/78, 60, 16200, 9.3),
(5, 'M�rio Antunes', 'RH', 02/11/77, 54.2, 8000, 7.2),
(6, '


