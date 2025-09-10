USE bdEstoque

create function fc_diaSemana(@Data date)
returns varchar (40) as
begin

declare @DiaSemana varchar(40)
declare @Dita int

set @Dia=DATEPART(DW, @Data)

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