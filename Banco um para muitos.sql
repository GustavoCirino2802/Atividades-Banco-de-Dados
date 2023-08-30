create database um_para_muitos;
use um_para_muitos;
create table funcionarios(
	id_funcionario int not null,
    nome_funcionario varchar(40) not null,
    cargo varchar(20),
    primary key (id_funcionario)
    );
    
create table dependentes(
	id_dependente int not null,
	id_funcionario int not null,
	nome_dependente varchar(40) not null,
    parentesco enum('Filho', 'Filha', 'Cônjuge'),
    primary key (id_dependente),
    foreign key (id_funcionario) references funcionarios(id_funcionario)
    );
    
insert into funcionarios 
	(id_funcionario, nome_funcionario, cargo)
values
('1', 'Marcelo', 'Auxiliar'),
('2', 'Roberto', 'Gerente'),
('3', 'Hugo', 'Tecnico');
select * from funcionarios;

insert into dependentes
	(id_dependente, id_funcionario, nome_dependente, parentesco)
values
	('1', '1', 'Sonia', 'Cônjuge'),
    ('2', '1', 'Ana', 'Filha'),
    ('3', '1', 'Pedro', 'Filho'),
    ('4', '2', 'Beatriz', 'Cônjuge');
    
    select * from dependentes;
    
    desc dependentes;
    desc funcionarios;