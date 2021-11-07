/*
As tabelas abaixo são referentes á um sistema de uma escola, na qual os alunos
tem matriculas, disciplinas e notas..
identico ao do Ifbaino
*/

SET SCHEMA 'icaro';

CREATE TABLE ALUNO (
    CDALUNO INTEGER PRIMARY KEY  NOT NULL,
    NOME VARCHAR(40) ,
    NMATRICULA VARCHAR(15) ,
    STATUS CHAR(2) );
    
insert into Aluno values (1, 'Antonio Bandeiras', '000102018','MT'),
                         (2, 'Bill Gates',    '00002-2018','MT'),
                         (3, 'Steve Sniack', '00003-2018','MT'),
                         (4, 'Linus Torvals','000404-2018','MT');
                         
CREATE TABLE CURSO (
    CDCURSO INTEGER PRIMARY KEY NOT NULL,
    NOMECURSO VARCHAR(20) ,
    VALOR NUMERIC(7,2));

insert into curso values(10, 'ADS', 800.00),
                        (11, 'Quimica',900.00),
                        (12,  'Agronomia', 1000.00),
                        (13,  'Agroindustria', 1100.00);

CREATE TABLE PROFESSOR (
    CDPROFESSOR INTEGER PRIMARY KEY NOT NULL,
    NOME VARCHAR(40));

insert into professor values(20, 'REINALDA FERNANDES'),
                             (21, 'MARQUESA LIMA'),
                             (22,  'GEORGINA COTRIM'),
                             (23,  'PAULITA FERREIRA'),
                             (24,  'ICARO DIAS');


CREATE TABLE DISCIPLINA (
    CDDISCIPLINA INTEGER PRIMARY KEY NOT NULL,
    NOMEDISCIPLINA varchar(40),
    CDPROFESSOR INTEGER,
    VALOR NUMERIC(7,2),
	 FOREIGN KEY (cdprofessor) REFERENCES professor(cdprofessor)   
	 on delete cascade);

insert into DISCIPLINA values(30, 'ALGORITMO',20,500.00),

                             (31, 'BANCO DE DADOS',21, 600.00),
                             (32, 'TABD',21, 600.00),
                             
                             (33, 'SO',22, 700.00),
			     					  (34, 'SD',22, 700.00),
                             (35, 'IHM',22,700.00),
                             
                             (36, 'ESTAGIO 1',23, 900.00),                             
                             (37, 'ESTAGIO I1',23, 900.00),                             
                             (38, 'ESTATISTICA',23, 900.00),                             
                             (39, 'PORTUGUES',23, 900.00),
									                             
                             (40, 'FISICA 1',24, 1000.00),                             
                             (41, 'ROBOTICA',24, 1000.00);

CREATE TABLE SEMESTRE (
    CDSEMESTRE INTEGER PRIMARY KEY NOT NULL,
    ANO VARCHAR(15));

INSERT INTO SEMESTRE VALUES(50,'2017.1'),
                           (51,'2017.2'),
                           (52,'2018.1'),
                           (53,'2018.2');
                           
CREATE TABLE TURMA (
    CDTURMA INTEGER PRIMARY KEY NOT NULL,
    NOMETURMA VARCHAR(20));

INSERT INTO TURMA VALUES(60,'PROGRAMADORES'),
                        (61,'ANALISTAS');


CREATE TABLE MATRICULA (
    CDMATRICULA INTEGER PRIMARY KEY NOT NULL,
    CDCURSO INTEGER,
    CDALUNO INTEGER,
    CDSEMESTRE INTEGER,
    VALOR NUMERIC(7,2),
    CDTURMA INTEGER,
	 FOREIGN KEY (cdcurso) REFERENCES curso(cdcurso),
	 FOREIGN KEY (cdaluno) REFERENCES aluno(cdaluno),
	 FOREIGN KEY (cdsemestre) REFERENCES semestre(cdsemestre),
	 FOREIGN KEY (cdturma) REFERENCES turma(cdturma)   
	 on delete cascade);


