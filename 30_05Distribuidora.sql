
create database dbbanco;

use dbbanco;

create table tbcompra( -- Recebo do fornecedor (Compra dp forn.) -1
	CodProd int,
	CodItem varchar(30),
	FOREIGN KEY (CodProd) references tbproduto(CodProd),
	FOREIGN KEY (CodItem) references tbItem(CodItem)
);

create table tbItem( -- - 2
	QtdItem int,
	ValorUni decimal(2),
    CodFornec int,
	CodItem varchar(30) primary key,
    FOREIGN KEY (CodFornec) references tbfornecedor(CodFornec)
);

-- Cliente que realizou a compra + O produto / item que foi comprado

drop table tbvenda;

create table tbvenda(
    dataVenda date,
    CodCli int,
    CodVenda int primary key,
    FOREIGN KEY (CodCli) references tbcliente(CodCli)
);

drop table tbvenda;

create table tbnotafiscal( -- -9
	CodVenda int,
    CodProd int,
    nf int primary key,
	Foreign key (CodVenda) references tbvenda(CodVenda),
    Foreign key (CodProd) references tbproduto(CodProd)
);

drop table tbnotafiscal;

create table tbproduto( -- O produto em si -4
	NomeProd varchar(30),
	descricao varchar(50),
	CodProd int primary key
);

select * from tbproduto;

create table tbcliente( -- O cliente -5
	Nome varchar(50),
    CodCli int primary key,
	Cpf varchar(50),
	Cnpj varchar(50),
	Logradouro varchar(30),
    CEP varchar(50),
	foreign key (Cpf) references tbcliente_pf(Cpf),
	foreign key (Cnpj) references tbcliente_pj(Cnpj),
    foreign key (CEP) references tbendereco(CEP)
);

drop table tbcliente;

create table tbendereco(
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

drop table tbcliente;
drop table tbendereco;

create table tbBairro(
	CodBairro int primary key,
    NomeBairro varchar(30)
);

create table tbCidade( -- -6
	CodCidade int primary key,
	NomeCid varchar(30)
);

create table tbUF(
	CodUF int primary key,
    NomeUF varchar(30)
);

create table tbcliente_pf( -- -7
	Cpf varchar(30) primary key,
	rg varchar(30),
	datanasc date
);

create table tbcliente_pj( -- -8
	Cnpj varchar(30) primary key,
	IE int unique -- Inscrição Estadual
);

-- Nota Fiscal & Venda

create table tbfornecedor( -- -10
	Nome varchar(50),
	CNPJ varchar(20),
	Endereco varchar(50),
    CodFornec int primary key
);
