CREATE TABLE Paciente(
Codpaciente integer,
Nome varchar(20),
Endereco varchar(30),
Telefone integer,
CONSTRAINT paciente_pkey PRIMARY KEY(Codpaciente));

CREATE TABLE Medico(
Crm integer,
Nome varchar(20),
Endereco varchar(30),
Telefone integer,
Especialidade varchar(15),
CONSTRAINT medico_pkey PRIMARY KEY(crm));

CREATE TABLE Convenio(
Codconvenio integer,
Nome varchar(20),
CONSTRAINT convenio_pkey PRIMARY KEY(Codconvenio));

CREATE TABLE Consulta(
Codconsulta integer,
Daata varchar(10),
Horario varchar(5),
Porcent integer,
Codmed integer,
Codpac integer,
Codconv integer,
CONSTRAINT consulta_pkey PRIMARY KEY(Codconsulta),
CONSTRAINT medico_fkey FOREIGN KEY(Codmed) REFERENCES Medico(Crm),
CONSTRAINT paciente_fkey FOREIGN KEY(Codpac) REFERENCES Paciente(Codpaciente),
CONSTRAINT conv_fkey FOREIGN KEY(Codconv) REFERENCES Convenio(Codconvenio));

CREATE TABLE Atende(
Codmed integer,
Codconv integer,
PRIMARY KEY(Codmed, Codconv),
CONSTRAINT medico_fkey FOREIGN KEY(Codmed) REFERENCES Medico(Crm),
CONSTRAINT convenio_fkey FOREIGN KEY(Codconv) REFERENCES Convenio(Codconvenio));

CREATE TABLE Possui(
Codpac integer,
Codconv integer,
Tipo varchar(20),
Vencimento varchar(10),
PRIMARY KEY(Codpac, Codconv),
CONSTRAINT paciente_fkey FOREIGN KEY(Codpac) REFERENCES Paciente(Codpaciente),
CONSTRAINT convenio_fkey FOREIGN KEY(Codconv) REFERENCES Convenio(Codconvenio));





INSERT INTO Paciente(CodPaciente, Nome, Endereco, Telefone)
VALUES(1, 'João', 'Rua 1', 98099756);
INSERT INTO Paciente(CodPaciente, Nome, Endereco, Telefone)
VALUES(2, 'José', 'Rua B', 36218978);
INSERT INTO Paciente(CodPaciente, Nome, Endereco, Telefone)
VALUES(3, 'Maria', 'Rua 10', 45679872);
INSERT INTO Paciente(CodPaciente, Nome, Endereco, Telefone)
VALUES(4, 'Joana', 'Rua J', 33439889);

INSERT INTO Medico(Crm, Nome, Endereco, Telefone, Especialidade)
VALUES(18739, 'Elias', 'Rua X', 87381221, 'Pediatria');
INSERT INTO Medico(Crm, Nome, Endereco, Telefone, Especialidade)
VALUES(7649, 'Ana', 'Av Z', 78291233, 'Obstetricia');
INSERT INTO Medico(Crm, Nome, Endereco, Telefone, Especialidade)
VALUES(39872, 'Pedro', 'Tv H', 98882333, 'Oftamologia');

INSERT INTO Convenio(Codconvenio, Nome)
VALUES(189, 'Cassi');
INSERT INTO Convenio(Codconvenio, Nome)
VALUES(232, 'Unimed');
INSERT INTO Convenio(Codconvenio, Nome)
VALUES(454, 'Santa Casa');
INSERT INTO Convenio(Codconvenio, Nome)
VALUES(908, 'Coapasa');
INSERT INTO Convenio(Codconvenio, Nome)
VALUES(435, 'São Lucas');

INSERT INTO Consulta(Codconsulta, Daata, Horario, Porcent, Codmed, Codpac, Codconv)
VALUES(1,'10/05/2013', '10:00', 5, 18739, 1, 189); 
INSERT INTO Consulta(Codconsulta, Daata, Horario, Porcent, Codmed, Codpac, Codconv)
VALUES(2,'12/05/2013', '10:00', 10, 7649, 2, 232); 
INSERT INTO Consulta(Codconsulta, Daata, Horario, Porcent, Codmed, Codpac, Codconv)
VALUES(3,'12/05/2013', '11:00', 15, 18739, 3, 908); 
INSERT INTO Consulta(Codconsulta, Daata, Horario, Porcent, Codmed, Codpac, Codconv)
VALUES(4,'13/05/2013', '10:00', 13, 7649, 4, 435); 
INSERT INTO Consulta(Codconsulta, Daata, Horario, Porcent, Codmed, Codpac, Codconv)
VALUES(5,'14/05/2013', '13:00', 10, 7649, 2, 232); 
INSERT INTO Consulta(Codconsulta, Daata, Horario, Porcent, Codmed, Codpac, Codconv)
VALUES(6,'14/05/2013', '14:00', 5, 39872, 1, 189); 

INSERT INTO Atende(Codmed, Codconv)
VALUES(18739, 189);
INSERT INTO Atende(Codmed, Codconv)
VALUES(18739, 908);
INSERT INTO Atende(Codmed, Codconv)
VALUES(7649, 232);
INSERT INTO Atende(Codmed, Codconv)
VALUES(39872, 189);

INSERT INTO Possui(Codpac, Codconv, Tipo, Vencimento)
VALUES(1, 189, 'E', '31/12/2016');
INSERT INTO Possui(Codpac, Codconv, Tipo, Vencimento)
VALUES(2, 232, 'S', '31/12/2014');
INSERT INTO Possui(Codpac, Codconv, Tipo, Vencimento)
VALUES(3, 908, 'S', '31/12/2017');
INSERT INTO Possui(Codpac, Codconv, Tipo, Vencimento)
VALUES(4, 435, 'E', '31/12/2016');
INSERT INTO Possui(Codpac, Codconv, Tipo, Vencimento)
VALUES(1, 232, 'S', '31/12/2015');

/*(1)Atualize o endereço do paciente João para ‘Rua do Bonde'*/
UPDATE Paciente SET Endereco = 'Rua do Bonde' WHERE Nome = 'João';

/*(2)Atualize os dados do medico Elias para ‘Rua Z’ e telefone ´9838-7867´*/
UPDATE Medico SET Endereco = 'Rua Z' , Telefone = 98387867 WHERE Nome = 'Elias';

/*(3)Atualize todos os tipos dos convênios que os pacientes possuem para ´S´*/
UPDATE Possui SET Tipo = 'S' WHERE Codpac > 0;

/*(4)Exclua a informação que o paciente José tem o convenio 232*/
DELETE FROM Possui WHERE Codpac = 2;

/*(5)Exclua a consulta realizada do dia 14/05/2013 as 14:00*/
DELETE FROM Consulta WHERE Daata = '14/05/2013' AND Horario = '14:00';

/*(6)Altere o nome da coluna especialidade, da tabela médico, para especialização*/
ALTER TABLE Medico RENAME COLUMN Especialidade TO Especializacao;

/*(7)Altere o tipo de dado da coluna nome, da tabela convenio, para varchar(200)*/
ALTER TABLE Convenio ALTER COLUMN Nome TYPE varchar(200);

/*(8)Acrescente a coluna Valor na tabela consulta e atualize todas as consultas para o valor de
R$100,00*/
ALTER TABLE Consulta ADD COLUMN Valor integer;
UPDATE Consulta SET Valor = 100 WHERE Codconsulta > 0;

select * from Paciente;
select * from Medico;
select * from Convenio;
select * from Consulta;
select * from Atende;
select * from Possui;