create database dbDistribuidora;
use dbDistribuidora;

create table tbCliente(
CPF bigint primary key,
Nome varchar(50) not null,
Sexo char(1) not null,
Endereco varchar(50) not null,
Email varchar(50) not null
);

create table tbJuridica(
CNPJ char(14) primary key,
Nome varchar(50) not null,
Endereco varchar(50) not null,
Telefone int not null,
Email varchar(50) not null
);

create table tbFornecedor(
IdForn int primary key,
Nome varchar(50) not null,
CNPJ char(14),
Endereco varchar(50),
Telefone int not null,
Email varchar(50) not null

);

create table tbCompra(
IdForn int not null,
IdProd int not null,
ValorCompra ,
QntCompra 

);

create table tbProduto(
IdProd int primary key,
NomeProd varchar(50) not null,
Qnt int not null,
Valor float
);

create table tbPedido(

);

create table tbVenda(
Relatorio date,




);


create table tbNotaFiscal(
IdNota

);

create table tbRelatorio(
DataEmissao date
);


-- FKS
alter table tbVenda add constraint FK_Relatorio_tbVenda foreign key (Relatorio) references tbCompra(Relatorio); -- RELATORIO 
alter table tbVenda add constraint FK_NotaFiscal_tbVenda foreign key (NotaFiscal) references tbCliente(Pe); -- RELATORIO 

alter table tbHistorico add constraint FK_NumeroConta_tbHistorico foreign key (NumeroConta) references tbConta(NumeroConta);



