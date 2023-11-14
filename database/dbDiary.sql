create database if not exists dbDiary;
drop database dbDiary;

use dbDiary;

create table Users(
	id int not null auto_increment primary key,
    name varchar(63) not null,
    email varchar(255) not null,
    password varchar(255) not null,
    photo varchar(127),
    biography varchar(511)
);

insert into Users (name, email, password, photo) 
values ('timas', 'timas@gmail', '123456', 'path'),
('mari', 'mari@hotmail', '123456', 'path'),
('Ana Silva', 'ana.silva@email.com', 'Senha1234', 'path'),
('Pedro Santos', 'pedro.santos@email.com', 'MinhaSenhaSegura', 'path'),
('Maria Oliveira', 'maria.oliveira@email.com', 'Acesso12345', 'path'),
('João Pereira', 'joao.pereira@email.com', 'Seguranca@2023', 'path'),
('Laura Fernandes', 'laura.fernandes@email.com', 'MeuAcessoPrivado', 'path');

drop table users;
select * from Users;

create table categories(
	id int not null auto_increment primary key,
    name varchar(63) not null,
    description varchar(255),
    fk_user int not null,
    
    foreign key(fk_user) references users(id)
);

insert into Categories (name, description, fk_user) values 
('Voluntariado', 'Tarefas relacionadas a atividades de voluntariado e caridade.', 1),
('Reparos Domésticos', 'Tarefas relacionadas a manutenção e reparos em casa.', 3),
('Vendas', 'Tarefas relacionadas a estratégias de vendas e atendimento ao cliente.', 5),
('Saúde e Bem-Estar', 'Tarefas relacionadas a manter uma vida saudável.', 2),
('Lazer', 'Tarefas relacionadas ao planejamento de atividades de lazer.', 4),
('Acadêmico', 'Tarefas relacionadas a estudos e educação.', 6),
('Compras', 'Tarefas relacionadas a compras e abastecimento.', 7),
('Gerenciamento de Projetos', 'Tarefas relacionadas à gestão e acompanhamento de projetos.', 2);

drop table Categories;
select * from Categories;

create table Tasks(
	id int not null auto_increment primary key,
    name varchar(63) not null,
    description varchar(255),
    deadline datetime,
	
    fk_user int not null,
    
    foreign key(fk_user) references users(id)
);

insert into Tasks (name, description, deadline, fk_user) values 
('estudar node', 'estudar node js criando apis e gerenciando arquivos', '2023-12-14',2),
('zerar whacth dogs 2', 'só zerando de novo', '2023-12-31',1),
('Preparar Relatório Trimestral', 'Resumir o desempenho do último trimestre e identificar áreas de melhoria.', '2023-11-15',3),
('Comprar mantimentos para o jantar', null, '2023-11-15',7),
('Preparar apresentação sobre a Revolução Industrial', 'Criar slides e resumir principais eventos da Revolução Industrial.', '2023-11-10',4),
('Planejar férias de verão em família', 'Escolher destino, reservar acomodação e programar atividades.', '2024-1-31',6),
('Realizar treino físico diário', null, '2023-12-31',2),
('Criar apresentação de vendas para reunião com clientes', null, '2023-12-5',7),
('Consertar vazamento no telhado da garagem', null, '2023-11-20',3),
('Voluntariar no abrigo de animais local', null, '2023-12-15',4);

drop table Tasks;
select * from Tasks;

select Tasks.id, Tasks.name, Tasks.description, Tasks.deadline as 'data limite', 
Categories.name as 'nome da categoria', Categories.description as 'descrição da categoria' from Tasks 
inner join Categories on fk_category = Categories.id;

select Tasks.id, Tasks.name, Tasks.description, Tasks.deadline as 'data limite', 
Categories.name as 'nome da categoria', Categories.description as 'descrição da categoria' from Tasks 
inner join Categories on fk_category = Categories.id
where Categories.name = 'estudo';

select Tasks.name, Tasks.description, Tasks.deadline FROM Tasks 
inner join Categories ON Tasks.fk_category = Categories.id 
where categories.name = 'vida';