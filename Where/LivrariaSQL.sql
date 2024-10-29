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
Gênero varchar(50) not null,
Nº_de_páginas int not null,
primary key (isbnLivro)
)

insert into autores
(id_autor, autorNome) values
(1, 'Carlos D. de Andrade'),
(2, 'Vinícius de Moraes' ),
(3,	'Cecília Meirelles' ),
(4, 'Manuel Bandeira' ),
(5, 'Machado de Assis' );


drop table livros

insert into livros
(NomeLivro, isbnLivro, Autor, Editora, Gênero, Nº_de_páginas ) values
('Estórias da casa velha da ponte', 12438739, 'Cora Coralina', 'Ática', 'Romance', 298),
('O tesouro da Casa velha', 63762892, 'Cora Coralina', 'Cia das Letras', 'Romance', 172),
('A hora da Estrela', 73682920, 'Clarice Lispector', 'Cia das Letras', 'Poesia', 92),
('Meu livro de cordel', 72879012, 'Cora Coralina', 'Saraiva', 'Poesia', 123),
('A descoberta do mundo', 98920212, 'Clarice Lispector', 'Saraiva', 'Romance', 321),
('Ou isto ou aquilo', 73928923, 'Cecília Meirelles', 'Ática', 'Poesia', 122);

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
WHERE Nº_de_páginas>200 and Nº_de_páginas<300;

--livros O--
SELECT * FROM livros
WHERE NomeLivro like 'O%';

--livros romance--
SELECT * FROM livros 
WHERE Gênero like 'Romance%';
