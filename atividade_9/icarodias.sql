
set schema 'icaro';

CREATE TABLE ALUNO (

    CDALUNO INTEGER NOT NULL,

    NOME VARCHAR(40) ,

    NMATRICULA VARCHAR(15) ,

    STATUS CHAR(2) );





insert into Aluno values (1, 'ANTONIO', '00001-2021', 'MT'),

                         (2, 'BILL',    '00002-2021', 'MT'),

                         (3, 'STEVE',   '00003-2021', 'MT'),

                         (4, 'LINUS',   '00004-2021', 'MT'),

                         (5, 'JOBS',    '00005-2021', 'MT'),

                         (6, 'ADA',     '00006-2021', 'MT'),

                         (7, 'TURING',   '00007-2021', 'MT');

                         

                  





CREATE TABLE CURSO (

    CDCURSO INTEGER NOT NULL,

    NOMECURSO VARCHAR(20) ,

    VALORCURSO NUMERIC(7,2));



insert into curso values(10, 'ADS', 800.00),

                        (11, 'QUIMICA',900.00),

                        (12, 'AGRONOMIA', 1000.00),

                        (13, 'AGROINDUSTRIA', 1100.00);



CREATE TABLE PROFESSOR (

    CDPROFESSOR INTEGER NOT NULL,

    NOME VARCHAR(40));



insert into professor values(20,  'GEORGE'),

                             (21, 'NAIDSON'),

                             (22, 'FABIO'),

                             (23, 'WOQUITON'),

                             (24, 'BARBARA'),

                             (25, 'ALEX'),

                             (26, 'LEANDRO');





CREATE TABLE DISCIPLINA (

    CDDISCIPLINA INTEGER NOT NULL,

    NOMEDISCIPLINA varchar(40),

    VALOR NUMERIC(7,2));







insert into DISCIPLINA values(30, 'ALGORITMO',500.00),

                             (31, 'BD', 600.00),

                             (32, 'TABD', 600.00),

                             (33, 'SO', 700.00),

                             (34, 'RUMINANTES', 800.00),

                             (35, 'PLANTAS', 800.00),

                             (36, 'REMEDIOS',500.00);

            			     

                                                        



CREATE TABLE SEMESTRE (

    CDSEMESTRE INTEGER NOT NULL,

    ANO VARCHAR(15));



INSERT INTO SEMESTRE VALUES(50,'2020.2'),

                           (51,'2021.1'),

                           (52,'2021.2');



CREATE TABLE TURMA (

    CDTURMA INTEGER NOT NULL,

    NOMETURMA VARCHAR(20)) ;



INSERT INTO TURMA VALUES(60,'PROGRAMADORES'),

                        (61,'ANALISTAS'),

                        (62, 'AGRONOMOS'),

                        (63, 'QUIMICOS');





CREATE TABLE MATRICULA (

    CDMATRICULA INTEGER NOT NULL,

    CDCURSO INTEGER,

    CDALUNO INTEGER,

    CDSEMESTRE INTEGER,

    VALORMATRICULA NUMERIC(7,2),

    CDTURMA INTEGER);



INSERT INTO matricula values( 100, 10, 1, 50,300.00,60),

                            ( 101, 10, 2, 50,400.00,60),

                            ( 102, 10, 3, 50,500.00,61),

                            ( 103, 10, 4, 50,500.00,61),



                            ( 104, 10, 1, 51, 300.00, 60),

                            ( 105, 10, 2, 51, 400.00, 60),

                            ( 106, 10, 3, 51, 500.00, 61),                         

                           

                            ( 108, 10, 1, 52, 300.00, 60),

                            ( 109, 10, 2, 52, 400.00, 60),

 

                            ( 110, 11, 5, 52, 500.00, 63),                         

                            ( 111, 12, 6, 52, 500.00, 62),

                            

                            ( 112, 11, 5, 50, 500.00, 63);                     ;



CREATE TABLE MATDISCIPLINA (

    CDMATDISCIPLINA INTEGER NOT NULL,

    CDMATRICULA INTEGER,

    CDDISCIPLINA INTEGER,

    MEDIA NUMERIC(7,2),

    STATUS CHAR(2) ,

    CDPROFESSOR INTEGER,

    VALOR NUMERIC(7,2));



