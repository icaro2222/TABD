-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE Aluno (
nome VARCHAR(50),
endereco VARCHAR(20),
sexo CHAR(1),
matricula CHAR(8) PRIMARY KEY
);

CREATE TABLE Disciplina (
codDisciplina CHAR(8) PRIMARY KEY,
nomeDisciplina VARCHAR(50),
nroCreditos INT
);

CREATE TABLE Concluida (
codDisciplina CHAR(8),
matricula CHAR(8),
FOREIGN KEY(codDisciplina) REFERENCES Disciplina (codDisciplina),
FOREIGN KEY(matricula) REFERENCES Aluno (matricula)
);

CREATE TABLE Matricula (
codDisciplina CHAR(8),
matricula CHAR(8),
FOREIGN KEY(codDisciplina) REFERENCES Disciplina (codDisciplina),
FOREIGN KEY(matricula) REFERENCES Aluno (matricula)
);

CREATE TABLE Cursa (
matricula CHAR(8),
codCurso CHAR(8),
FOREIGN KEY(matricula) REFERENCES Aluno (matricula)
);

CREATE TABLE Curso (
nomeCurso VARCHAR(50),
codCurso CHAR(8) PRIMARY KEY,
codDepart CHAR(8)
);

CREATE TABLE Departamento (
nomeDepart VARCHAR(50),
codDepart CHAR(8) PRIMARY KEY
);

CREATE TABLE Oferta (
tipoDisciplina VARCHAR(20),
codDisciplina CHAR(8),
codCurso CHAR(8),
FOREIGN KEY(codDisciplina) REFERENCES Disciplina (codDisciplina)
);

CREATE TABLE Pre_Requisito (
codDisciplina CHAR(8),
possui_codDisciplina CHAR(8),
PRIMARY KEY(codDisciplina,possui_codDisciplina)
);

ALTER TABLE Cursa ADD FOREIGN KEY(codCurso) REFERENCES Curso (codCurso);
ALTER TABLE Curso ADD FOREIGN KEY(codDepart) REFERENCES Departamento (codDepart);
