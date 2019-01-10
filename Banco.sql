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
					      
insert into cidade(nome)values('Belford Roxo'),('Nova Iguaçu');
insert into cliente(cpf, nome, enderco, telefone)values('887.856.547-96','Michael','Rua A','(21)3554-8564'),('997.456.877-26','Alana','Rua B','(21)3784-8521'),('255.451.354-87','Eduardo','Rua C','(21)2454-9464');
insert into agencia(codagencia, nome, endereco, codcidade)values('357','Agencia Nova Iguaçu','Rua Nova',2),('358','Agencia Belford Roxo','Rua Belford',1);
insert into conta(num_conta, saldo, codagencia, cpf)values(12,1500,'357','887.856.547-96'),(13,3000,'358','997.456.877-26'),(14,5000,'357','255.451.354-87');

******* Busca todos os dados de todos os campos em uma tabela***
select * from cidade;

select * from cliente;

select * from agencia;

select * from conta;

**** Pesquisar campos específicos******

select cpf,nome,telefone from cliente;


****** Apagar banco e tabelas****

drop database nome banco --> apaga um banco

drop table nometabela --> apaga uma tabela***


***** altera a estrutura de um campo na tabela****

alter table cliente modify nome varchar(65)not null;

alter table agencia modify codagencia smallint not null auto_increment;


obs.: quando alteramos um campo chave primária, é necessário desvincular as chaves
estrangeiras.
