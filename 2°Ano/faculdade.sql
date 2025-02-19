create database dbFaculdade

use dbFaculdade

create table tbCampus(
    idCampus int primary key indentity (1,1),
    cursos varchar(100) not null,
    )

create table tbCursos (
    idCurso int primary key indentity (1,1),
    )

create table tbAluno (
    idAluno int primary key indentity (1,1),
    nomeAluno varchar(100) not null,
    idCurso int foreign key references tbCursos (idCurso),
    )

create table tbDiciplina(
    idDiciplina int primary key indentity (1,1),
    )

create table tbDis_Curso(
    idDis_Curso int primary key indentity (1,1),
    idCurso int foreign key references tbCursos (idCurso),
    idDiciplinas int foreign key references tbDiciplinas (idDiciplinas),
    )

create table tbProfessor (
    idProfessor int primary key indentity (1,1),
    NomeProf varchar(50) not null, 
    )

create table tbProfessorDiciplina(
    idProfessorDiciplina int primary key indentity (1,1),
    idDiciplina int foreing key references tbDiciplina (idDiciplina)
    idProfessor int foreing key references tbProfessor (idProfessor)
    )

create table tbTurma(
    idTurma int primary key indentity (1,1),
    AnoForma smalldatetime not null,
    NSala int not null,
    )

create table tbTurma_Prof(
    idTurma_Prof int primary key indentity (1,1),
    idProfessor int foreing key references tbProfessor (idProfessor),
    idTurma int foreign key references tbTurma (idTurma),
    )