INSERT INTO matricula values( 100, 10, 1, 50,300.00,60),
                            ( 101, 11, 2, 50,400.00,60),
                            ( 102, 12, 3, 50,500.00,61),
                            ( 103, 13, 4, 50,500.00,61),

                            ( 104, 10, 1, 51, 300.00, 60),
                            ( 105, 11, 2, 51, 400.00, 60),
                            ( 106, 12, 3, 51, 500.00, 61),                         
                            ( 107, 13, 4, 51, 500.00, 61),

                            ( 108, 10, 1, 52, 300.00, 60),
                            ( 109, 11, 2, 52, 400.00, 60),
                            ( 110, 12, 3, 53, 500.00, 61),                         
                            ( 111, 13, 4, 53, 500.00, 61);

CREATE TABLE MATDISCIPLINA (
    CDMATDISCIPLINA INTEGER PRIMARY KEY NOT NULL,
    CDMATRICULA INTEGER,
    CDDISCIPLINA INTEGER,
    MEDIA NUMERIC(7,2),
    STATUS CHAR(2) ,
    CDPROFESSOR INTEGER,
    VALOR NUMERIC(7,2),
	 FOREIGN KEY (cdmatricula) REFERENCES matricula(cdmatricula),
	 FOREIGN KEY (cddisciplina) REFERENCES disciplina(cddisciplina),
	 FOREIGN KEY (cdprofessor) REFERENCES professor(cdprofessor)   
	 on delete cascade);

    insert into matdisciplina(cdmatdisciplina,cdmatricula,cddisciplina, status,valor) 
           values( 1,100,30,'MT', 500.00),
                 ( 2,100,31,'MT', 600.00),
                 ( 3,100,32,'MT', 600.00),
                 ( 4,100,33,'MT', 500.00),

                 ( 5,101,30,'MT', 500.00),
                 ( 6,101,33,'MT', 350.00),
                 ( 7,101,34,'MT', 400.00),

                 ( 8,102,35,'MT', 350.00),
                 ( 9,102,35,'MT', 300.00),

                 (10,108,36,'MT', 660.00),
                 (11,109,37,'MT', 760.00),
                 (12,110,38,'MT', 900.00),
                 (13,111,39,'MT', 800.00);


CREATE TABLE NOTA (
    CDNOTA INTEGER PRIMARY KEY NOT NULL,
    CDMATDISCIPLINA INTEGER,
    NOTA NUMERIC(7,2),
    REFERENCIA VARCHAR(20) ,
    STATUS CHAR(2),
	 FOREIGN KEY (cdmatdisciplina) REFERENCES matdisciplina(cdmatdisciplina)   
	 on delete cascade);


INSERT INTO nota( CDNOTA, CDMATDISCIPLINA, NOTA, REFERENCIA, STATUS)
   values(1, 1, 8.00, 'Av I',   'AP'),
   (2, 1, 4.00, 'AV II',  'RP'),
   (3, 1, 3.00, 'AV III', 'RP'),
   
   (4, 2, 6.00, 'Av I',   'RP'),
   (5, 2, 4.00, 'AV II',  'RP'),
   
   (7, 3, 8.00, 'Av I',   'AP'),
   
   (8, 4, 8.00, 'AV I',   'AP'),
   
   (9, 5, 8.00, 'Av I',   'AP'),
   (10, 5, 4.00, 'AV II', 'RP'),
   (11, 5, 3.00, 'AV III','RP'),
   
   (12, 6, 5.00, 'Av I',  'RP'),
   (13, 6, 5.00, 'AV II', 'RP'),
   
   (14, 7, 7.00, 'Av I',  'AP'),
   (15, 7, 3.00, 'AV II',  'RP'),
   (16, 7, 6.00, 'Av III',  'RP'),
   (17, 7, 4.00, 'AV IV',  'RP'),
   
   (18, 8, 9.00, 'AV I',  'AP'),
   
   (19, 9, 10.00, 'AV I', 'AP'),
   (20, 9, 7.00, 'AV II',  'AP'),
   
   (21, 10, 6.00, 'AV I',  'RP'),
	
	
   (22, 11, 3.00, 'AV I', 'AP'),
   (23, 11, 7.00, 'AV II',  'AP'),
   
   (24, 12, 6.00, 'AV I',  'RP'),
   
   (25, 13, 5.00, 'AV I',  'RP'),
   (26, 13, 3.00, 'AV II',  'RP'),
   (27, 13, 4.00, 'AV III',  'RP');

