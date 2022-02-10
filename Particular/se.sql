

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
	AND a.status != (NULL);

SELECT * FROM MOSTRAALUNOMATRICULA;