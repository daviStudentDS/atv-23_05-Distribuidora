create database dbDistribuidora;
use dbDistribuidora;

create table tbCliente(
NomeCLi varchar(200) ,
CPF char(11) not null,
CNPJ char(14) not null,
Id int primary key,
CEP char(8) not null,
CompraEnd varchar(50) not null
);
select * from tbcliente;

create table tbJuridica(
CNPJ char(14) primary key,
IE int unique
);
select * from tbJuridica;
create table tbFisica(
CPF char primary key,
RG char(9) not null,
RG_Dig char(1) not null,
DataNasc date 
);


create table tbFornecedor(
IdForn int primary key auto_increment,
Nome varchar(50) not null,
CNPJ char(14) unique,
Endereco varchar(50),
Telefone int not null,
Email varchar(50) not null
);
select * from tbfornecedor;																	

create table tbCompra(
NotalFiscal int primary key,
Nome varchar(200) not null,
QtdTotal int, 
CodProd int,
CodItme int no null
foreign key (CodProd) references tbproduto(CodProd),
foreign key (CodItem) references tbItem(CodItem)
);

select * from tbproduto;

create table tbProduto(
NomeProd varchar(50) not null,
CodBarras bigint not null,
ValorUnitario float not null,
Qtd bigint not null
);

select * from
create table tbItem (
QtdItem int,
ValorUni decimal(2),
CodFornec int,
CodItem varchar(30) primary key,
FOREIGN KEY (CodFornec) references tbfornecedor(CodFornec)
);

create table tbVenda(
dataVenda date,
CodCli int,
CodVenda int primary key,
FOREIGN KEY (CodCli) references tbcliente(CodCli)
);

create table Endereco(
CEP varchar(50) primary key,
CodBairro int,
CodCidade int,
CodUF int,
CompEnd varchar(20),
Logradouro varchar(200),
foreign key (CodBairro) references tbBairro(CodBairro),
foreign key (CodCidade) references tbCidade(CodCidade),
foreign key (CodUF) references tbUF(CodUF)
);
create table tbBairro(
CodBairro int primary key auto_increment,
NomeBairro varchar(200)
);

create table tbCidade( -- -6
CodCidade int primary key auto_increment,
NomeCid varchar(200)
);

create table tbUF(
CodUF int primary key auto_increment,
NomeUF varchar(200)
);

create table tbNotaFiscal(
NF int primary key,
TotalNota float not null,
DataEmissao date not null
);


-- FKS
alter table tbVenda add constraint FK_Relatorio_tbVenda foreign key (Relatorio) references tbCompra(Relatorio); -- RELATORIO 
alter table tbVenda add constraint FK_NotaFiscal_tbVenda foreign key (NotaFiscal) references tbCliente(Pe); -- RELATORIO 

alter table tbHistorico add constraint FK_NumeroConta_tbHistorico foreign key (NumeroConta) references tbConta(NumeroConta);

