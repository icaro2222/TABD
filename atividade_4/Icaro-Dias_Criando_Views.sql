	 
	 
	 <------ Ícaro Dias dos Santos --------->

4 - Faça uma consulta que mostre: o nome do aluno, o nome da disciplina, a média e o status do aluno na disciplina


	set schema 'icaro';
	
	CREATE VIEW questao4 as
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


	CREATE VIEW questao5 as
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
	
	
	
	

7 -Faça uma consulta para mostrar o aluno que pagou o valor maior no semestre 2017.1(matricula + disciplinas)


	set schema 'icaro';

	CREATE VIEW questao7 as
	SELECT 'O aluno: '||a.nome||' pagou o maior valor' nome_do_aluno, 'Total de R$'||
	sum(mt.valor) + m.valor||' reais' maior_valor
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
	ORDER BY maior_valor DESC
	LIMIT 1;		   
				

8 -faça uma consulte que mostre a disciplina(s) com  mais reprovação: apresente nome da diciplina, professor.


	SET SCHEMA 'icaro';

	CREATE VIEW questao8 as
	SELECT d.nomedisciplina nome_da_disciplina, p.nome nome_do_professor, COUNT(d.nomedisciplina) quant_reprovados
	FROM disciplina d
	JOIN professor p
	ON p.cdprofessor = d.cdprofessor
	JOIN  matdisciplina md
	ON  d.cddisciplina = md.cddisciplina 
	WHERE md.status = 'RE'
	GROUP BY d.nomedisciplina, p.nome
	ORDER BY quant_reprovados DESC 
	LIMIT 1;
	
	
9 - mostre quantos alunos foram reprovados em algoritmo.


	set schema 'icaro';
	
	CREATE VIEW questao9 as
	SELECT 'Ouveram '||count(a.nome)||' reprovação na disciplina de algoritmo' 
	quant_alunos_reprovados_em_algoritmo
	FROM aluno a
	INNER JOIN matricula m
	ON m.cdaluno = a.cdaluno
	INNER JOIN matdisciplina mt
	ON mt.cdmatricula = m.cdmatricula
	INNER JOIN disciplina d
	ON d.cddisciplina = mt.cddisciplina
	where d.nomedisciplina = 'ALGORITMO' 
	AND mt.status = 'RE';
	
	
	
	
	
	
	
	
	                                                                                       <---Tatakae--->
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	