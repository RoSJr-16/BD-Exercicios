-- Crie uma função que informada uma data da matrícula , retorne o dia da semana.
USE bdEscolaIdiomas

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

	drop function dbo.fc_diaSemana

	select datamatricula as 'Data da Matricula'
	DiaDaSemana = dbo.fc_diaSemana(dataMatricula) from tbMatricula

--Crie uma função que de acordo com a carga horária do curso exiba 
--curso rápido ou curso extenso. (Rápido menos de 1000 horas).

alter function fc_CagaHoraria(@Tempo varchar (10))
returns varchar (10) as
begin
	
	declare @CargaC varchar(10) set @CargaC = (select cargaHorariaCurso from tbCurso)
	declare @TempoC varchar(10)

	

	if @CargaC > 1000
	begin
		set @TempoC = 'Rápido'
	end

	return @TempoC

end


	select cargaHorariaCurso as 'Horas',
	CargaC = dbo.fc_CagaHoraria(cargaHorariaCurso) from tbCurso

--Crie uma função que de acordo com o valor do curso exiba  curso 
--caro ou curso barato. (Curso caro acima de 400).
create function fc_Custo(@Valor int)
returns int as
begin
	
	declare @ValorC int set @ValorC = (select valorCurso from tbCurso)
	declare @Custo int

	if @ValorC < 400
	begin
		set @Custo = 'Caro'
	end

	return @Custo

end


	select valorCurso as 'Valor',
	Custo = dbo.fc_Custo(valorCurso) from tbCurso

--Criar uma função que informada a data da matrícula converta-a no 
--formato dd/mm/aaaa.
create function fc_Matri(@Matri date)
returns varchar (10) as
begin
	
	declare @MatriD varchar (10) = (select dataMatricula from tbMatricula)
	declare @Custo int

	if @ValorC < 400
	begin
		set @Custo = 'Caro'
	end

	return convert (varchar(10, @MatriD, 103)

end