/*
###### exercicios de revisão  ################

1 - Altere o sistema de forma que os alunos ao matricularem nas disciplinas abaixo sejam incluido os professores:
Algoritmo ,Banco de dados,TABD : Reinalda Fernandes
SO, SD, IHM: Georgina Cotrim
Estagio I, estagio II e Estatistica: Marquesa Lima
Portugues, Fisica I e Robotica: Paulita Ferreira
*/

	SET SCHEMA 'icaro';
	
	UPDATE matdisciplina SET cdprofessor = CASE
		WHEN cddisciplina IN (SELECT cddisciplina FROM disciplina WHERE nomedisciplina = 'ALGORITMO' 
		OR nomedisciplina = 'BANCO DE DADOS' OR nomedisciplina = 'TABD') 
		THEN (SELECT cdprofessor FROM professor WHERE nome = 'REINALDA FERNANDES')
		
		WHEN cddisciplina IN (SELECT cddisciplina FROM disciplina WHERE nomedisciplina = 'SO' 
		OR nomedisciplina = 'SD' OR nomedisciplina = 'IHM')
		THEN (SELECT cdprofessor FROM professor WHERE nome = 'MARQUESA LIMA')
		
		WHEN cddisciplina IN (SELECT cddisciplina FROM disciplina WHERE nomedisciplina = 'ESTAGIO 1' 
		OR nomedisciplina = 'ESTAGIO I1' OR nomedisciplina = 'ESTATISTICA')
		THEN (SELECT cdprofessor FROM professor WHERE nome = 'GEORGINA COTRIM')
		
		WHEN cddisciplina IN (SELECT cddisciplina FROM disciplina WHERE nomedisciplina = 'PORTUGUES' 
		OR nomedisciplina = 'FISICA 1' OR nomedisciplina = 'ROBOTICA') 
		THEN (SELECT cdprofessor FROM professor WHERE nome = 'PAULITA FERREIRA')
	END;


/*
2 - Atualize a media e o status das disciplinas em matdisciplina de acordo com os dados lançados na tabela nota.
Para o status utilize a seguinte regra: Média > 7        = AP
                                      				  Média > 3   < 7  = RE
                                      				  Média < 3        = RP
*/


