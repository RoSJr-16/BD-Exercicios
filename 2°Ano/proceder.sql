select * from tbMotorista
select * from tbVeiculo
select * from tbMultas

--1-	Criar 3 procedures para inserir  
--motoristas, ve�culos e multas. N�o ser� possivel:

--�	inserir um motorista duplicado, 
--�	inserir um ve�culo para um motorista  que n�o existe 
--�	inserir uma multa para um ve�culo n�o cadastrado.

--Ao inserir o ve�culo � passado os dados do ve�culo e o cpf do motorista a quem o ve�culo pertence
--Ao inserir as multas dever� ser passada a data,  hora e a placa do ve�culo

--1
alter PROCEDURE spInsereMotorista
@idMotorista int,
@nomeMotorista varchar(100),
@dataNascimentoMotorista smalldatetime,
@cpfMotorista varchar(20),
@CNHMotorista varchar(9),
@pontuacaoAcumulada int
AS
BEGIN
	if exists (select cpfMotorista from tbMotorista where cpfMotorista like @cpfMotorista)
		print ('J� existe esse motorista')
		else
	begin
		insert into tbMotorista
		(idMotorista, nomeMotorista, dataNascimentoMotorista, cpfMotorista, CNHMotorista, pontuacaoAcumulada) values
		(@idMotorista, @nomeMotorista, @dataNascimentoMotorista, @cpfMotorista, @CNHMotorista, @pontuacaoAcumulada)
		set @idMotorista = (select max(idMotorista) from tbMotorista)
		print ('motorista ' + @nomeMotorista + ' foi cadastrado' + convert(varchar(5), @idMotorista) )
	end
end
exec spInsereMotorista 9, 'Mano bRown', '03/03/1989', '098.654.210.90', '5555', 5

--2
alter PROCEDURE spInsereVeiculo
@idVeiculo int,
@modeloVeiculo varchar(50),
@placa varchar(10),
@renavam varchar(10),
@anoVeiculo smalldatetime,
@idMotorista int
AS
BEGIN
	if exists (select cpfMotorista from tbMotorista where cpfMotorista like @idMotorista)
		print ('N�o existe um motorista')
		else
	begin
		insert into tbVeiculo
		(idVeiculo, modeloVeiculo, placa, renavam, anoVeiculo, idMotorista) values
		(@idVeiculo,  @modeloVeiculo, @placa, @renavam, @anoVeiculo, @idMotorista )
		set @idVeiculo = (select max(idVeiculo) from tbVeiculo)
		print ('Veiculo ' + @modeloVeiculo + ' foi cadastrado' + convert(varchar(5), @idVeiculo) )
		print (@idVeiculo + @modeloVeiculo + @placa + @renavam + @anoVeiculo)
	end
end

exec spInsereVeiculo 1, 'Kavazak', 'CFGI-09', '008.054.110.60', '05/03/1999', 9

--03
alter PROCEDURE spInsereMulta
@idMultas int,
@dataMulta smalldatetime,
@horaMulta time,
@pontosMulta int,
@idVeiculo int
AS
BEGIN
	if exists (select idVeiculo from tbVeiculo where idVeiculo like @idVeiculo)
		print ('N�o existe o veiculo')
		else
	begin
		insert into tbMultas
		(idMultas, dataMulta, horaMulta, pontosMulta, idVeiculo) values
		(@idMultas, @dataMulta, @horaMulta, @pontosMulta, @idVeiculo)
		set @idVeiculo = (select max(idVeiculo) from tbVeiculo)
		print ('Veiculo ' + @modeloVeiculo + ' foi cadastrado' + convert(varchar(5), @idVeiculo) )
		print (@idVeiculo + @modeloVeiculo + @placa + @renavam + @anoVeiculo)
	end
end

exec spInsereVeiculo 1, 'Kavazak', 'CFGI-09', '008.054.110.60', '05/03/1999', 9