insert into matdisciplina(cdmatdisciplina,cdmatricula,cddisciplina, status,valor) 

           values( 1,100,30,'MT', 500.00),           

				 ( 2,101,30,'MT', 600.00),

                 ( 3,102,30,'MT', 600.00),

				 ( 4,103,30,'MT', 500.00),

				 

				 ( 5,100,31,'MT', 500.00),           

				 ( 6,101,31,'MT', 600.00),

                 ( 7,102,31,'MT', 600.00),

				 ( 8,103,31,'MT', 500.00),

				 

				 

				 ( 9,104,32,'MT', 500.00),           

				 ( 10,105,32,'MT', 600.00),

                 ( 11,106,32,'MT', 600.00),

				 

				 (12,104,33,'MT', 500.00),           

				 ( 13,105,33,'MT', 600.00),

                 ( 14,106,33,'MT', 600.00),

				 

				 ( 15,108,33,'MT', 600.00),

                 ( 16,109,33,'MT', 600.00),

				 

				 

				 ( 17,110,35,'MT', 600.00),

				 ( 18,112,35,'MT', 600.00),

				 

				 ( 19,111,34,'MT', 600.00);







CREATE TABLE NOTA (

   CDNOTA INTEGER NOT NULL,

   CDMATDISCIPLINA INTEGER,

   NOTA NUMERIC(7,2),

   REFERENCIA VARCHAR(20) ,

   STATUS CHAR(2));


  insert into nota ( CDNOTA, CDMATDISCIPLINA, NOTA, REFERENCIA, STATUS)values



   (1, 1, 8.00, 'Av I',   'AP'),

   (2, 1, 4.00, 'AV II',  'RP'),

   (3, 1, 3.00, 'AV III', 'RP'),

   

   (4, 2, 6.00, 'Av I',   'RP'),

   (5, 2, 4.00, 'AV II',  'RP'),

   (6, 2, 8.00, 'Av I',   'AP'),

   

   (8, 3, 8.00, 'AV I',   'AP'),

   (9, 3, 8.00, 'Av II',   'AP'),

   (10, 3, 4.00, 'AV III', 'RP'),

   (11, 3, 3.00, 'AV IV','RP'),

   

   (12, 4, 5.00, 'Av I',  'RP'),

   (13, 4, 5.00, 'AV II', 'RP'),

   

   (14, 5, 7.00, 'Av I',  'AP'),

   (15, 5, 3.00, 'AV II',  'RP'),

   (16, 5, 6.00, 'Av III',  'RP'),

   (17, 5, 4.00, 'AV IV',  'RP'),

   

   (18, 6, 9.00, 'AV I',  'AP'),
   

   (19, 6, 10.00, 'AV I', 'AP'),

   (20, 7, 7.00, 'AV II',  'AP'),
   

   (21, 8, 6.00, 'AV I',  'RP'),
   
   (22, 9, 6.00, 'AV I',  'RP'),

   (23, 10, 4.00, 'AV I',  'RP'),

   (24, 11, 3.00, 'AV I',  'RP'),

   (25, 12, 4.00, 'AV I',  'RP'),

   (26, 14, 2.00, 'AV I',  'RP'),

   (27, 15, 1.00, 'AV I',  'RP'),

   (28, 16, 4.00, 'AV I',  'RP'),

   (29, 17, 3.00, 'AV I',  'RP'),

   (30, 18, 2.00, 'AV I',  'RP'),

   (31, 19, 5.00, 'AV I',  'RP');
   

