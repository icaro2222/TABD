
CREATE TABLE aluno (
    cdaluno INTEGER PRIMARY KEY  NOT NULL AUTO_INCREMENT,
    nome VARCHAR(40) ,
    nmatricula VARCHAR(15) ,
    status CHAR(2) );
    
  INSERT INTO aluno(nome, nmatricula, status ) values('Antonio Bandeiras', '000102018','MT'),
                         ('Bill Gates',    '00002-2018','MT'),
                         ('Steve Sniack', '00003-2018','MT'),
                         ('Linus Torvals','000404-2018','MT');
                         
CREATE TABLE curso (
    cdcurso INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nomecurso VARCHAR(20) ,
    valor NUMERIC(7,2));

insert into curso(nomecurso, valor) values('ADS', 800.00),
                        ('Quimica',900.00),
                        ('Agronomia', 1000.00),
                        ('Agroindustria', 1100.00);

CREATE TABLE professor (
    cdprofessor INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome VARCHAR(40));

insert into professor(nome) values('REINALDA FERNANDES'),
                             ('MARQUESA LIMA'),
                             ('GEORGINA COTRIM'),
                             ('PAULITA FERREIRA'),
                             ('ICARO DIAS');


CREATE TABLE disciplina (
    cddisciplina INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nomedisciplina varchar(40),
    cdprofessor INTEGER,
    valor NUMERIC(7,2),
	 FOREIGN KEY (cdprofessor) REFERENCES professor(cdprofessor)   
	 on delete cascade);

insert into disciplina(nomedisciplina, cdprofessor, valor) values('ALGORITMO',1,500.00),
                             ('BANCO DE DADOS',2, 600.00),
                             ('TABD',2, 600.00),
                             ('SO',2, 700.00),
                             ('SD',2, 700.00),
                             ('IHM',2,700.00),
                             ('ESTAGIO 1',3, 900.00),                             
                             ('ESTAGIO I1',3, 900.00),                             
                             ('ESTATISTICA',3, 900.00),                             
                             ('PORTUGUES',3, 900.00),                         
                             ('FISICA 1',4, 1000.00),                             
                             ('ROBOTICA',4, 1000.00);

CREATE TABLE semestre (
    cdsemestre INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
    ano VARCHAR(6));

INSERT INTO semestre(ano) VALUES('2017-1'),
                           ('2017-2'),
                           ('2018-1'),
                           ('2018-2');
                           
CREATE TABLE turma (
    cdturma INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nometurma VARCHAR(20));

INSERT INTO turma(nometurma) VALUES('PROGRAMADORES'),
                        ('ANALISTAS');


CREATE TABLE matricula (
    cdmatricula INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
    cdcurso INTEGER,
    cdaluno INTEGER,
    cdsemestre INTEGER,
    valor NUMERIC(7,2),
    cdturma INTEGER,
	 FOREIGN KEY (cdcurso) REFERENCES curso(cdcurso),
	 FOREIGN KEY (cdaluno) REFERENCES aluno(cdaluno),
	 FOREIGN KEY (cdsemestre) REFERENCES semestre(cdsemestre),
	 FOREIGN KEY (cdturma) REFERENCES turma(cdturma)   
	 on delete cascade);


INSERT INTO matricula(cdcurso, cdaluno, cdsemestre, valor, cdturma) values(1, 1, 4,300.00,1),
                            ( 1, 2, 4,400.00,1),
                            ( 2, 3, 4,500.00,2),
                            ( 3, 4, 4,500.00,2),

                            ( 1, 1, 1, 300.00, 1),
                            ( 1, 2, 1, 400.00, 1),
                            ( 2, 3, 1, 500.00, 2),                         
                            ( 1, 4, 1, 500.00, 2),

                            ( 1, 1, 2, 300.00, 1),
                            ( 1, 2, 2, 400.00, 1),
                            ( 2, 3, 3, 500.00, 2),                         
                            ( 2, 4, 3, 500.00, 2);

CREATE TABLE matdisciplina (
    cdmatdisciplina INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
    cdmatricula INTEGER,
    cddisciplina INTEGER,
    media NUMERIC(7,2),
    status CHAR(2) ,
    cdprofessor INTEGER,
    valor NUMERIC(7,2),
	 FOREIGN KEY (cdmatricula) REFERENCES matricula(cdmatricula),
	 FOREIGN KEY (cddisciplina) REFERENCES disciplina(cddisciplina),
	 FOREIGN KEY (cdprofessor) REFERENCES professor(cdprofessor)   
	 on delete cascade);

    insert into matdisciplina(cdmatricula,cddisciplina, status,valor) 
           values( 1,3,'MT', 500.00),
                 ( 1,1,'MT', 600.00),
                 ( 1,2,'MT', 600.00),
                 ( 1,3,'MT', 500.00),
                 ( 3,10,'MT', 500.00),
                 ( 3,3,'MT', 350.00),
                 ( 3,4,'MT', 400.00),
                 ( 2,5,'MT', 350.00),
                 ( 2,5,'MT', 300.00),
                 ( 8,6,'MT', 660.00),
                 ( 9,7,'MT', 760.00),
                 ( 1,8,'MT', 900.00),
                 ( 1,9,'MT', 800.00);


CREATE TABLE nota (
    cdnota INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
    cdmatdisciplina INTEGER,
    nota NUMERIC(7,2),
    referencia VARCHAR(20) ,
    status CHAR(2),
	 FOREIGN KEY (cdmatdisciplina) REFERENCES matdisciplina(cdmatdisciplina)   
	 on delete cascade);


INSERT INTO nota( cdmatdisciplina, nota, referencia, status)
   values( 1, 8.00, 'Av I',   'AP'),
   (1, 4.00, 'AV II',  'RP'),
   (1, 3.00, 'AV III', 'RP'),
   
   (2, 6.00, 'Av I',   'RP'),
   (2, 4.00, 'AV II',  'RP'),
   (3, 8.00, 'Av I',   'AP'),
   
   (4, 8.00, 'AV I',   'AP'),
   
   (5, 8.00, 'Av I',   'AP'),
   (5, 4.00, 'AV II', 'RP'),
   (5, 3.00, 'AV III','RP'),
   
   (6, 5.00, 'Av I',  'RP'),
   (6, 5.00, 'AV II', 'RP'),
   
   (7, 7.00, 'Av I',  'AP'),
   (7, 3.00, 'AV II',  'RP'),
   (7, 6.00, 'Av III',  'RP'),
   (7, 4.00, 'AV IV',  'RP'),
   
   (8, 9.00, 'AV I',  'AP'),
   
   (9, 10.00, 'AV I', 'AP'),
   (9, 7.00, 'AV II',  'AP'),
   
   (10, 6.00, 'AV I',  'RP'),
	
	
   (11, 3.00, 'AV I', 'AP'),
   (11, 7.00, 'AV II',  'AP'),
   
   (12, 6.00, 'AV I',  'RP'),
   
   (13, 5.00, 'AV I',  'RP'),
   (13, 3.00, 'AV II',  'RP'),
   (13, 4.00, 'AV III',  'RP');