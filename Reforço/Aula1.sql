

9 cat



-- Fazer uma	função	que	recebe	um	valor	inteiro	e	verifica	se	ele		é	par.
-- A função deve retornar	1	se o número	for	par	e	0	se for ímpar


SET SCHEMA 'icaro';

SELECT parOUimpar(0);



CREATE OR REPLACE FUNCTION parOUimpar(IN numero NUMERIC) RETURNS NUMERIC
AS
$$
BEGIN
IF ((numero%2)=0) THEN
RETURN 1;
ELSE 
RETURN 0;
END IF;
END;
$$ LANGUAGE plpgsql;




-- Fazer uma função que receba 3 notas de um aluno e uma letra.
-- Se a letra	for	A	a	função	retorna a	média	aritmética	das	notas	do aluno,
-- se	for	P, a sua média ponderada (pesos: 5, 3 e 2) e se for H, a sua média harmônica.	







SET SCHEMA 'icaro';

CREATE OR REPLACE FUNCTION parOUimpar(IN nota1 NUMERIC, IN nota2 NUMERIC, IN nota3 NUMERIC, ) RETURNS NUMERIC
AS
$$
BEGIN
IF (letra='a' OR letra='A') THEN
RETURN ((nota1+nota2+nota3)/3);
ELSEIF  (letra='p' OR letra='P') THEN
RETURN ();
ELSEIF  (letra='h' OR letra='H') THEN
RETURN ();
ELSE
ex;
END IF;
END;
$$ LANGUAGE plpgsql;




SET SCHEMA 'icaro';

CREATE OR REPLACE FUNCTION parOUimpar(IN nota1 NUMERIC, IN nota2 NUMERIC, IN nota3 NUMERIC, ) RETURNS NUMERIC
AS
$$
	BEGIN
		CASE RETURN
		WHEN letra='a' OR letra='A' THEN ((nota1+nota2+nota3)/3)
		WHEN (letra='p' OR letra='P') THEN 'calculo'
		WHEN (letra='h' OR letra='H') THEN 'calculo'
	END;
$$ LANGUAGE plpgsql;


(1/fnota1)+(1/fnota2)+(1/fnota3)



SET SCHEMA 'icaro';
create or replace function calculamedia(in fnota1 numeric, fnota2 numeric, fnota3 numeric, fletra varchar(4), out resultado numeric)
as $$
declare mmc numeric;
begin
	notice 
	if(fletra = 'A' or fletra = 'a') THEN 
		resultado = (fnota1+fnota2+fnota3)/3;
	elseif(fletra = 'P' or fletra = 'p') THEN 
		resultado = ((fnota1*5)+(fnota2*3)+(fnota3*2))/(5*3*2);
	ELSEIF(letra='h' OR letra='H') THEN 
		resultado = (3/(1/fnota1)+(1/fnota2)+(1/fnota3));
	ELSE 
	raise EXCEPTION 'ERRO!!!!!!!';
	end if;
end;
$$ language plpgsql;



CASE
WHEN state = 'PA' THEN 'close'
WHEN state = 'NJ' OR state = 'MD' THEN 'far'



CREATE OR REPLACE FUNCTION mediaNota(IN nota1 NUMERIC, IN nota2 NUMERIC, IN nota3 NUMERIC, IN letra CHAR, OUT media VARCHAR)
AS $$
	BEGIN
	
		IF letra like 'A' THEN 
			media = concat('Aritmética: ', (nota1 + nota2 + nota3) / 3); 
		ELSEIF letra like 'P' THEN 
			media = concat('Ponderada: ', ((5 * nota1) + (3 * nota2) + (2 * nota3)) / (5 + 3 + 2)); 
		ELSEIF letra like 'H' THEN 
			media = concat('Harmônica: ', 3 / ((1/nota1) + (1/nota2) + (1/nota3))); 
		ELSE
			RAISE EXCEPTION 'Erro!';
		END IF;
	END;
$$ 
LANGUAGE plpgsql;