--- {

CREATE TABLE EMPRESTIMO(
	
	CDEMPRESTIMO INTEGER NOT NULL,
	
	DATAEMPRESTIMO DATE NOT NULL DEFAULT CURRENT_DATE,
	
	DATADEVOLUCAO DATE,
	
	CDALUNO INTEGER
	);

INSERT INTO emprestimo(cdemprestimo, dataemprestimo, cdaluno) VALUES
	(1, '2020-08-01', 2),
	(2, '2018-05-25', 5),
	(3, '2018-02-21', 3),
	(4, '2017-04-15', 1),
	(5, '2017-02-19', 2);



CREATE TABLE EMPRESTIMOEXEMPLAR(
	
	CDEMPRESTIMOEXEMPLAR INTEGER NOT NULL,
	
	CDEXEMPLAR INTEGER NOT NULL,
	
	CDEMPRESTIMO INTEGER NOT NULL
	);

INSERT INTO emprestimoexemplar(cdemprestimoexemplar, cdexemplar, cdemprestimo) VALUES
	(1, 2, 3),
	(2, 3, 2),
	(3, 1, 1);

CREATE TABLE EXEMPLAR(
	
	CDPUBLICACAO INTEGER NOT NULL,
	
	CDEXEMPLAR INTEGER NOT NULL,
	
	NUMEROEXEMPLAR VARCHAR(10),
	
	STATUS VARCHAR(10)
	);

INSERT INTO exemplar(cdexemplar, cdpublicacao, numeroexemplar, status) VALUES
	(1, 3, 23, 'false'),
	(2, 3, 23, 'true'),
	(3, 3, 23, 'false');

CREATE TABLE PUBLICACAO(
	
	CDPUBLICACAO INTEGER NOT NULL,
	
	CDAUTOR INTEGER NOT NULL,
	
	CDEDITORA INTEGER NOT NULL
	);

INSERT INTO publicacao(cdpublicacao, cdautor, cdeditora) VALUES
	(1, 1, 2),
	(2, 3, 2),
	(3, 2, 3);

CREATE TABLE AUTOR(

	CDAUTOR INTEGER NOT NULL,
	
	NOMEAUTOR VARCHAR(40)
	);

INSERT INTO autor(cdautor, nomeautor) VALUES
	(1, 'Vennom'),
	(2, 'Sheck'),
	(3, 'Pepa');

CREATE TABLE EDITORA(

	CDEDITORA INTEGER NOT NULL,
	
	NOMEEDITORA VARCHAR(40)
	);

INSERT INTO editora(cdeditora, nomeeditora) VALUES
	(1, 'Seja'),
	(2, 'NewDay'),
	(3, 'NoticPay');

---- }


alter table aluno add primary key(cdaluno);

alter table professor add primary key(cdprofessor);

alter table CURSO add primary key(cdCURSO);

alter table DISCIPLINA add primary key(cdDISCIPLINA);

alter table SEMESTRE add primary key(cdSEMESTRE);

 alter table TURMA add primary key(cdTURMA);

alter table MATRICULA add primary key(cdMATRICULA);

alter table MATdisciplina add primary key(cdMATdisciplina);


----- {

alter table emprestimo add primary key(cdemprestimo);

alter table EmprestimoExemplar add primary key(cdemprestimoexemplar);

alter table Exemplar add primary key(cdexemplar);

alter table Publicacao add primary key(cdpublicacao);

alter table Autor add primary key(cdautor);

alter table Editora add primary key(cdeditora);

----- }



ALTER TABLE matricula ADD CONSTRAINT FK_CD_curso FOREIGN KEY (cdcurso) REFERENCES curso(CDcurso);

ALTER TABLE matricula ADD CONSTRAINT FK_CD_semestre FOREIGN KEY (cdsemestre) REFERENCES semestre(CDsemestre);

ALTER TABLE matricula ADD CONSTRAINT FK_CD_aluno FOREIGN KEY (cdaluno) REFERENCES aluno(CDaluno);

ALTER TABLE matricula ADD CONSTRAINT FK_CD_turma FOREIGN KEY (cdturma) REFERENCES turma(CDturma);


ALTER TABLE matdisciplina ADD CONSTRAINT FK_CD_matricula FOREIGN KEY (cdmatricula) REFERENCES matricula(CDmatricula);

ALTER TABLE matdisciplina ADD CONSTRAINT FK_CD_professor FOREIGN KEY (cdprofessor) REFERENCES professor(CDprofessor);

ALTER TABLE matdisciplina ADD CONSTRAINT FK_CD_diciplina FOREIGN KEY (cddisciplina) REFERENCES disciplina(CDdisciplina);


ALTER TABLE nota ADD CONSTRAINT FK_CD_matdisc FOREIGN KEY (cdmatdisciplina) REFERENCES matdisciplina(CDmatdisciplina);



