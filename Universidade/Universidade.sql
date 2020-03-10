CREATE TABLE Curso(
NumCurso integer,
Nome varchar (20),
TotalCreditos integer,
CONSTRAINT curso_pkey PRIMARY KEY (NumCurso));

CREATE TABLE Matricula(
NumCurso integer,
NumAluno integer,
CONSTRAINT matricula_pkey PRIMARY KEY (NumAluno),
CONSTRAINT matricula_fkey2 FOREIGN KEY (NumCurso) REFERENCES Curso(NumCurso));

CREATE TABLE Aluno(
NumAluno integer,
Nome varchar (20),
Endereco varchar(30),
Cidade varchar(20),
Telefone varchar(20),
CONSTRAINT aluno_pkey PRIMARY KEY (NumAluno));

CREATE TABLE Aula(
Semestre integer,
Nota integer,
Dataa varchar(10),
NumAluno integer,
NumDisciplina integer,
NumProf integer,
/*CONSTRAINT aula_pkey PRIMARY KEY (Semestre),*/
CONSTRAINT disciplinas_fkey1 FOREIGN KEY (NumAluno) REFERENCES Aluno(NumAluno),
CONSTRAINT disciplinas_fkey2 FOREIGN KEY (NumDisciplina) REFERENCES Disciplinas(NumDisciplina),
CONSTRAINT disciplinas_fkey3 FOREIGN KEY (NumProf) REFERENCES Professor(NumProf));

CREATE TABLE Professor(
NumProf integer,
Nome varchar (20),
AreaPesquisa varchar(20),
CONSTRAINT professor_pkey PRIMARY KEY (NumProf));

CREATE TABLE Disciplinas(
NumDisciplina integer,
Nome varchar (20),
QuantidadeCreditos integer,
NumCurso integer,
NumProf integer, 
CONSTRAINT disciplinas_pkey PRIMARY KEY (NumDisciplina),
CONSTRAINT disciplinas_fkey1 FOREIGN KEY (NumCurso) REFERENCES Curso(NumCurso),
CONSTRAINT disciplinas_fkey2 FOREIGN KEY (NumProf) REFERENCES Professor(NumProf));


INSERT INTO Curso
(NumCurso, Nome, TotalCreditos)VALUES(01,'CC',200);
INSERT INTO Curso
(NumCurso, Nome, TotalCreditos)VALUES(02,'ES',200);
INSERT INTO Curso
(NumCurso, Nome, TotalCreditos)VALUES(03,'EC',200);
INSERT INTO Curso
(NumCurso, Nome, TotalCreditos)VALUES(04,'REDES',200);
INSERT INTO Curso
(NumCurso, Nome, TotalCreditos)VALUES(05,'DD',200);
INSERT INTO Curso
(NumCurso, Nome, TotalCreditos)VALUES(06,'SI',200);

INSERT INTO Aluno
(NumAluno, Nome, Endereco, Cidade, Telefone)VALUES(01,'Marcos João Casanova', 'RUA C', 'Fortaleza',85995214785);
INSERT INTO Aluno
(NumAluno, Nome, Endereco, Cidade, Telefone)VALUES(02,'Aílton Castro', 'RUA D', 'Quixadá',88988541209);
INSERT INTO Aluno
(NumAluno, Nome, Endereco, Cidade, Telefone)VALUES(03,'Edvaldo Carlos Silva', 'RUA H', 'Fortaleza',85987125874);
INSERT INTO Aluno
(NumAluno, Nome, Endereco, Cidade, Telefone)VALUES(04,'João Carlos', 'RUA J', 'Fortaleza',85999999999);
INSERT INTO Aluno
(NumAluno, Nome, Endereco, Cidade, Telefone)VALUES(05,'Matheus Silva', 'RUA A', 'Fortaleza',85988888888);

INSERT INTO Matricula
(NumCurso, NumAluno)VALUES(01,01);
INSERT INTO Matricula
(NumCurso, NumAluno)VALUES(01,02);
INSERT INTO Matricula
(NumCurso, NumAluno)VALUES(01,03);
INSERT INTO Matricula
(NumCurso, NumAluno)VALUES(02,04);
INSERT INTO Matricula
(NumCurso, NumAluno)VALUES(02,05);

