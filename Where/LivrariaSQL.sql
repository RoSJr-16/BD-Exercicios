create database dbBrasileira;
use dbBrasileira;

drop table autores;
create table autores(
id_autor int not null,
autorNome varchar(100) not null,
primary key (id_autor)
)

create table livros(
NomeLivro varchar(100) not null, 
isbnLivro int not null,
Autor varchar(100) not null,
Editora varchar(50) not null,
G�nero varchar(50) not null,
N�_de_p�ginas int not null,
primary key (isbnLivro)
)

insert into autores
(id_autor, autorNome) values
(1, 'Carlos D. de Andrade'),
(2, 'Vin�cius de Moraes' ),
(3,	'Cec�lia Meirelles' ),
(4, 'Manuel Bandeira' ),
(5, 'Machado de Assis' );


drop table livros

insert into livros
(NomeLivro, isbnLivro, Autor, Editora, G�nero, N�_de_p�ginas ) values
('Est�rias da casa velha da ponte', 12438739, 'Cora Coralina', '�tica', 'Romance', 298),
('O tesouro da Casa velha', 63762892, 'Cora Coralina', 'Cia das Letras', 'Romance', 172),
('A hora da Estrela', 73682920, 'Clarice Lispector', 'Cia das Letras', 'Poesia', 92),
('Meu livro de cordel', 72879012, 'Cora Coralina', 'Saraiva', 'Poesia', 123),
('A descoberta do mundo', 98920212, 'Clarice Lispector', 'Saraiva', 'Romance', 321),
('Ou isto ou aquilo', 73928923, 'Cec�lia Meirelles', '�tica', 'Poesia', 122);

select * from livros;
select * from autores;

UPDATE autores
set autorNome = 'Carlos Drummond de Andrade'
where id_autor = 1;


--Cora Coralina--
SELECT * FROM livros
WHERE Autor like 'Cora Coralina%'; 

--Numero de pagina--
SELECT * FROM livros
WHERE N�_de_p�ginas>200 and N�_de_p�ginas<300;

--livros O--
SELECT * FROM livros
WHERE NomeLivro like 'O%';

--livros romance--
SELECT * FROM livros 
WHERE G�nero like 'Romance%';
