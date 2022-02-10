


SET SCHEMA 'prova';


-- Questão 1
CRIE UMA VISÃO PARA MOSTRAR OS ALUNOS DE ADS 
QUE ESTÃO MATRICULADOS NO SEMESTRE
2020.2 E SÃO DA TURMA DE ANALISTAS OU 
SÃO DA TURMA DE PROGRAMADORES E O STATUS DO ALUNO
É DIFERENTE DE NULO

ESCOPO:
NOME DA VIEW: MOSTRAALUNOMATRICULA
DEVE APRESENTAR OS ATRIBUTOS: NOME DO 
ALUNO, VALORMATRICULA, NOMETURMA, ANO, NOMECURSO


SET SCHEMA 'prova';


CREATE OR REPLACE VIEW MOSTRAALUNOMATRICULA as
SELECT a.nome, m.valormatricula, t.nometurma, s.ano, c.nomecurso
	FROM aluno AS a
	JOIN matricula AS m
	ON m.cdaluno = a.cdaluno
	JOIN turma AS t
	ON m.cdturma = t.cdturma
	JOIN curso AS c
	ON m.cdcurso = c.cdcurso
	JOIN matdisciplina AS mt
	ON mt.cdmatricula = m.cdmatricula
	JOIN disciplina AS d
	ON d.cddisciplina = mt.cddisciplina
	JOIN semestre as s
	ON s.cdsemestre = m.cdsemestre
	where s.ano = '2020.2'
	AND m.cdturma IN (SELECT cdturma FROM turma 
	WHERE nometurma = 'PROGRAMADORES' OR nometurma = 'ANALISTAS')
	AND c.nomecurso = 'ADS'
	AND a.status IS NOT NULL;

SELECT * FROM MOSTRAALUNOMATRICULA;

-- Questão 2

FAÇA UMA FUNÇão PARA SOMAR O VALOR PAGO PELO ALUNO BILL 
NA MATRICULA NO SEMESTRE 2021.1 E NO SEMESTRE 2020.2
ESCOPO:

set schema 'prova';

CREATE OR REPLACE FUNCTION VALORPAGO(IN pnomeAluno VARCHAR(40))
RETURNS DOUBLE PRECISION AS $$
DECLARE total DOUBLE PRECISION;
BEGIN
	total = (SELECT SUM(m.valormatricula)
	FROM aluno AS a
	JOIN matricula AS m
	ON m.cdaluno = a.cdaluno
	JOIN semestre as s
	ON s.cdsemestre = m.cdsemestre
	where s.ano = '2021.1' OR  s.ano = '2020.2' 
	AND a.nome = pnomeAluno);
RETURN total;
END;
$$ LANGUAGE plpgsql;

select * from VALORPAGO('BILL');



-- Questão 3


FAÇA UMA FUNÇÃO QUE INSIRA ALUNOS E MATRICULE-OS EM DISCIPLINAS.
TODA VEZ QUE INSERIR UM ALUNO DO CURSO DE ADS DEVE FAZER A MATRICULA DELE
NO SEMESTRE 2021.2, NA TURMA ANALISTAS, STATUS = MT E
INSERIR AS DISCIPLINAS TABD E BD.

Chamada da função:
select * from matriculaaluno(10,'Carloto','000-91','ADS')
set schema 'prova';
CREATE or replace FUNCTION MATRICULAALUNO(PCDALUNO INT,PNOMEALUNO VARCHAR,PNUMMATRICULA VARCHAR,PNOMECURSO VARCHAR)
RETURNS void AS $$
DECLARE PCDCURSO INTEGER;
DECLARE PCDSEMESTRE INTEGER;
DECLARE PCDDISCIPLINA INTEGER;
DECLARE PCDDISCIPLINA1 INTEGER;
DECLARE PCDMATRICULA INTEGER;
DECLARE PCDTURMA INTEGER;
DECLARE PSTATUS VARCHAR;
DECLARE PVALOR NUMERIC;

BEGIN
PVALOR = 444;
PSTATUS = 'MT';
PCDTURMA = (SELECT cdturma FROM turma WHERE nometurma = 'ANALISTAS');
PCDCURSO = (SELECT cdcurso FROM curso WHERE nomecurso = PNOMECURSO);
PCDMATRICULA = (SELECT MAX(cdmatricula)+1 FROM matricula);
PCDSEMESTRE = (SELECT cdsemestre FROM semestre WHERE ano= '2021.1');
PCDDISCIPLINA = (SELECT cddisciplina FROM disciplina WHERE nomedisciplina = 'TABD');
PCDDISCIPLINA1 = (SELECT cddisciplina FROM disciplina WHERE nomedisciplina = 'TABD');

	INSERT INTO aluno VALUES (PCDALUNO, PNOMEALUNO, PNUMMATRICULA, PSTATUS);
	INSERT INTO matricula VALUES( PCDMATRICULA, PCDCURSO, PCDALUNO, PCDSEMESTRE,PVALOR,PCDTURMA);
	insert into matdisciplina(cdmatdisciplina,cdmatricula,cddisciplina, status,valor) 
	values( (SELECT MAX(cdmatdisciplina)+1 FROM matdisciplina),PCDMATRICULA,PCDDISCIPLINA,PSTATUS, PVALOR);
	insert into matdisciplina(cdmatdisciplina,cdmatricula,cddisciplina, status,valor)
	values( (SELECT MAX(cdmatdisciplina)+1 FROM matdisciplina),PCDMATRICULA,PCDDISCIPLINA1,PSTATUS, PVALOR);


