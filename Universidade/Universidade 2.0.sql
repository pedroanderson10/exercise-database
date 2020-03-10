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
NumCurso integer,
CONSTRAINT aluno_pkey PRIMARY KEY (NumAluno),
CONSTRAINT aluno_fkey FOREIGN KEY (NumCurso) REFERENCES Curso (NumCurso));

CREATE TABLE Semestre(
NumSemestre integer,
Ano varchar(10),
Nota integer,
NumAluno integer,
NumDisciplina integer,
NumProf integer,
/*CONSTRAINT aula_pkey PRIMARY KEY (NumSemestre),*/
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
CONSTRAINT disciplinas_pkey PRIMARY KEY (NumDisciplina),
CONSTRAINT disciplinas_fkey1 FOREIGN KEY (NumCurso) REFERENCES Curso(NumCurso));


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
(NumDisciplina, Nome, QuantidadeCreditos, NumCurso)VALUES(01,'Cálculo Numérico', 4, 01);
INSERT INTO Disciplinas
(NumDisciplina, Nome, QuantidadeCreditos, NumCurso)VALUES(02,'Banco de Dados', 4, 01);
INSERT INTO Disciplinas
(NumDisciplina, Nome, QuantidadeCreditos, NumCurso)VALUES(03,'Eng de Software', 4, 01);

/*ALUNO 1*/
INSERT INTO Semestre
(NumSemestre, Nota, Ano, NumAluno, NumDisciplina, NumProf)VALUES(1, 5, '1998', 01, 01, 03);
INSERT INTO Semestre
(NumSemestre, Nota, Ano, NumAluno, NumDisciplina, NumProf)VALUES(1, 10, '1998', 01, 02, 01);
INSERT INTO Semestre
(NumSemestre, Nota, Ano, NumAluno, NumDisciplina, NumProf)VALUES(2, 8, '1998', 01, 03, 02);
/*Aluno 2*/
INSERT INTO Semestre
(NumSemestre, Nota, Ano, NumAluno, NumDisciplina, NumProf)VALUES(1, 7, '1998', 02, 01, 03);
INSERT INTO Semestre
(NumSemestre, Nota, Ano, NumAluno, NumDisciplina, NumProf)VALUES(1, 7, '1998', 02, 02, 01);
INSERT INTO Semestre
(NumSemestre, Nota, Ano, NumAluno, NumDisciplina, NumProf)VALUES(1, 7, '1998', 02, 03, 02);
/*ALUNO 3*/
INSERT INTO Semestre
(NumSemestre, Nota, Ano, NumAluno, NumDisciplina, NumProf)VALUES(1, 2, '1998', 03, 01, 03);
INSERT INTO Semestre
(NumSemestre, Nota, Ano, NumAluno, NumDisciplina, NumProf)VALUES(1, 8, '1998', 03, 02, 01);
INSERT INTO Semestre
(NumSemestre, Nota, Ano, NumAluno, NumDisciplina, NumProf)VALUES(1, 4, '1998', 03, 03, 02);
/*ALUNO 4*/
INSERT INTO Semestre
(NumSemestre, Nota, Ano, NumAluno, NumDisciplina, NumProf)VALUES(1, 2, '1998', 04, 01, 03);
INSERT INTO Semestre
(NumSemestre, Nota, Ano, NumAluno, NumDisciplina, NumProf)VALUES(1, 1, '1998', 04, 02, 01);
INSERT INTO Semestre
(NumSemestre, Nota, Ano, NumAluno, NumDisciplina, NumProf)VALUES(1, 6, '1998', 04, 03, 02);
/*ALUNO 5*/
INSERT INTO Semestre
(NumSemestre, Nota, Ano, NumAluno, NumDisciplina, NumProf)VALUES(2, 10, '1998', 05, 01, 03);
INSERT INTO Semestre
(NumSemestre, Nota, Ano, NumAluno, NumDisciplina, NumProf)VALUES(1, 10, '1998', 05, 02, 01);
INSERT INTO Semestre
(NumSemestre, Nota, Ano, NumAluno, NumDisciplina, NumProf)VALUES(1, 10, '1998', 05, 03, 02);

