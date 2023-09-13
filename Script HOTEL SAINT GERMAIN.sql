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
	DtaCadastro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP(), 
	Tipo INT CHECK(Tipo IN(1, 2))
);

/*Criação da Tabela "Reserva"*/

create table reserva(
	NumReserva INT PRIMARY KEY,
	IdCliente INT,
	DataHora DATETIME NOT NULL,
	Periodo TINYINT NOT NULL,
	FOREIGN KEY(idCliente)
		REFERENCES Cliente(idCliente)
);

/*Criação da Tabela "Telefone"*/

create table Telefone(
	Numero VARCHAR (20),
    idCliente INT,
    PRIMARY KEY (Numero, idCliente),
    FOREIGN KEY (idCliente)
		REFERENCES Cliente(idCliente)
);

/*Criação da Tabela "Ocupacao"*/

create table Ocupacao(
	numReserva INT PRIMARY KEY,
	Entrada DATETIME, Saida DATETIME,
	FOREIGN KEY (numReserva)
		REFERENCES RESERVA(numReserva)
);

/*Criação da Tabela "Restaurante"*/

CREATE TABLE Restaurante (
    idRestaurante INT PRIMARY KEY,
    Prato VARCHAR(50),
    Preco DECIMAL(5 , 2 )
);

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

describe cliente;

/*Comando ALTER TABLE tem a função de mudar algo em uma tabela ja criada*/

ALTER TABLE Cliente
	ADD Profissao VARCHAR (30) NOT NULL, /* Nesse caso esta sendo adicionada o campo "Profissao" na tabela Cliente*/
    ADD Obs VARCHAR (500);
    

