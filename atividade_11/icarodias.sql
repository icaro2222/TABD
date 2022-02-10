

SET SCHEMA 'prova';

CREATE OR REPLACE FUNCTION atualizaMEDIA(IN pnomealuno VARCHAR, IN pnomedisciplina varchar,IN pnomesemestre VARCHAR)
RETURNS VOID AS 
$$
DECLARE Vmedia DOUBLE PRECISION;
DECLARE VcdMat integer;
	BEGIN
	 Vmedia = (select avg(nota) from nota as n
		join matdisciplina as mtd 
		on (n.cdmatdisciplina = mtd.cdmatdisciplina)
		join disciplina as d 
		on (mtd.cddisciplina = d.cddisciplina)
		join matricula as m 
		on (mtd.cdmatricula = m.cdmatricula)
		join aluno as a 
		on (a.cdaluno = m.cdaluno)
		join semestre as s 
		ON (s.cdsemestre = m.cdsemestre)
		where a.nome = pnomealuno 
		AND d.nomedisciplina = pnomedisciplina
		AND s.ano = pnomesemestre);
		
	 VcdMat = (select mtd.cdmatdisciplina from matdisciplina as mtd
		join disciplina as d 
		on (mtd.cddisciplina = d.cddisciplina)
		join matricula as m 
		on (mtd.cdmatricula = m.cdmatricula)
		join aluno as a 
		on (a.cdaluno = m.cdaluno)
		join semestre as s 
		ON (s.cdsemestre = m.cdsemestre)
		where a.nome = pnomealuno 
		AND d.nomedisciplina = pnomedisciplina
		AND s.ano = pnomesemestre);
		
		UPDATE matdisciplina SET media = Vmedia
		WHERE cdmatdisciplina = VcdMat;
		
	END;
$$ LANGUAGE plpgsql;



select atualizaMEDIA('ANTONIO', 'TABD', '2021.1');
