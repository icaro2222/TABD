

SET SCHEMA 'prova';

-- Criando função para atualizar status em matDisciplina

CREATE OR REPLACE FUNCTION atualizaStatusMatDisciplina()
RETURNS VOID AS 
$$
	BEGIN
		UPDATE matdisciplina SET status = case
			WHEN media >= 7 THEN 'AP'
			WHEN media < 7 THEN 'RP'
		END;		
	END;
$$ LANGUAGE plpgsql;


select atualizaStatusMatDisciplina();


-- Criando Campo de status em matricula

ALTER TABLE "matricula"
	ADD "status" VARCHAR(12);

-- Criando função para atualizar status em matricula

SET SCHEMA 'prova';
CREATE OR REPLACE FUNCTION atualizaStatusMatricula()
RETURNS VOID AS 
$$
	BEGIN
		UPDATE matricula SET status = case
		WHEN (SELECT COUNT(cddisciplina) FROM matdisciplina mt
			WHERE mt.media < 7 
			  AND mt.cdmatricula = matricula.cdmatricula)
			  > 3 THEN 'RP'
		WHEN (SELECT COUNT(cddisciplina) FROM matdisciplina mt
			WHERE mt.media < 7 AND mt.cdmatricula = matricula.cdmatricula) <= 3	THEN 'AP'
		END;
	END;
$$ LANGUAGE plpgsql;

SELECT atualizaStatusMatricula();