END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION MATRICULAALUNO(PCDALUNO INT,PNOMEALUNO VARCHAR,PNUMMATRICULA VARCHAR,PNOMECURSO VARCHAR) 
RETURNS void AS $$
DECLARE  PCDCURSO INTEGER;
DECLARE  PCDSEMESTRE INTEGER;
DECLARE  PCDTURMA INTEGER;
DECLARE PSTATUS VARCHAR;
DECLARE PVALOR NUMERIC(7.2);

BEGIN
  PVALOR = 300;
  PSTATUS = MT;
  PCDCURSO = (SELECT CDCURSO FROM CURSO WHERE NOMECURSO = PNOMECURSO);
  PCDSEMESTRE = (SELECT CDSEMESTRE FROM SEMESTRE WHERE SEMESTRE.ANO = '2021.2');
  PCDTURMA = (SELECT CDTURMA FROM TURMA WHERE TURMA.NOMETURMA = 'ANALISTAS');
  
IF (PCDCURSO = 10) THEN
  BEGIN
	insert into Aluno 
	values (pcdaluno, PNOMEALUNO, PNUMMATRICULA, PSTATUS);

	INSERT INTO matricula 
	values( 113, PCDCURSO, pcdaluno, PCDSEMESTRE,PVALOR,PCDTURMA);

	insert into matdisciplina(cdmatdisciplina,cdmatricula,cddisciplina, status,valor) 
	values( 20,113,31,'MT', 500.00),           
	      ( 21,113,32,'MT', 500.00);          
	end;
  END IF;
END;
$$ LANGUAGE plpgsql;

-- Questão 4



Faça uma view para listar todas as notas do aluno BILL do semestre 2020.2
ESCOPO:
NOME DA VIEW: LISTAALUNOS
DEVE APRESENTAR OS ATRIBUTOS: NOME DA DISCIPLINA, NOTA, REFERENCIA, STATUS e ANO



CREATE VIEW LISTAALUNOS as

	SELECT a.nome, d.nomedisciplina, nota.nota, nota.referencia, nota.status, s.ano
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
	where s.ano = '2020.2'
	AND a.nome = 'BILL';




-- Questão 5





FAÇA UMA FUNÇÃO PARA MOSTRAR A MEDIA DAS NOTAS DO ALUNO
LINUS DA DISCIPLINA ALGORITMO

CREATE OR REPLACE FUNCTION MOSTRAMEDIA(PNOMEALUNO VARCHAR, PNOMEDISCIPLINA varchar)
RETURNS DOUBLE PRECISION AS $$
DECLARE MEDIA DOUBLE PRECISION;
BEGIN
	MEDIA = select avg(nota) from nota as n
		join matdisciplina as mtd 
		on (n.cdmatdisciplina = mtd.cdmatdisciplina)
		join disciplina as d 
		on (mtd.cddisciplina = d.cddisciplina)
		join matricula as m 
		on (mtd.cdmatricula = m.cdmatricula)
		join aluno as a 
		on (a.cdaluno = m.cdaluno)
	where a.nome = PNOMEALUNO AND d.nomedisciplina = PNOMEDISCIPLINA;
RETURN MEDIA;
END;
$$ LANGUAGE plpgsql;




-- Questão 6

Referente ao modelo relacional faça um codigo para alterar na tabela aluno o atributo
status para statusaluno
e adicione o atributo cpf e remova da tabela semestre o atributo semestreatual


ALTER TABLE aluno RENAME COLUMN status TO statusaluno;
ALTER TABLE aluno ADD COLUMN cpf VARCHAR(13);
ALTER TABLE aluno DROP COLUMN semestreatual;



ALTER TABLE aluno{
RENAME COLUMN status TO statusaluno;
ADD COLUMN cpf VARCHAR(13);
DROP COLUMN semestreatual};





SET SCHEMA 'prova';


CREATE OR REPLACE VIEW MOSTRAALUNOMATRICULA as
SELECT a.nome, m.valormatricula, t.nometurma, s.ano, c.nomecurso
	FROM aluno AS a
	JOIN matricula AS m
	ON m.cdaluno = a.cdaluno
	JOIN turma AS t
	ON m.cdturma = t.cdturma
	JOIN curso AS c
	ON m.cdcurso = c.cdcurso
	JOIN matdisciplina AS mt
	ON mt.cdmatricula = m.cdmatricula
	JOIN disciplina AS d
	ON d.cddisciplina = mt.cddisciplina
	JOIN nota
	ON nota.CDMATDISCIPLINA = mt.CDMATDISCIPLINA
	JOIN semestre as s
	ON s.cdsemestre = m.cdsemestre
	where s.ano = '2020.2'
	AND m.cdturma IN (SELECT cdturma FROM turma 
	WHERE nometurma = 'PROGRAMADORES' OR nometurma = 'ANALISTAS')
	AND a.status != NULL;

SELECT * FROM MOSTRAALUNOMATRICULA;

