USE OFICINA;

CREATE DATABASE OFICINA;

CREATE TABLE EMPRESA (
    idEmpresa INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nomeEmpresa VARCHAR(120) NOT NULL,
    tipo VARCHAR(45)
);


CREATE TABLE DEPARTAMENTO (
    IdDepartamento INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nomeDepartamento VARCHAR(45) NOT NULL,
    descricaoDepartamento VARCHAR(45) NOT NULL,
    idEmpresa INT NOT NULL,
    
    CONSTRAINT fk_idEmpresa_departamento FOREIGN KEY (idEmpresa)
        REFERENCES Empresa (idEmpresa)
);


CREATE TABLE OS (
    IdOS INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    datasolicitacao_OS VARCHAR(10) NOT NULL,
    dataprevisao_OS VARCHAR(10) NOT NULL,
    resposta_OS VARCHAR(45),
    IdFuncionario INT NOT NULL,
    IdDepartamento INT NOT NULL,
    IdCliente INT NOT NULL,
    
    CONSTRAINT fk_idFuncionario_OS FOREIGN KEY (idFuncionario)
        REFERENCES Funcionario (idFuncionario),
        
    CONSTRAINT fk_idDepartamento_OS FOREIGN KEY (idDepartamento)
        REFERENCES Departamento (idDepartamento),
        
    CONSTRAINT fk_idCliente_OS FOREIGN KEY (idCliente)
        REFERENCES Cliente (idCliente)
);


CREATE TABLE CLIENTE (
    IdCliente INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome_Cliente VARCHAR(120) NOT NULL,
    cpf_Cliente VARCHAR(11) NOT NULL,
    idEndereco INT NOT NULL,
    
    CONSTRAINT fk_idEndereco_cliente FOREIGN KEY (idEndereco)
        REFERENCES Endereco (idEndereco)
);


CREATE TABLE FUNCIONARIO (
    IdFuncionario INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome_Funcionario VARCHAR(100) NOT NULL,
    cpf_Funcionario VARCHAR(10) NOT NULL,
    idEndereco_Funcionario INT NOT NULL,
    idDepartamento_Funcionario INT NOT NULL,
    
    CONSTRAINT fk_idEndereco_funcionario FOREIGN KEY (idEndereco_Funcionario)
        REFERENCES Endereco (idEndereco),
        
    CONSTRAINT fk_idDepartamento_funcionario FOREIGN KEY (idDepartamento_Funcionario)
        REFERENCES Departamento (idDepartamento)
);


CREATE TABLE SERVICO (
    IdServico INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome_Servico VARCHAR(10) NOT NULL,
    recursos_Servico VARCHAR(10) NOT NULL
);


CREATE TABLE ENDERECO (
    IdEndereco INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    bairro_Endereco VARCHAR(100) NOT NULL,
    rua_Endereco VARCHAR(100) NOT NULL,
    numero_Endereco VARCHAR(100) NOT NULL
);


CREATE TABLE TELEFONE (
    IdTelefone INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    numero_Telefone VARCHAR(10),
    idFuncionario INT,
    idCliente INT,
    
    CONSTRAINT fk_idFuncionario_Telefone FOREIGN KEY (idFuncionario)
        REFERENCES Funcionario (idFuncionario),
        
    CONSTRAINT fk_idCliente_Telefone FOREIGN KEY (idCliente)
        REFERENCES Cliente (idCliente)
);


CREATE TABLE ITENS_OS (
    IdServico INT NOT NULL,
    IdOS INT NOT NULL,
    
    CONSTRAINT fk_idServico_itens FOREIGN KEY (idServico)
        REFERENCES Servico (idServico),
        
    CONSTRAINT fk_idOs_itens FOREIGN KEY (idOS)
        REFERENCES OS (idOS),
        
    PRIMARY KEY (idServico , IdOs)
);

	-- INDEXES 
create index IDX_IDEMPRESA ON EMPRESA (idEmpresa);
create index IDX_IDDEPARTAMENTO ON DEPARTAMENTO (idDepartamento);
create index IDX_IDOS ON OS (idOS);
create index IDX_IDCLIENTE ON CLIENTE (idCliente);
create index IDX_IDFUNCIONARIO ON FUNCIONARIO (idFuncionario);
create index IDX_IDSERVICO ON SERVICO (idServico);
create index IDX_IDENDERECO ON ENDERECO (idEndereco);
create index IDX_IDTELEFONE ON TELEFONE (idTelefone);
create index IDX_IDSERVICO ON ITENS_OS (idServico);
create index IDX_IDOS ON ITENS_OS (idOS);

