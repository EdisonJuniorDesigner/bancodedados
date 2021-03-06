create database oficina;
use oficina;

create table cliente(
	codcliente varchar (20) not null primary key,
    nome varchar(65) not null,
    endereco varchar (80) not null,
    telefone varchar (20) not null);

create table pecas(
	codpeca smallint not null primary key,
    nome varchar(65) not null,
    preco_unitario real not null,
    quantidade smallint not null);

create table veiculo(
	placa varchar (20) not null primary key,
    marca varchar (20) not null,
    modelo varchar (20) not null,
    ano smallint not null,
    cor varchar(20) not null,
    codcliente varchar (20) not null,
    foreign key (codcliente) references cliente (codcliente));
    
create table servicos(
	codservico smallint not null primary key,
    defeito varchar (20),
    dataentrada varchar(20) not null,
    datasaida varchar(20) not null,
    placa varchar (20) not null,
    preco real not null,
    foreign key (placa) references veiculo (placa));
    
create table mao_de_obra(
	codmao_de_obra smallint not null primary key,
    especialidade varchar(35) not null,
    valor real not null);
    
create table pecasXservicos(
	pecaxservico int not null primary key,
	codpeca smallint not null,
    codservico smallint not null,    
    foreign key(codpeca) references pecas(codpeca),
    foreign key(codservico) references servicos(codservico));
    
create table servicosXmao_de_obra(
	servicoxmao_de_obra int not null primary key,
	codservico smallint not null,
    codmao_de_obra smallint not null,
    foreign key(codservico) references servicos(codservico),
    foreign key(codmao_de_obra) references mao_de_obra(codmao_de_obra));
    
insert into cliente(codcliente, nome, endereco, telefone)values('4441','Michael','Rua Antonio Braga, nª 35','(21)3554-8564'),('4442','Alan','Rua Oliver Teixeira, nª 65','(21)3784-8521');
insert into pecas(codpeca, nome, preco_unitario, quantidade)values(1,'Mola',150,50),(2,'Câmbio',2500,20),(3,'Bomba de combstível',320,30);
insert into veiculo(placa, marca, modelo, ano, cor, codcliente)values('HGK-1777','Honda','Civic',2018,'Prata','4441'),('KHK-1457','Ford','Fusion',2018,'Preto','4441'),('LYU-1210','Fiat','Argo',2017,'Branco','4442');
insert into servicos(codservico,defeito,dataentrada,datasaida,placa,preco)values(1,'mola quebrada','20-01-2019','22-01-2019','HGK-1777',800),(2,'Câmbio danificado','18-01-2019','21-01-2019','KHK-1457',3500),(3,'Bomba quebrada','20-01-2019','26-01-2019','LYU-1210',900);
insert into mao_de_obra(codmao_de_obra, especialidade, valor)values(1,'Lanterneiro',300),(2,'Pintor',500),(3,'Mecânico',800);
 
insert into pecasXservicos values (1, 1, 1);
insert into pecasXservicos values (2, 2, 2);
insert into pecasXservicos values (3, 3, 3);

insert into servicosXmao_de_obra values (1, 1, 1);
insert into servicosXmao_de_obra values (2, 2, 2);
insert into servicosXmao_de_obra values (3, 3, 3);

select distinct p.nome,p.quantidade,p.preco_unitario,s.preco,mm.valor, s.preco+mm.valor+p.preco_unitario as Orcamento from
servicos s join servicosXmao_de_obra m on
s.codservico = m.codservico
join mao_de_obra mm on
s.codservico = mm.codmao_de_obra
join pecas p join pecasXservicos on
p.codpeca != pecasXservicos.codservico
and p.codpeca=551 and mm.codmao_de_obra=1;

select * from pecasXservicos;
    
    
    
    
    
    