set schema 'icaro';

   UPDATE  matdisciplina  set MEDIA = CASE
		WHEN cdmatdisciplina = 1 THEN (SELECT AVG(nota) FROM nota WHERE cdmatdisciplina = 1)
		WHEN cdmatdisciplina = 2 THEN (SELECT AVG(nota) FROM nota WHERE cdmatdisciplina = 2)
		WHEN cdmatdisciplina = 3 THEN (SELECT AVG(nota) FROM nota WHERE cdmatdisciplina = 3)
		WHEN cdmatdisciplina = 4 THEN (SELECT AVG(nota) FROM nota WHERE cdmatdisciplina = 4)
		WHEN cdmatdisciplina = 5 THEN (SELECT AVG(nota) FROM nota WHERE cdmatdisciplina = 5)
		WHEN cdmatdisciplina = 6 THEN (SELECT AVG(nota) FROM nota WHERE cdmatdisciplina = 6)
		WHEN cdmatdisciplina = 7 THEN (SELECT AVG(nota) FROM nota WHERE cdmatdisciplina = 7)
		WHEN cdmatdisciplina = 8 THEN (SELECT AVG(nota) FROM nota WHERE cdmatdisciplina = 8)
		WHEN cdmatdisciplina = 9 THEN (SELECT AVG(nota) FROM nota WHERE cdmatdisciplina = 9)
		WHEN cdmatdisciplina = 10 THEN (SELECT AVG(nota) FROM nota WHERE cdmatdisciplina = 10)
		WHEN cdmatdisciplina = 11 THEN (SELECT AVG(nota) FROM nota WHERE cdmatdisciplina = 11)
		WHEN cdmatdisciplina = 12 THEN (SELECT AVG(nota) FROM nota WHERE cdmatdisciplina = 12)
		WHEN cdmatdisciplina = 13 THEN (SELECT AVG(nota) FROM nota WHERE cdmatdisciplina = 13)
	END;
	
	UPDATE matdisciplina 
	SET status =  CASE
		WHEN cdmatdisciplina IN (SELECT cdmatdisciplina FROM matdisciplina WHERE media >= 7) THEN 'AP'
		WHEN cdmatdisciplina IN (SELECT cdmatdisciplina FROM matdisciplina WHERE media > 3 AND  media < 7) THEN 'RE'
		WHEN cdmatdisciplina IN (SELECT cdmatdisciplina FROM matdisciplina WHERE media <= 3) THEN 'RP'
	END;
	
/*
3 - Atualize o status da tabela aluno baseada na media da tabela matdisciplina, utilize as seguintes regras: 
                                - Se o aluno tiver 1 disciplina reprovada, status = CO
                                - Se o aluno tiver mais de uma disciplina reprovada,  status = RP,
                                - Nenhuma disciplina reprovada, status = AP
*/

	set schema 'icaro';
	
	
	update aluno 
	set status = 'CO'
	from matricula
	where aluno.cdaluno = matricula.cdaluno and
	(select count(cdmatdisciplina) from matdisciplina where status like 'RP')= 1;
	
	update aluno 
	set status = 'RP'
	from matricula
	where aluno.cdaluno = matricula.cdaluno and
	(select count(cdmatdisciplina) from matdisciplina where status like 'RP')> 1;
	
	update aluno 
	set status = 'AP'
	from matricula
	where aluno.cdaluno = matricula.cdaluno and
	(select count(cdmatdisciplina) from matdisciplina where status like 'RP')< 1;
		 
/*
4 - Faça uma consulta que mostre: o nome do aluno, o nome da disciplina, a média e o status do aluno na disciplina
*/

	set schema 'icaro';
	
	SELECT a.nome, d.nomedisciplina, mt.media, mt.status
	FROM aluno AS a
	INNER JOIN matricula AS m
	ON m.cdaluno = a.cdaluno
	INNER JOIN matdisciplina AS mt
	ON mt.cdmatricula = m.cdmatricula
	INNER JOIN disciplina AS d
	ON d.cddisciplina = mt.cddisciplina;
	

5 - Faça uma consulta que mostre: o nome do aluno, o nome da disciplina, a nota, a referencia e o status, somente dos alunos matriculados no 
semestre 2017.1

	set schema 'icaro';


	SELECT a.nome, d.nomedisciplina, nota.nota, nota.referencia, nota.status
	FROM aluno AS a
	INNER JOIN matricula AS m
	ON m.cdaluno = a.cdaluno
	INNER JOIN matdisciplina AS mt
	ON mt.cdmatricula = m.cdmatricula
	INNER JOIN disciplina AS d
	ON d.cddisciplina = mt.cddisciplina
	INNER JOIN nota
	ON nota.CDMATDISCIPLINA = mt.CDMATDISCIPLINA
	INNER JOIN semestre as s
	ON s.cdsemestre = m.cdsemestre
	where s.ano = '2017.1';
	