INSERT INTO Professor
(NumProf, Nome, AreaPesquisa)VALUES(01,'Ramon Travanti','Banco de Dados');
INSERT INTO Professor
(NumProf, Nome, AreaPesquisa)VALUES(02,'Marcos Salvador','Algoritmos');
INSERT INTO Professor
(NumProf, Nome, AreaPesquisa)VALUES(03,'Abgair','Física');

INSERT INTO Disciplinas
(NumDisciplina, Nome, QuantidadeCreditos, NumCurso, NumProf)VALUES(01,'Cálculo Numérico', 4, 01, 03);
INSERT INTO Disciplinas
(NumDisciplina, Nome, QuantidadeCreditos, NumCurso, NumProf)VALUES(02,'Banco de Dados', 4, 01, 01);
INSERT INTO Disciplinas
(NumDisciplina, Nome, QuantidadeCreditos, NumCurso, NumProf)VALUES(03,'Eng de Software', 4, 01, 02);

/*ALUNO 1*/
INSERT INTO Aula
(Semestre, Nota, Dataa, NumAluno, NumDisciplina, NumProf)VALUES(1, 5, '1998', 01, 01, 03);
INSERT INTO Aula
(Semestre, Nota, Dataa, NumAluno, NumDisciplina, NumProf)VALUES(1, 10, '1998', 01, 02, 01);
INSERT INTO Aula
(Semestre, Nota, Dataa, NumAluno, NumDisciplina, NumProf)VALUES(2, 8, '1998', 01, 03, 02);
/*Aluno 2*/
INSERT INTO Aula
(Semestre, Nota, Dataa, NumAluno, NumDisciplina, NumProf)VALUES(1, 7, '1998', 02, 01, 03);
INSERT INTO Aula
(Semestre, Nota, Dataa, NumAluno, NumDisciplina, NumProf)VALUES(1, 7, '1998', 02, 02, 01);
INSERT INTO Aula
(Semestre, Nota, Dataa, NumAluno, NumDisciplina, NumProf)VALUES(1, 7, '1998', 02, 03, 02);
/*ALUNO 3*/
INSERT INTO Aula
(Semestre, Nota, Dataa, NumAluno, NumDisciplina, NumProf)VALUES(1, 2, '1998', 03, 01, 03);
INSERT INTO Aula
(Semestre, Nota, Dataa, NumAluno, NumDisciplina, NumProf)VALUES(1, 8, '1998', 03, 02, 01);
INSERT INTO Aula
(Semestre, Nota, Dataa, NumAluno, NumDisciplina, NumProf)VALUES(1, 4, '1998', 03, 03, 02);
/*ALUNO 4*/
INSERT INTO Aula
(Semestre, Nota, Dataa, NumAluno, NumDisciplina, NumProf)VALUES(1, 2, '1998', 04, 01, 03);
INSERT INTO Aula
(Semestre, Nota, Dataa, NumAluno, NumDisciplina, NumProf)VALUES(1, 1, '1998', 04, 02, 01);
INSERT INTO Aula
(Semestre, Nota, Dataa, NumAluno, NumDisciplina, NumProf)VALUES(1, 6, '1998', 04, 03, 02);
/*ALUNO 5*/
INSERT INTO Aula
(Semestre, Nota, Dataa, NumAluno, NumDisciplina, NumProf)VALUES(2, 10, '1998', 05, 01, 03);
INSERT INTO Aula
(Semestre, Nota, Dataa, NumAluno, NumDisciplina, NumProf)VALUES(1, 10, '1998', 05, 02, 01);
INSERT INTO Aula
(Semestre, Nota, Dataa, NumAluno, NumDisciplina, NumProf)VALUES(1, 10, '1998', 05, 03, 02);

/*QUESTAO 05 - Quais os nomes das disciplinas do curso de Ciência da Computação. */
SELECT Nome FROM Disciplinas WHERE NumCurso = 01;
/*QUESTAO 06 - Quais os nomes dos cursos que possuem no curriculum a disciplina Cálculo Numérico. */
SELECT C.Nome FROM Disciplinas D,Curso C WHERE D.Nome = 'Cálculo Numérico' AND D.NumCurso = C.NumCurso;
/*QUESTAO 07 - Quais os nomes das disciplinas que o aluno Marcos João Casanova cursou no 1º semestre de 1998. */
SELECT NumDisciplina FROM Aula WHERE  Semestre = 1 AND NumAluno = 01;

select * FROM Curso;
select * FROM Aluno;
select * FROM Matricula;
select * FROM Professor;
select * FROM Disciplinas;
select * FROM Aula;
