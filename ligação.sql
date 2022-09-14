create database teste_db; 

use teste_db;

create table usuario (
	id_usuario  INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    login_usuario varchar(100) NOT NULL UNIQUE,
    senha_usuario varchar(100) NOT NULL
);
 
CREATE INDEX IDX_ID_USUARIO on usuario(id_usuario);
CREATE INDEX IDX_ID_LOGIN on usuario( login_usuario);

select * from usuario;

insert into usuario(login_usuario,senha_usuario)  value ('Clara', '123');
insert into usuario(login_usuario,senha_usuario)  value ('Cicero', '456');
insert into usuario(login_usuario,senha_usuario)  value ('Gustavo', '789');
insert into usuario(login_usuario,senha_usuario)  value ('Libilly', '0209');
insert into usuario(login_usuario,senha_usuario)  value ('George', '0603');