6 -Após as inserções dos dados, Faça um código para apagar a tabela matdisciplina.


	DROP TABLE matdisciplinas;



7 -Faça uma consulta para mostrar o aluno que pagou o valor maior no semestre 2017.1(matricula + disciplinas)


	set schema 'icaro';

	SELECT a.nome, sum(mt.valor) + m.valor MaiorValor
	FROM aluno a
	INNER JOIN matricula m
	ON m.cdaluno = a.cdaluno
	INNER JOIN matdisciplina mt
	ON mt.cdmatricula = m.cdmatricula
	INNER JOIN disciplina d
	ON d.cddisciplina = mt.cddisciplina
	INNER JOIN semestre s
	ON s.cdsemestre = m.cdsemestre
	where s.ano = '2017.1'
	group by a.nome, m.valor
	ORDER BY maiorvalor DESC
	LIMIT 1;		   
					  
		  	

8 -faça uma consulte que mostre a disciplina(s) com  mais reprovação: apresente nome da diciplina, professor.


	SET SCHEMA 'icaro';

	SELECT p.nome, COUNT(d.nomedisciplina) quantReprovados, d.nomedisciplina
	FROM disciplina d
	JOIN professor p
	ON p.cdprofessor = d.cdprofessor
	JOIN  matdisciplina md
	ON  d.cddisciplina = md.cddisciplina 
	WHERE md.status = 'RE'
	GROUP BY d.nomedisciplina, p.nome
	ORDER BY quantReprovados DESC 
	LIMIT 1;
	
	
	
9 - mostre quantos alunos foram reprovados em algoritmo.


	set schema 'icaro';
	
	SELECT count(a.nome) AlunosReprovados
	FROM aluno a
	INNER JOIN matricula m
	ON m.cdaluno = a.cdaluno
	INNER JOIN matdisciplina mt
	ON mt.cdmatricula = m.cdmatricula
	INNER JOIN disciplina d
	ON d.cddisciplina = mt.cddisciplina
	where d.nomedisciplina = 'ALGORITMO' 
	AND mt.status = 'RE';




SET SCHEMA 'icaro';


CREATE OR REPLACE FUNCTION alunoreturn() 
RETURNs text AS $$
BEGIN
		IF ((SELECT aluno.cdaluno FROM aluno WHERE aluno.cdaluno = 1)= 1) then
 		RETURN 'deu certo até aqui';
 		END IF;
END;
$$ LANGUAGE 'plpgsql';

select alunoreturn();



SET SCHEMA 'icaro';

CREATE OR REPLACE FUNCTION procurar_aluno_pelo_id(idaluno integer) 
RETURNs text AS $$
BEGIN
	IF ((SELECT aluno.cdaluno FROM aluno WHERE aluno.cdaluno = idaluno) between 0 and 
		(SELECT count(aluno.cdaluno) FROM aluno)) then
 		RETURN 'o id '||idaluno||' pertence ao aluno: '||
		(SELECT aluno.nome FROM aluno WHERE aluno.cdaluno = idaluno);
	else
 		RETURN 'o id '||idaluno||' pertence a nenhum aluno';
 	END IF;
END;
$$ LANGUAGE 'plpgsql';

select qual_e_o_aluno(4);


SET SCHEMA 'icaro';

CREATE OR REPLACE FUNCTION procurar_aluno_pelo_id(idaluno integer) 
RETURNs text AS $$
BEGIN
	IF ((SELECT aluno.cdaluno FROM aluno WHERE aluno.cdaluno = idaluno) between 0 and 
		(SELECT count(aluno.cdaluno) FROM aluno)) then
 		RETURN 'o id '||idaluno||' pertence ao aluno: '||
		(SELECT aluno.nome FROM aluno WHERE aluno.cdaluno = idaluno);
	else
 		RETURN 'o id '||idaluno||' pertence a nenhum aluno';
 	END IF;
END;
$$ LANGUAGE 'plpgsql';

select procurar_aluno_pelo_id(5);





