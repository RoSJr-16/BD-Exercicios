--� Em uma ETEC qualquer haviam 2 turmas do 2� Mtec antes da pandemia, com 40 alunos cada.
--� Por�m, ap�s a suspens�o das aulas presenciais, ser� montada uma �nica turma de 3� com todos os alunos que 
--tiverem o status APROVADO.
--� Fazer um MERGE entre a tabela tb2A e tb2B criando uma �nica turma de 3�.
--� As 3 tabelas possuem um RM (PK), nome do Aluno e status. Somente ser�o matriculados 
--no 3� os alunos com status APROVADO. 
--� Para fazer o teste, matricule ao menos 10 alunos em cada turma e aprove 70% dos alunos de cada turma

create database dbEtecMtec

use dbEtecMtec

create table tb2A(
	RM int primary key,
	nomeAluno varchar(40),
	status varchar(10),
)

create table tb2B(
	RM int primary key,
	nomeAluno varchar(40),
	status varchar(10),
)

create table tb3(
	RM int primary key,
	nomeAluno varchar(40),
	status varchar(10),
)

select * from tb2A
select * from tb2B
select * from tb3