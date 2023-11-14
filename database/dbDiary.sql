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

drop table Users;
select * from Users;

create table Tasks(
    id int not null auto_increment primary key,
    name varchar(63) not null,
    description varchar(255),
    deadline datetime,
	
    fk_user int not null,
    
    foreign key(fk_user) references Users(id)
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
