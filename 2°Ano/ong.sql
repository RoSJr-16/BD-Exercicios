create database ONG

use ONG

create table tbDoenca(
    codDoenca int indentity (1,1),
    nomeDoenca varchar(50) not null,
    cid char(6) not null
    )

create table tbStatusCrianca(
    codStatusCrianca int primary key indentity (1,1),
    descricaoStatus varchar(100) not null,
    )

create table tbCrianca(
    codCrianca INT primary key indentity (1,1),
    nomeCrianca varchar(100) not null,
    dtNascCrianca smalldatetime not null, 
    sexoCrianca varchar(10) not null,
    codStatusCrianca int foreing key references tbStatusCrianca (codStatusCrianca)
    )


create table tPadrinho(
    codPadrinho int primary key indentity (1,1),
    nomePadrinho varchar(100) not null,
    cpfPadrinho char(11) not null,
    )

create table tbApadrinhamento(
    codApadrinhamento int primary key indentity (1,1),
    codCrianca int foreing key references tbCrianca (codCrianca),
    codPadrinho foreing key references tbPadrinho (codPadrinho),
    dataApadrinhamento smalldatetime not null,
    )

create table tbProntuarioDoenca(
    codProntuarioDoenca int primary key indentity (1,1),
    codProntuario int foreing key references tbProntuario (codProntuario),
    codDoenca int foreing key references tbDoenca (codDoenca),
    dataAcometimento smalldatetime not null,
)

create table tbProntuario(
    codProntuario int primary key indentity (1,1),
    codCrianca int foreing key references tbCrianca (tbCrianca),
    obsProntuarios varchar (100) not null,
)

create table tbGenitor(
    codGenitor int primary key indentity (1,1),
    nomeGenitor varchar(100) not null,
    cptGenitor char(11) not null,
)

create table tbFilicao(
    codFilicao int primary key indentity (1,1),
    codCrianca int foreing key references tbCrianca (tbCrianca),
    codGenitor int foreing key references tbGenitor (tbGenitor),
)


create table tbObservacaoCrianca(
    codObsCrianca int primary key indentity (1,1),
    codCrianca int foreing key references tbCrianca (tbCrianca),
    observacaoCrianca varchar(100) not null,
    dataObservacao smalldatetime not null,
)

