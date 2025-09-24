--• Criar uma função que retorne o dia de semana da venda (no formato 
--segunda, terça, etc) ao lado do código da venda, valor total da venda 
--e sua data
create function fc_diaVenda(@Data date)
returns varchar (40) as
begin

declare @DiaVenda varchar(40)
declare @Dia int

set @Dia=DATEPART(dw, @Data)

if @Dia=1
	begin
		set @DiaVenda = 'Domingo'
	end

if @Dia=2
	begin
		set @DiaVenda = 'Segunda'
	end

if @Dia=3
	begin
		set @DiaVenda = 'terca'
	end

if @Dia=4
	begin
		set @DiaVenda = 'quarta'
	end

if @Dia=5
	begin
		set @DiaVenda = 'quinta'
	end

if @Dia=6
	begin
		set @DiaVenda = 'sexta'
	end

if @Dia=7
	begin
		set @DiaVenda = 'sabado'
	end

	return @DiaVenda
	end

--• Criar uma função que receba o código do cliente e retorne o total de 
--vendas que o cliente já realizou
 

--• Criar uma função que receba o código de um vendedor e o mês e 
--informe o total de vendas do vendedor no mês informado


--• Criar uma função que usando o bdEstoque diga se o CNPJ do 
--fornecedor é ou não válido

select bdEstoque.dbo.CNPJ_VALIDO(cpfCliente) from tbFornecedor
use bdEstoque
go
CREATE FUNCTION CNPJ_VALIDO(@CPF VARCHAR(14))
RETURNS CHAR(1)
AS
BEGIN
DECLARE @INDICE INT,
@SOMA INT,
@DIG1 INT,
@DIG2 INT,
@CPF_TEMP VARCHAR(14),
@DIGITOS_IGUAIS CHAR(1),
@RESULTADO CHAR(1)
SET @RESULTADO = 'N'
/*
Verificando se os digitos são iguais
A Principio CPF com todos o números iguais são Inválidos
apesar de validar o Calculo do digito verificado
EX: O CPF 00000000000 é inválido, mas pelo calculo
Validaria
*/
SET @CPF_TEMP = SUBSTRING(@CPF,1,1)
SET @INDICE = 1
SET @DIGITOS_IGUAIS = 'S'
WHILE (@INDICE <= 14)
BEGIN
    IF SUBSTRING(@CPF,@INDICE,1) <> @CPF_TEMP
SET @DIGITOS_IGUAIS = 'N'
SET @INDICE = @INDICE + 1
END;
--Caso os digitos não sejão todos iguais Começo o calculo do digitos
IF @DIGITOS_IGUAIS = 'N' 
BEGIN
--Cálculo do 1º dígito
SET @SOMA = 0
SET @INDICE = 1
WHILE (@INDICE <= 9)
BEGIN
SET @Soma = @Soma + CONVERT(INT,SUBSTRING(@CPF,@INDICE,1)) * (11 - @INDICE);
SET @INDICE = @INDICE + 1
END
SET @DIG1 = 11 - (@SOMA % 11)
IF @DIG1 > 9
SET @DIG1 = 0;
-- Cálculo do 2º dígito }
SET @SOMA = 0
SET @INDICE = 1
WHILE (@INDICE <= 10)
BEGIN
SET @Soma = @Soma + CONVERT(INT,SUBSTRING(@CPF,@INDICE,1)) * (12 - @INDICE);
SET @INDICE = @INDICE + 1
END
SET @DIG2 = 11 - (@SOMA % 11)
IF @DIG2 > 9
SET @DIG2 = 0;
-- Validando
    IF (@DIG1 = SUBSTRING(@CPF,LEN(@CPF)-1,1)) AND (@DIG2 = 
SUBSTRING(@CPF,LEN(@CPF),1))
SET @RESULTADO = 'S'
ELSE
SET @RESULTADO = 'N'
END
RETURN @RESULTADO
END