-- ################################
INSERT INTO EMPRESA(nomeEmpresa,tipo) VALUE ("Geovana", "Sapatos");
INSERT INTO ENDERECO (bairro_Endereco, rua_Endereco, numero_Endereco) VALUE ("Centro", "Otaviano", "9A");
INSERT INTO ENDERECO (bairro_Endereco, rua_Endereco, numero_Endereco) VALUE ("BTN", "Olavo", "92");
INSERT INTO SERVICO (nome_Servico, recursos_Servico) VALUE ("Atender","Dinheiro");
INSERT INTO DEPARTAMENTO (nomeDepartamento, descricaoDepartamento, idEmpresa) VALUE ("Geo", "Legal", "1");
INSERT INTO FUNCIONARIO (nome_Funcionario, cpf_Funcionario,idEndereco_Funcionario, idDepartamento_Funcionario) VALUE ("libilly","222.222-0", "1", "1");
INSERT INTO CLIENTE (nome_Cliente, cpf_Cliente, idEndereco) VALUE ("Jayne","88.88-88","2");
INSERT INTO TELEFONE (numero_Telefone, idFuncionario ) VALUE ("123-4567", "1");
INSERT INTO TELEFONE (numero_Telefone, idCliente ) VALUE ("123-4568", "1");
INSERT INTO OS (datasolicitacao_OS, dataprevisao_OS, resposta_OS, IdFuncionario, IdDepartamento, IdCliente) VALUE ("02/03", "03/06", "OIE", "1", "1", "1");


UPDATE CLIENTE SET nome_Cliente = "Jayne" WHERE idCliente = 1;


SELECT C.NOMECLIENTE, C.cpf_Cliente, T.numero, E.RUAEENDERECO FROM CLIENTE C, TELEFONE T, ENDERECO E WHERE 
C.IDCLIENTE = T.IDCLIENTE AND
C.IDENDERECO = E.IDENDERECO AND
C.NOMECLIENTE LIKE "%RA%";

-- #############
INSERT INTO DEPARTAMENTO (nomeDepartamento,descricaoDepartamento,idEmpresa)
VALUES
  ("sem. Pellentesque","vitae purus gravida sagittis.",1),
  ("ullamcorper eu,","urna. Nunc quis arcu",1),
  ("egestas, urna","egestas. Duis ac arcu.",1),
  ("gravida sit","vulputate eu, odio.",1),
  ("senectus et","dictum augue malesuada",1);

INSERT INTO ENDERECO (bairro_Endereco,rua_Endereco,numero_Endereco)
VALUES
  ("Baden Württemberg","9589730 Scelerisque St.",19),
  ("Lombardia","P.O. Box 692, 3249 Quisque St.",20),
  ("Huábei","P.O. Box 607, 2685 Risus. Ave",15),
  ("Kaliningrad Oblast","3445841 In Rd.",8),
  ("Dalarnas län","P.O. Box 343, 5444 Enim Av.",5),
  ("Zuid Holland","6168856 Integer St.",19),
  ("Haute Normandie","Ap 326-529 Tempus Avenue",2),
  ("Bicol Region","Ap 888-7380 Orci Av.",1),
  ("Veracruz","Ap 170-5066 Orci Av.",14),
  ("Zachodniopomorskie","422-6230 Cras Street",19),
  ("Yucatán","4358419 Vitae Ave",17),
  ("Troms og Finnmark","Ap 7846475 Blandit Avenue",7),
  ("Cundinamarca","P.O. Box 998, 2124 Arcu Ave",7),
  ("Vienna","Ap 9216290 Pede, Avenue",7),
  ("Andalucía","2068572 Quis, Rd.",19),
  ("Luik","P.O. Box 882, 1543 Metus. St.",14),
  ("Connacht","Ap 242-8338 Enim Rd.",18),
  ("Lviv oblast","P.O. Box 638, 8433 Nam Street",19),
  ("West Region","1848 Auctor Avenue",2),
  ("Lower Austria","3289 Adipiscing St.",10);

