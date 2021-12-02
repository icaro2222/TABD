


SET SCHEMA 'icaro';





CREATE OR REPLACE PROCEDURE updateProfessor(nome VARCHAR(40), nomedisciplina varcgar(40))
LANGUAGE sql
AS 
$$
	update matdisciplina 
	set cdprofessor = (select cdprofessor from professor where nome = nomeprofessor)
	where cddisciplina = (select cddisciplina from disciplina where nomedisciplina = nomedisciplina);

$$;


call updateProfessor();


 

SET SCHEMA 'icaro';



CREATE OR REPLACE PROCEDURE contDisSem(nomeAluno VARCHAR(40), anoSemestre varchar(40))
LANGUAGE sql
AS 
$$
	select count(m.cdsemestre) from aluno a
	join matricula m
	on a.cdaluno = m.cdaluno
	join matdisciplina md
	on m.cdmatricula = md.cdmatricula
	where a.nome = nomeAluno
	and m.cdsemestre in (select cdsemestre from semestre where ano = anoSemestre);

$$;


call contDisSem('Antonio Bandeiras', '2017.1');


 
SET SCHEMA 'icaro';
CREATE OR REPLACE function contDisSem(nomeAluno VARCHAR(40), anoSemestre varchar(40)) returns integer
AS 
$$
	BEGIN
	RETURN (select count(m.cdsemestre) from aluno a
	join matricula m
	on a.cdaluno = m.cdaluno
	join matdisciplina md
	on m.cdmatricula = md.cdmatricula
	join semestre s
	on m.cdsemestre = s.cdsemestre
	where a.nome = nomeAluno
	and s.ano = anoSemestre);
	END;
$$ LANGUAGE plpgsql;
select contDisSem('Antonio Bandeiras', '2017.1');