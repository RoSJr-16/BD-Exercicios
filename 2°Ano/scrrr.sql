CREATE DATABASE bdTransito
USE bdTransito
 
CREATE TABLE tbMotorista(
idMotorista INT PRIMARY KEY,
nomeMotorista VARCHAR(50) NOT NULL,
dataNascimentoMotorista smalldatetime NOT NULL,
cpfMotorista VARCHAR(14) NOT NULL,
CNHMotorista VARCHAR(9) NOT NULL,
pontuacaoAcumulada	INT NOT NULL
);
 
CREATE TABLE tbVeiculo(
idVeiculo INT PRIMARY KEY,
modeloVeiculo VARCHAR(50) NOT NULL,
placa VARCHAR(7) NOT NULL,
renavam VARCHAR(11) NOT NULL,
anoVeiculo smalldatetime NOT NULL,
idMotorista INT FOREIGN KEY REFERENCES tbMotorista(idmotorista)
);
 
CREATE TABLE tbMultas(
idMultas INT PRIMARY KEY,
dataMulta smalldatetime NOT NULL,
horaMulta TIME NOT NULL,
pontosMulta INT NOT NULL,
idVeiculo INT FOREIGN KEY REFERENCES tbVeiculo(idVeiculo)
);