





CREATE OR REPLACE FUNCTION atualizarmediadisciplina()
RETURN TRIGGER AS 
$$
DECLARE Vmedia DOUBLE PRECISION;
	BEGIN 
		Vmedia = (SELECT AVG(nota) FROM nota  WHERE cdmatdisciplina = OLD.cdmatdisciplina);
		
		UPDATE matdisciplina SET media = Vmedia
		WHERE cdmatdisciplina = NEW.cdmatdisciplina;
		
	RETURN NULL;
	END;
$$ 
LANGUAGE plpgsql;


create trigger tg_atualizamediadiscplina
after insert on nota
after delete on nota
for each row
execute function atualizamediadisciplina();












