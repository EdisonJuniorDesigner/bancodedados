create database bancario;
use bancario;

create table cidade(
	codcidade smallint not null auto_increment,
    nome varchar(60) not null,
    primary key (codcidade));

create table cliente(
	cpf varchar (20) not null primary key,
    nome varchar(60) not null,
    enderco varchar (80) not null,
    telefone varchar (20) not null);

create table agencia (
	codagencia varchar (15) not null primary key,
    nome varchar (40) not null,
    endereco varchar (80) not null,
    codcidade smallint not null,
    foreign key (codcidade) references cidade (codcidade));

create table conta(
		num_conta smallint not null primary key,
        saldo double not null,
        codagencia varchar (15) not null,
        cpf varchar (20) not null,
        foreign key (codagencia) references agencia (codagencia),
        foreign key (cpf) references cliente (cpf));