INSERT INTO CLIENTE (nome_Cliente,cpf_Cliente,idEndereco)
VALUES
  ("Richard Higgins","1944412",46),
  ("Idona Hunt","8975059",44),
  ("Gail Wiggins","7839832",49),
  ("Yael Bray","1187417",56),
  ("Chelsea Hobbs","8078314",44),
  ("Angelica Dalton","6459987",58),
  ("Kieran Hinton","6477231",61),
  ("Amery Mack","4912935",44),
  ("Ashely Espinoza","7673210",53),
  ("Willa Butler","7313795",62);

  INSERT INTO FUNCIONARIO (nome_Funcionario,cpf_Funcionario,idEndereco_Funcionario,idDepartamento_Funcionario)
VALUES
  ("Amy Benton","52567612",9,16),
  ("Prescott Alford","53553567",8,16),
  ("Dylan Reid","62852588",9,14),
  ("Guinevere Nixon","23595991",6,16),
  ("Hiroko Manning","70933548",5,16),
  ("Brenna Keith","02198308",7,1),
  ("Chaney Richmond","35813405",7,11),
  ("Justina Riddle","62876533",6,5),
  ("Maryam Bray","52673544",4,7),
  ("Kamal Mullins","80550168",4,2),
  ("Ursa Landry","43575538",5,14),
  ("Otto Simpson","56233674",9,17),
  ("Kiara Glover","41654318",8,11),
  ("Justina Bishop","28546203",5,18),
  ("Erin Pratt","24433251",2,15),
  ("Macy Franks","22649172",8,7),
  ("Macy Franks","22649172",8,7),
  ("Sharon Kelly","34312065",7,4),
  ("Igor Swanson","94783612",5,8),
  ("Brenna Rush","32327810",10,6),
  ("Colt Barr","28698938",8,18);
  
 INSERT INTO OS (datasolicitacao_OS,dataprevisao_OS,resposta_OS,IdFuncionario,IdDepartamento,IdCliente)
	VALUES
		("8810602","5267141","accan",11,3,7),
		("5692563","5508452","ullcorper. Duis",9,2,3),
		("5458850","5486447","vaus",3,4,6),
		("7811506","1557365","ante",4,4,4),
		("5366658","2420844","Proin eget odio.",8,8,3),
		("6981392","4515169","interdum ligula",9,9,4),
		("7552328","5361334","aliquam arcu",23,3,11),
		("4202783","8652123","felis",3,1,5),
		("3328810","7483937","faucibus ut,",6,5,3),
		("4852322","6701426","nisl Quisque",4,10,3);
        
INSERT INTO Servico (nome_Servico,recursos)
	VALUES
		("dolor","sed"),
		("hendrerit.","posuere"),
		("arcu.","augue ac"),
		("nulla","lectus convallis est,"),
		("sollicitudin","eu neque"),
		("blandit","mi"),
		("mollis","per conubia nostra,"),
		("ligula","ullamcorper eu,"),
		("Integer","Ut sagittis"),
		("ac,","porttitor");
        
INSERT INTO itens_OS (idServico,idOS)
	VALUES
		(2,5),
		(3,6),
		(4,7),
		(5,8),
		(6,9),
		(7,0),
		(8,1),
		(9,2),
		(10,3),
		(11,4);
        
   -- RESOLUÇÃO DO EXERCÍCIO
   -- Listar os servicos realizados por um determinado departamento
	-- Listar os funcionários que já realizaram algum tipo de serviço
	-- Saber quais clientes já realizaram determinado serviço
  
select s.nome_Servico, d.nomeDepartamento, o.resposta_OS from Servico s INNER JOIN ITENS_OS i ON
 (i.IdServico = s.IdServico) INNER JOIN OS o ON (o.IdOS = i.IdOS) INNER JOIN Departamento d ON 
 (d.IdDepartamento = o.IdDepartamento) and d.IdDepartamento = 1;  
 
   select s.nome_Servico, f.nome_Funcionario from Servico s INNER JOIN ITENS_OS i ON 
   (i.IdServico = s.IdServico) INNER JOIN OS o ON 
   (o.idOS = i.IdOS) INNER JOIN Funcionario f ON (f.IdFuncionario = o.IdFuncionario);  
   
   select s.nome_Servico, c.nome_Cliente from Servico s INNER JOIN ITENS_OS i ON 
   (i.IdServico = s.IdServico) INNER JOIN OS o
   ON (o.IdOS = i.IdOS) INNER JOIN Cliente c ON (c.IdCliente = o.IdCliente);
  
  
