/* Criacão de Banco De Dados- GUSTAVO CIRINO */
/* Criando DataBase */


create database Hotel_Saint_Germain;
use Hotel_Saint_Germain;


/* Criando a Tabela "Cliente" */
create table Cliente(
	idCliente INT PRIMARY KEY AUTO_INCREMENT,
	Nome VARCHAR (100) NOT NULL,
	CPF NUMERIC (11) UNIQUE NULL,
	Sexo CHAR (1),
	DataNasc DATETIME NOT NULL,
	Cidade VARCHAR (20) NULL,
	UF CHAR (2) DEFAULT 'PR',
	Pais VARCHAR (20) DEFAULT 'Brasil',
	DtaCadastro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP()
);

insert into Cliente(idCliente, Nome, CPF, Sexo, DataNasc, Cidade, UF, Pais)
values('1', 'Pedro Bier', '06445852344', 'M', '2005-05-16', 'Curitiba', 'PR','Brasil');
insert into Cliente(idCliente, Nome, CPF, Sexo, DataNasc, Cidade, UF, Pais)
values('2', 'Giovane Camargo', '45854896365', 'M', '2005-07-11', 'Curitiba', 'PR','Brasil');
insert into Cliente(idCliente, Nome, CPF, Sexo, DataNasc, Cidade, UF, Pais)
values('3', 'Gustavo Cirino', '13110449900', 'M', '2005-02-28', 'São José', 'PR','Brasil');
insert into Cliente(idCliente, Nome, CPF, Sexo, DataNasc, Cidade, UF, Pais)
values('4', 'Margarete Cirino', '52485694800', 'F', '1980-03-27', 'Curitiba', 'PR','Brasil');
insert into Cliente(idCliente, Nome, CPF, Sexo, DataNasc, Cidade, UF, Pais)
values('5', 'Fátima Mendes', '77005228987', 'F', '1974-02-11', 'Telemâco Borba', 'PR','Brasil');

select * from cliente; 
describe cliente;

/*Criação da Tabela "Reserva"*/
drop table reserva;
create table reserva(
	NumReserva INT PRIMARY KEY UNIQUE,
	IdCliente INT,
	DataHora DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP(),
	Periodo TINYINT NOT NULL,
	FOREIGN KEY(idCliente)
		REFERENCES Cliente(idCliente)
);

insert into reserva (numReserva, IdCliente, Periodo)
values('01', '1', '5');
insert into reserva (numReserva, IdCliente, Periodo)
values('02', '2', '14');
insert into reserva (numReserva, IdCliente, Periodo)
values('03', '3', '10');
insert into reserva (numReserva, IdCliente, Periodo)
values('04', '4', '4');
insert into reserva (numReserva, IdCliente, Periodo)
values('05', '5', '30');

select * from reserva;
describe reserva;

create table quarto(
	nroQuarto INT PRIMARY KEY NOT NULL UNIQUE,
    Andar INT NOT NULL,
    NumReserva INT UNIQUE,
    Tipo CHAR(1) NULL,
    Descricao  VARCHAR (100) NULL,
    vlrDiaria DECIMAL (6, 2),     /*DECIMAL REPRESENTA*/
    FOREIGN KEY (NumReserva)
		REFERENCES reserva(NumReserva)
    
);

insert into quarto(nroQuarto, Andar, NumReserva, Tipo, Descricao,vlrDiaria)
values('101', '1', '01', 'S', 'Single Window', '1000.00');
insert into quarto(nroQuarto, Andar, NumReserva, Tipo, Descricao,vlrDiaria)
values('201', '2', '02', 'T', 'Triple Bed', '1500.00');
insert into quarto(nroQuarto, Andar, NumReserva, Tipo, Descricao,vlrDiaria)
values('301', '3', '03', 'D', 'Double Window', '1200.00');
insert into quarto(nroQuarto, Andar, NumReserva, Tipo, Descricao,vlrDiaria)
values('401', '4', '04', 'T', 'Triple Bed', '1500.00');
insert into quarto(nroQuarto, Andar, NumReserva, Tipo, Descricao,vlrDiaria)
values('501', '5', '05', 'D', 'Double Bed', '1200.00');


	
select * from quarto;
describe quarto;

/*Criação da Tabela "Telefone"*/

create table Telefone(
	Numero VARCHAR (20),
    idCliente INT,
    PRIMARY KEY (Numero, idCliente),
    FOREIGN KEY (idCliente)
	REFERENCES Cliente(idCliente)
);

describe Telefone;

/*Criação da Tabela "Ocupacao"*/

create table Ocupacao(
	numReserva INT PRIMARY KEY,
    nroQuarto int,
	Entrada DATETIME,
    Saida DATETIME,
	FOREIGN KEY (nroQuarto) REFERENCES quarto (nroQuarto),
    FOREIGN KEY (numReserva) REFERENCES reserva (numReserva)

);

describe ocupacao;

/*Criação da Tabela "Restaurante"*/

create table Restaurante (
    idRestaurante INT PRIMARY KEY,
    Prato int,
    Preco DECIMAL(5 , 2 )
);

describe Restaurante;

/*Criação da Tabela "OcupRestaurante"*/

create table OcupRestaurante(
	numReserva INT,
    idRestaurante INT,
    DataHora DATETIME,
    Quantidade TINYINT,
    PRIMARY KEY (numReserva, idRestaurante, DataHora),
	FOREIGN KEY (numReserva)
		REFERENCES Reserva(numReserva),
	FOREIGN KEY (idRestaurante)
		REFERENCES Restaurante (idRestaurante)
);


describe ocuprestaurante;




/*Comando ALTER TABLE tem a função de mudar algo em uma tabela ja criada*/
ALTER TABLE Cliente
	ADD Profissao VARCHAR (30) NOT NULL, /* Nesse caso esta sendo adicionada o campo "Profissao" na tabela Cliente*/
    ADD Obs VARCHAR (500);
    

