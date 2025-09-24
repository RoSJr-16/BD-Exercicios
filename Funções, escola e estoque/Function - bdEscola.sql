-- Crie uma fun��o que informada uma data da matr�cula , retorne o dia da semana.
USE bdEscolaIdiomas
go

create function fc_diaSemanaEsco(@Data date)
returns varchar (40) as
begin

declare @DiaSemana varchar(40)
declare @Dia int

set @Dia=DATEPART(dw, @Data)

if @Dia=1
	begin
		set @DiaSemana = 'Domingo'
	end

if @Dia=2
	begin
		set @DiaSemana = 'Segunda'
	end

if @Dia=3
	begin
		set @DiaSemana = 'terca'
	end

if @Dia=4
	begin
		set @DiaSemana = 'quarta'
	end

if @Dia=5
	begin
		set @DiaSemana = 'quinta'
	end

if @Dia=6
	begin
		set @DiaSemana = 'sexta'
	end

if @Dia=7
	begin
		set @DiaSemana = 'sabado'
	end

	return @DiaSemana
	end

	select dataMatricula as 'Data da Matricula', DiaDaSemana = dbo.fc_diaSemanaEsco(dataMatricula) from tbMatricula

--Crie uma fun��o que de acordo com a carga hor�ria do curso exiba 
--curso r�pido ou curso extenso. (R�pido menos de 1000 horas).
create function fc_CagaHoraria(@Horaria varchar (10))
returns varchar (15) as
begin
	
	declare @Resu varchar (20)

	if @Horaria < 1000
	begin
		set @Resu = 'R�pido'
	end

	else
	begin
		set @Resu = 'Curso Extenso (n�o fa�a)'
	end

	return @Resu

end

	SELECT codCurso, dbo.fc_CagaHoraria(cargaHorariaCurso) AS 'Tipo de Curso' FROM tbCurso

--Crie uma fun��o que de acordo com o valor do curso exiba  curso 
--caro ou curso barato. (Curso caro acima de 400).
create function fc_CustoCurso(@CodValor int)
returns varchar (30) as
begin
	
	declare @Valor money
	declare @Resu varchar (20)

	if @Valor > 400
	begin
		set @Resu = 'Caro'
	end

	else
	begin
		set @Resu = 'Barato'
	end

	return @Resu

end


	select codCurso AS 'Valor', resu = dbo.fc_CustoCurso(codCurso) from tbCurso

--Criar uma fun��o que informada a data da matr�cula converta-a no 
--formato dd/mm/aaaa.
create function fc_Matri(@data smalldatetime)
returns varchar (10) as
begin
	
	declare @Resu varchar(15)
	set @Resu = convert (varchar(10), 103) 

	return @Resu

end

	select codAluno, dbo.fc_Matri(dataMatricula) as 'Data da Matricula' from tbMatricula

