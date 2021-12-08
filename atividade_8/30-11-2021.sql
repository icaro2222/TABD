


set schema 'icaro';

CREATE OR REPLACE PROCEDURE inserirAluno(id integer, nome VARCHAR(40), nmatricula VARCHAR(15),status CHAR(2))
LANGUAGE sql
AS 
$$
	INSERT INTO aluno(cdaluno, nome,nmatricula, status) VALUES(id, nome, nmatricula, status);
	
$$;

call inserirAluno(11, 'zeca', '000405-2018', 'AP');




CREATE OR REPLACE PROCEDURE inclementaAluno()
LANGUAGE sql
AS RETURN INT
$$
	RETURN (	SELECT MAX(cdaluno) FROM aluno;);
$$;


call updateAluno('Bill Gates');




CREATE OR REPLACE PROCEDURE updateAluno(nomedoaluno VARCHAR(40))
LANGUAGE sql
AS 
$$
	update aluno set status = 'AP'
	where nome = nomedoaluno;
$$;


call updateAluno('Bill Gates');





CREATE OR REPLACE PROCEDURE inclementaAluno()
LANGUAGE sql
AS RETURN INT
$$
	RETURN (	SELECT MAX(cdaluno) FROM aluno;);
$$;





CREATE OR REPLACE PROCEDURE updateProfessor(cdprofessor integer, iddisciplina integer)
LANGUAGE sql
AS 
$$
	update matdisciplina set cdprofessor = idprofessor
	where cddisciplina = iddisciplina;
$$;


call updateProfessor();


roun












-- Tatakae -->


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






set schema 'icaro';
create or replace function alunoaprovado(IN pnomealuno varchar, OUT quantidades Numeric)
as 
$$
	BEGIN
	quantidade = (select count(md.status) from aluno a
	JOIN matricula m
	ON a.cdaluno = m.cdaluno
	JOIN matdisciplina md
	ON md.cdmatricula = m.cdmatricula
	WHERE a.nome = pnomealuno
	AND md.status = 'AP');
	
	END;
$$ LANGUAGE plpgsql;

SELECT * from alunoaprovado('Bill Gates');









