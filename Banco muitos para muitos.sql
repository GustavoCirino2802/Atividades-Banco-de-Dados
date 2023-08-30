create database muitos_para_muitos;
use muitos_para_muitos;
create table estudantes(
	id_estudante int not null,
    nome_estudante varchar (40) not null,
    primary key (id_estudante)
);

create table disciplinas(
	id_disciplina int not null,
	nome_disciplina int not null,
    primary key (id_disciplina)
);

insert into estudantes
	(id_estudante, nome_estudante)
values
('1', 'Miguel'),
('2', 'Pelé'),
('3', 'Rodrigo');

select * from estudantes;

create table estudante_notas(
	id_estudante int not null,
    id_disciplina int not null,
    nota decimal(3,1),
	foreign key (id_estudante) references estudantes(id_estudante),
    foreign key (id_disciplina) references disciplina(id_disciplina)
    );

desc estudantes;



 