----{

ALTER TABLE emprestimo ADD CONSTRAINT FK_CD_aluno FOREIGN KEY (cdaluno) REFERENCES aluno(cdaluno);

ALTER TABLE emprestimoexemplar ADD CONSTRAINT FK_CD_emprestimo FOREIGN KEY (cdemprestimo) REFERENCES emprestimo(cdemprestimo);

ALTER TABLE emprestimoexemplar ADD CONSTRAINT FK_CD_exemplar FOREIGN KEY (cdexemplar) REFERENCES exemplar(cdexemplar);

ALTER TABLE exemplar ADD CONSTRAINT FK_CD_publicacao FOREIGN KEY (cdpublicacao) REFERENCES publicacao(cdpublicacao);

ALTER TABLE publicacao ADD CONSTRAINT FK_CD_autor FOREIGN KEY (cdautor) REFERENCES autor(cdautor);

ALTER TABLE publicacao ADD CONSTRAINT FK_CD_editora FOREIGN KEY (cdeditora) REFERENCES editora(cdeditora);



---- }

set schema 'teste';

-- Fazer  a procedure/function para executar o empréstimo de livros para alunos do curso de ads.

CREATE OR REPLACE FUNCTION emprestimolivro(IN PnomeAluno VARCHAR(40), IN PcdExemplar INTEGER)
RETURNS VOID AS
$$
DECLARE VcdEmprestimo INTEGER;
DECLARE VcdEmprestimoExemplar INTEGER;
DECLARE VcdAluno INTEGER;
DECLARE Vstatus VARCHAR(10);
	
BEGIN
	VcdEmprestimo = (SELECT (MAX(cdemprestimo))+1 FROM emprestimo);	
	VcdAluno = (SELECT cdaluno FROM aluno where nome = PnomeAluno);
	Vstatus = (SELECT status FROM exemplar WHERE cdexemplar = Pcdexemplar);
	VcdEmprestimoExemplar = (SELECT (MAX(cdemprestimoexemplar))+1 FROM emprestimoexemplar);
	
	if (VcdEmprestimo is null) then VcdEmprestimo = 1; end if;
	if (VcdEmprestimoExemplar is null) then VcdEmprestimoExemplar = 1 ;end if;
	
	IF (VcdAluno in (SELECT a.cdaluno FROM aluno a
					JOIN matricula m
					ON m.cdaluno = a.cdaluno
					WHERE m.cdcurso = (SELECT cdcurso 
					FROM curso WHERE nomecurso = 'ADS'))) THEN	
		IF (Vstatus = 'true') THEN	
			INSERT INTO emprestimo(cdemprestimo, cdaluno) VALUES
				(VcdEmprestimo, VcdAluno);
	
			INSERT INTO emprestimoexemplar(cdemprestimoexemplar, cdexemplar,cdemprestimo) VALUES
				(Vcdemprestimoexemplar, Pcdexemplar, VcdEmprestimo);
			UPDATE exemplar SET status = 'false' WHERE cdexemplar = Pcdexemplar;
		ELSE 
			RAISE EXCEPTION 'Este exemplar não esta diponivel';
		END IF;
	END IF;
END;
$$ LANGUAGE plpgsql;



---- }


select emprestimolivro('BILL', 1);


---- { 

-- -Fazer um function para devolver os livros que foram emprestados.

CREATE OR REPLACE FUNCTION devolverlivro(IN PnomeAluno VARCHAR(40), IN PcdExemplar integer)
RETURNS VOID AS
$$
DECLARE VcdEmprestimoExemplar INTEGER;
DECLARE Vstatus VARCHAR(10);

BEGIN
	Vstatus = (SELECT status FROM exemplar WHERE cdexemplar = Pcdexemplar);
	VcdEmprestimoExemplar = (select MAX(e.cdemprestimo) from emprestimo e
		join emprestimoexemplar ee
		on e.cdemprestimo = ee.cdemprestimo
		where cdaluno = (select cdaluno from aluno where nome = PnomeAluno)
		and cdexemplar = PcdExemplar);
	
	IF (Vstatus = 'false') THEN		
		IF (VcdEmprestimoExemplar > 0) THEN	
			UPDATE exemplar SET status = 'true' WHERE cdexemplar = Pcdexemplar;

			UPDATE emprestimo SET datadevolucao = CURRENT_DATE 
			WHERE cdemprestimo = VcdEmprestimoExemplar;
		ELSE 
			RAISE EXCEPTION 'Aluno não encontrado';
		END IF;

	ELSE 
		RAISE EXCEPTION 'Este exemplar ja foi devolvido';
	END IF;
		
END;
$$ LANGUAGE plpgsql;

---- }


select devolverlivro('BILL', 1);
