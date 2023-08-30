create database um_pra_um; 
use um_pra_um;

/*Tabela "maridos" abaixo:*/    /*not null: Não pode ficar em branco*/    /*null: Pode ficar em branco*/

	create table maridos(
    id_marido int not null,
    nome_marido varchar (40) not null,
	data_nascimento date,
	primary key (id_marido)
);

/*Tabela "esposas" abaixo:*/

	create table esposas(
    id_esposa int not null, id_marido int not null unique,
	nome_esposa varchar (40) not null,
    data_nascimento date,
    primary key (id_esposa), foreign key(id_marido) 
    references maridos (id_marido)
);

desc maridos;
desc esposas;

/*Inserir informações para dentro das tabelas*/

insert into maridos 
(id_marido, nome_marido, data_nascimento)
values
	('1', 'Marcelo', '1969-03-02'),
	('2', 'Antonio', '1977-12-30'),
    ('3', 'Pedro', '1992-06-25');

select * from maridos;

insert into esposas
(id_esposa, id_marido, nome_esposa, data_nascimento)
values
('1', '1', 'Sonia', '1973-03-28'),
('2', '2', 'Ana', '1981-11-15');

insert into esposas
(id_esposa, id_marido, nome_esposa, data_nascimento)
values
('3', '3', 'Beatriz', '1973-03-28');

select * from esposas;