/*QUESTAO 05 - Quais os nomes das disciplinas do curso de Ciência da Computação. */
SELECT Nome FROM Disciplinas WHERE NumCurso = 01;
/*QUESTAO 06 - Quais os nomes dos cursos que possuem no curriculum a disciplina Cálculo Numérico. */
SELECT C.Nome FROM Disciplinas D,Curso C WHERE D.Nome = 'Cálculo Numérico' AND D.NumCurso = C.NumCurso;
/*QUESTAO 07 - Quais os nomes das disciplinas que o aluno Marcos João Casanova cursou no 1º semestre de 1998. */
SELECT D.nome FROM Semestre S, Disciplinas D WHERE  S.NumSemestre = 1 AND S.NumAluno = 01 AND D.NumDisciplina = S.NumDisciplina AND S.Ano = '1998';
/*QUESTAO 8 - Quais os nomes de disciplinas que o aluno Ailton Castro foi reprovado.*/
SELECT D.Nome FROM Disciplinas D, Semestre S WHERE S.NumAluno = 02 AND D.NumDisciplina = S.NumDisciplina AND S.Nota < 7;
/*QUESTAO 9 - Quais os nomes de alunos reprovados na disciplina de Cálculo Numérico no 1º semestre de 1998.*/
SELECT A.Nome FROM Aluno A, Semestre S WHERE S.NumSemestre = 01 AND S.Ano = '1998' AND S.NumAluno = A.NumAluno AND S.NumDisciplina = 01 AND S.Nota < 7;
/*QUESTAO 10 - Quais os nomes das disciplinas ministradas pelo prof. Ramon Travanti.*/
SELECT D.Nome FROM Semestre S, Disciplinas D WHERE S.NumProf = 01 AND D.NumDisciplina = S.NumDisciplina; 
/*QUESTAO 11 - Quais os nomes professores que já ministraram aula de Banco de Dados.*/
SELECT P.Nome FROM Semestre S, Professor P WHERE S.NumProf = P.NumProf AND S.NumDisciplina = 02;
/*QUESTAO 12 - Qual a maior e a menor nota na disciplina de Cálculo Numérico no 1º semestre de 1998.*/
SELECT MAX(Nota) FROM Semestre WHERE NumDisciplina = 01 AND NumSemestre = 01 AND Ano = '1998';
SELECT MIN(Nota) FROM Semestre WHERE NumDisciplina = 01 AND NumSemestre = 01 AND Ano = '1998'; 
/*QUESTAO 13 - Qual o nome do aluno e nota que obteve maior nota na disciplina de Engenharia de Software no 1ºsemestre de 1998.*/
SELECT A.Nome, S.Nota FROM Aluno A, Semestre S WHERE A.NumAluno = S.NumAluno AND S.NumDisciplina = 03 AND NumSemestre = 01 AND Ano = '1998' AND S.Nota IN (SELECT MAX(Nota) FROM Semestre);
/*QUESTAO 14 - Quais nomes de alunos, nome de disciplina e nome de professores que cursaram o 1º semestre de 1998 em ordem de aluno.*/
SELECT A.Nome, D.Nome, P.Nome FROM Aluno A, Disciplinas D, Professor P, Semestre S WHERE A.NumALuno = S.NumAluno AND D.NumDisciplina = S.NumDisciplina AND P.NumProf = S.NumProf AND S.NumSemestre = 01 AND S.Ano = '1998' ORDER BY A.Nome; 
/*QUESTAO 15 - Quais nomes de alunos, nome de disciplina e notas do 1º semestre de 1998 no curso de Ciência da Computação.*/ 
SELECT A.Nome, D.Nome, S.Nota FROM Aluno A, Disciplinas D, Semestre S WHERE A.NumALuno = S.NumAluno AND D.NumDisciplina = S.NumDisciplina AND S.NumSemestre = 01 AND S.ANo = '1998' AND D.NumCurso = 01;
/*QUESTAO 16 - Qual a média de notas do professor Marcos Salvador.*/
SELECT AVG(S.Nota) FROM Semestre S, Professor P WHERE S.NumProf = P.NumProf AND S.NumProf = 02;
/*QUESTAO 17 - Quais nomes de alunos, nomes de disciplinas e notas que tiveram nota entre 5.0 e 7.0 em ordem de disciplina.*/ 
SELECT A.Nome, D.Nome, S.Nota FROM Aluno A, Disciplinas D, Semestre S WHERE A.NumALuno = S.NumAluno AND D.NumDisciplina = S.NumDisciplina AND S.Nota BETWEEN 5 AND 7 ORDER BY D.Nome;
/*QUESTAO 18 - Qual a média de notas da disciplina Cálculo Numérico no 1º semestre de 1998.*/
SELECT AVG(S.Nota) FROM Semestre S, Disciplinas D WHERE S.NumDisciplina = D.NumDisciplina AND S.NumDisciplina = 01 AND S.NumSemestre = 01 AND S.Ano = '1998';
/*QUESTAO 19 - Quantos alunos o professor Abgair teve no 1º semestre de 1998.*/
SELECT COUNT(A.Nome) FROM Aluno A, Professor P, Semestre S WHERE S.NumProf = P.NumProf AND S.NumAluno = A.NumAluno AND S.NumSemestre = 1 AND S.Ano = '1998' AND S.NumProf = 03;
/*QUESTAO 20 - Qual a média de notas do aluno Edvaldo Carlos Silva.*/
SELECT AVG(S.Nota) FROM Semestre S, Aluno A WHERE S.NumAluno = A.NumAluno AND A.Nome = 'Edvaldo Carlos Silva';

select * FROM Curso;
select * FROM Aluno;
select * FROM Matricula;
select * FROM Professor;
select * FROM Disciplinas;
select * FROM Semestre;
