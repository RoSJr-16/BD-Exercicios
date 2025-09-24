CREATE DATABASE  bdEscolaIdiomas
GO

USE bdEscolaIdiomas


CREATE TABLE tbAluno(
	codAluno int PRIMARY KEY IDENTITY(1,1),
	nomeAluno varchar(50),
	dataNascAluno date,
	rgAluno varchar(12),
	naturalidadeAluno varchar(2)
	
);


CREATE TABLE tbCurso(
	codCurso int PRIMARY KEY IDENTITY(1,1),
	nomeCurso varchar(30),
	cargaHorariaCurso INT,
	valorCurso money,
);

CREATE TABLE tbTurma(
	codTurma int PRIMARY KEY IDENTITY(1,1),
	nomeTurma varchar(50),
	codCurso INT FOREIGN KEY REFERENCES tbCurso(codCurso),
	horarioTurma SMALLDATETIME
);

CREATE TABLE tbMatricula(
	codMatricula int PRIMARY KEY IDENTITY(1,1),
	dataMatricula SMALLDATETIME,
	codAluno INT FOREIGN KEY REFERENCES tbAluno(codAluno),
	codTurma INT FOREIGN KEY REFERENCES tbTurma(codTurma)
);

------------executei até aqui ----------------------

INSERT INTO tbAluno(nomeAluno, dataNascAluno, rgAluno, naturalidadeAluno)
	VALUES  ('Paulo Santos','2000-03-10', '82.282.122-0', 'SP'),
			('Maria da Gloria','1999-10-03', '45.233.123-0', 'SP'),
			('Pedro Nogueira da Silva','1998-04-04', '23.533.211-9', 'SP'),
			('Gilson Barros da Silva','1995-09-09', '34.221.111-x', 'PE'),
			('Mariana Barbosa Santos','2001-10-10', '54.222.122-9', 'RJ'),
			('Alessandro Pereira','2003-10-11', '24.402.454-9', 'ES'),
			('Aline Melo','2001-10-08', '88.365.012-3', 'RJ');

INSERT INTO tbCurso(nomeCurso,cargaHorariaCurso,valorCurso)
	VALUES  ('Inglês','2000',356.00),
			('Alemão','3000',478.00),
			('Espanhol','4000',500.00);

INSERT INTO tbTurma(nomeTurma,codCurso,horarioTurma)
	VALUES  ('1|A',1,'1900-01-01 12:00:00'),
			('1|B',3,'1900-01-01 18:00:00'),
			('1|C',1,'1900-01-01 18:00:00'),
			('1|AA',2,'1900-01-01 19:00:00');

INSERT INTO tbMatricula(dataMatricula,codAluno,codTurma)
	VALUES  ('2015-10-03',1,1),
			('2014-05-04',2,1),
			('2014-05-04',3,4),
			('2012-05-03',4,2),
			('2016-05-03',5,3),
			('2015-05-07',6,2),
			('2015-07-05',7,3);

SELECT * FROM tbAluno
SELECT * FROM tbCurso
SELECT * FROM tbTurma
SELECT * FROM tbMatricula

--Liçao--

--1. Criar uma stored procedure “Busca_Aluno” que receba o código do aluno e retorne seu nome e data de nascimento.--
CREATE PROCEDURE spBusacaAluno
@codAluno int
AS
BEGIN
	
		IF NOT exists (SELECT codAluno FROM tbAluno where codAluno = @codAluno)
		BEGIN
			print ('o aluno não foi encontrado' )
		END
		ELSE
		BEGIN
			SELECT nomeAluno, dataNascAluno FROM tbAluno WHERE codAluno = @codAluno
		END
END

SELECT * FROM tbAluno

EXEC spBusacaAluno 100

--2. Criar uma stored procedure “Insere_Aluno” que insira um registro na tabela de Alunos, verificando pelo cpf se o aluno já existe ou não

CREATE PROCEDURE spInsereAluno
@nomeAluno varchar(100),
@rgAluno varchar(12)
AS
BEGIN
	DECLARE @codAluno int
		IF exists (select rgAluno FROM tbAluno WHERE rgAluno like @rgAluno)
	BEGIN
		PRINT('não é possivel a açao pos o RG' +@rgAluno+ 'ja existe!')
	END
	ELSE 
	BEGIN
		INSERT tbAluno(nomeAluno, rgAluno) values
					(@nomeAluno, @rgAluno)
		set @codAluno = (SELECT MAX(codAluno) FROM tbAluno)
		PRINT ('Aluno' +@nomeAluno+ 'cadastrado com sucesso com codigo'+convert(varchar(5), @codAluno) )
	END
END

EXEC spInsereAluno 'Paulo Santos', '82.282.122-0'

--3. Criar uma stored procedure “Aumenta_Preco” que, dados o nome do
--curso e um percentual, aumente o valor do curso com a porcentagem
--informadaCREATE PROCEDURE spAumenta_Preco--4. Criar uma stored procedure “Exibe_Turma” que, dado o nome da turma
--exiba todas as informações dela.

CREATE PROCEDURE spExibe_Turma4
@nomeTurma varchar(50)
as
begin
	if not exists (select codTurma from tbTurma where codCurso = @nomeTurma)
	begin
		print ('Esses sao os alunos')
	end
	begin
		select codTurma, codCurso, horarioTurma from tbTurma where codTurma = @nomeTurma
		set @nomeTurma = (SELECT MAX(codAluno) FROM tbAluno)
		PRINT (convert(varchar(5), @nomeTurma) )
END

end

EXEC spExibe_Turma2'1|B'


--5. Criar uma stored procedure “Exibe_AlunosdaTurma” que, dado o nome
--da turma exiba os seus alunos.
CREATE PROCEDURE spExibe_AlunosdaTurma
@nomeTurma varchar(50)
as
begin
	if not exists (select codTurma from tbTurma where codCurso = @nomeTurma)
	