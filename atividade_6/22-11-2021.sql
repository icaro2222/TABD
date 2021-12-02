

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















-- Tatakae -->
