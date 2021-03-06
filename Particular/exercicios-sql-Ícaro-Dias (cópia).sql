


set schema 'icaro-teste';
 

------------------ CHECK DEFAULT CONSTRAINT -------------------

CREATE TABLE produtos (
produto_no integer,
descricao text,
preco numeric DEFAULT 9.99
);

insert into produtos(produto_no,descricao,preco) values (1,'para cabelo',6.35),
                                                        (2,'de limpeza',7.43),
																		  (3,'para lavar casa',5.75),
																		  (4,'para fazer comida',6.20),
                                                        (5,'para cachorro brincar',5.75),
                                                        (6,'para deixar mulher atraente',33.00),
                                                        (7,'proibidos para menores de 18',32.75);


CREATE TABLE produtos1 (
produto_no integer,
descricao text,
preco numeric CHECK (preco > 0)
);

insert into produtos1(produto_no,descricao,preco) values (1,'para cabelo',6.35),
                                                        (2,'de limpeza',7.43),
																		  (3,'para lavar casa',5.75),
																		  (4,'para fazer comida',6.20),
                                                        (5,'para cachorro brincar',5.75),
                                                        (6,'para deixar mulher atraente',33.00),
                                                        (7,'proibidos para menores de 18',32.75);


CREATE TABLE produtos2 (
produto_no integer,
descricao text,
preco numeric CONSTRAINT preco_positivo CHECK (preco > 0)
);

insert into produtos2(produto_no,descricao,preco) values (1,'para cabelo',6.35),
                                                        (2,'de limpeza',7.43),
																		  (3,'para lavar casa',5.75),
																		  (4,'para fazer comida',6.20),
                                                        (5,'para cachorro brincar',5.75),
                                                        (6,'para deixar mulher atraente',33.00),
                                                        (7,'proibidos para menores de 18',32.75);


CREATE TABLE produtos3 (
produto_no integer,
descricao text,
desconto numeric CHECK (desconto > 0.00 AND desconto < 0.10),
preco numeric CONSTRAINT preco_positivo CHECK (preco > 0),
check (preco > desconto)
);

insert into produtos3(produto_no,descricao,desconto, preco) values (1,'para cabelo',0.07, 6.35),
                                                        (2,'para lavar casa',0.08, 5.75),
                                                        (3,'para fazer comida',0.04, 6.20),
                                                        (4,'para cachorro brincar',0.04, 5.75),
                                                        (5,'para deixar mulher atraente',0.09, 33.00),
                                                        (6,'proibidos para menores de 18',0.05, 32.75);                           



CREATE TABLE produtos4 (
cod_prod integer NOT NULL CHECK (cod_prod > 0),
nome text NOT NULL,
preco numeric
);

insert into produtos4 ( cod_prod, nome, preco) values(1, 'sab??o', 4.00),
															(2, 'sab??o', 2.03),
															(3, 'arroz', 5.30),
															(4, 'feij??o', 4.60),
															(5, 'carne', 22.80),
															(6, 'peixe', 12.50),
															(7, 'chinelo', 15.20),
															(8, 'talco', 3.80);


---------------- UNIQUE -----------------

CREATE TABLE produtos5 (
cod_prod integer UNIQUE,
nome text,
preco numeric
);

insert into produtos5 ( cod_prod, nome, preco) values(1, 'sab??o', 4.00),
															(2, 'sab??o', 2.03),
															(3, 'arroz', 5.30),
															(4, 'feij??o', 4.60),
															(5, 'carne', 22.80),
															(6, 'peixe', 12.50),
															(7, 'chinelo', 15.20),
															(8, 'talco', 3.80);

CREATE TABLE produtos6 (
cod_prod integer,
nome text,
preco numeric,
UNIQUE (cod_prod)
);

insert into produtos6 ( cod_prod, nome, preco) values(1, 'sab??o', 4.00),
															(2, 'sab??o', 2.03),
															(3, 'arroz', 5.30),
															(4, 'feij??o', 4.60),
															(5, 'carne', 22.80),
															(6, 'peixe', 12.50),
															(7, 'chinelo', 15.20),
															(8, 'talco', 3.80);

CREATE TABLE exemplo (
a integer,
b integer,
c integer,
UNIQUE (a, c)
);

insert into exemplo (a, b, c) values(1, 2, 3),
												(1, 2, 4),
												(1, 2, 2),
												(1, 2, 1);
												
CREATE TABLE produtos7 (
cod_prod integer CONSTRAINT unq_cod_prod UNIQUE,
nome text,
preco numeric
);

insert into produtos7 ( cod_prod, nome, preco) values(1, 'sab??o', 4.00),
															(2, 'sab??o', 2.03),
															(3, 'arroz', 5.30),
															(4, 'feij??o', 4.60),
															(5, 'carne', 22.80),
															(6, 'peixe', 12.50),
															(7, 'chinelo', 15.20),
															(8, 'talco', 3.80);


create table teste(
id serial not null,
parent integer null,
component integer not null
);

create unique index naoduplic on teste using btree (component) where (parent IS NULL);


------- PRIMARY KEY ----------

CREATE TABLE produtos8 (
cod_prod integer UNIQUE NOT NULL,
nome text,
preco numeric
);

insert into produtos8 ( cod_prod, nome, preco) values(1, 'sab??o', 4.00),
															(2, 'sab??o', 2.03),
															(3, 'arroz', 5.30),
															(4, 'feij??o', 4.60),
															(5, 'carne', 22.80),
															(6, 'peixe', 12.50),
															(7, 'chinelo', 15.20),
															(8, 'talco', 3.80);


CREATE TABLE produtos9 (
cod_prod integer PRIMARY KEY,
nome text,
preco numeric
);

insert into produtos9 ( cod_prod, nome, preco) values(1, 'sab??o', 4.00),
															(2, 'sab??o', 2.03),
															(3, 'arroz', 5.30),
															(4, 'feij??o', 4.60),
															(5, 'carne', 22.80),
															(6, 'peixe', 12.50),
															(7, 'chinelo', 15.20),
															(8, 'talco', 3.80);


CREATE TABLE exemplo1 (
a integer,
b integer,
c integer,
PRIMARY KEY (a, c)
);

insert into exemplo1 (a, b, c) values(1, 2, 3),
												(1, 2, 4),
												(1, 2, 2),
												(1, 2, 1);
												

------- FOREIGN KEY ----------

CREATE TABLE produtos10 (
cod_prod integer PRIMARY KEY,
nome text,
preco numeric
);

insert into produtos10 ( cod_prod, nome, preco) values(1, 'sab??o', 4.00),
															(2, 'sab??o', 2.03),
															(3, 'arroz', 5.30),
															(4, 'feij??o', 4.60),
															(5, 'carne', 22.80),
															(6, 'peixe', 12.50),
															(7, 'chinelo', 15.20),
															(8, 'talco', 3.80);


CREATE TABLE pedidos (
cod_pedido integer PRIMARY KEY,
cod_prod integer,
quantidade integer,
CONSTRAINT pedidos_fk FOREIGN KEY (cod_prod) REFERENCES produtos10 (cod_prod)
);

insert into pedidos (cod_pedido, cod_prod, quantidade) values(1, 2, 3),
																				(2, 2, 4),
																				(3, 2, 2),
																				(4, 2, 1);

------- SIMULANDO ENUM ----------

CREATE TABLE pessoa(
codigo int null primary key,
cor_favorita varchar(255) not null,
check (cor_favorita IN ('vermelha', 'verde', 'azul'))
);

INSERT INTO pessoa (codigo, cor_favorita) values (1, 'vermelha'); -- OK
INSERT INTO pessoa (codigo, cor_favorita) values (1, 'amarela');-- Erro, amarelo n??o consta


------- HERAN??A ----------

CREATE TABLE cidades (
nome text,
populacao float,
altitude int
);

CREATE TABLE capitais (
estado char(2)
) INHERITS (cidades);


---------- VIEWs -------------

---------- Criando Uma View -------------

CREATE VIEW recent_shipments
AS SELECT count(*) AS num_shipped, max(ship_date), title
FROM shipments
JOIN editions USING (isbn)
NATURAL JOIN books AS b (book_id)
GROUP BY b.title
ORDER BY num_shipped DESC;


---------- Usando Uma View -------------

SELECT * FROM recent_shipments;
SELECT * FROM recent_shipments
ORDER BY max DESC
LIMIT 3;


---------- Destruindo Uma View -------------

DROP VIEW nomeview;


---------- Criar as Tabelas que servir??o de Base -------------

CREATE TABLE client (
clientid SERIAL NOT NULL PRIMARY KEY,
clientname VARCHAR(255)
);

CREATE TABLE clientcontact (
contactid SERIAL NOT NULL PRIMARY KEY,
clientid int CONSTRAINT client_contact_check REFERENCES client(clientid),
name VARCHAR(255),
phone VARCHAR(255),
fax VARCHAR(255),
emailaddress VARCHAR(255)
);

CREATE VIEW client_contact_list AS
SELECT client.clientid, clientname, name, emailaddress FROM client, clientcontact
WHERE client.clientid = clientcontact.clientid;


---------- Criar as Tabelas que servir??o de Base -------------

CREATE VIEW minha_view AS
SELECT cidade, temp_min, temp_max, prcp, data, localizacao
FROM clima, cidades
WHERE cidade = nome;
SELECT * FROM minha_visao;


---------- 26 27 -------------

---------- Criar um ??ndice ------------

CREATE INDEX pessoa_cor ON pessoa (cor_favorita);

DROP INDEX pessoa_cor;


--------- Criar um ??ndice ??nico:  -------------

CREATE UNIQUE INDEX pessoa_cod ON pessoa (codigo);

CREATE INDEX client_id ON client (clientid, clientname);


--------- select com index  -------------

SET SCHEMA 'revisao-icaro-dias';

SELECT clientname FROM client WHERE clientid = 12 AND clientname = 'Jo??o';

SELECT * FROM pessoa ORDER BY cor_favorita;

Successfully run. Total query runtime: 857 msec.
1 rows affected.

Successfully run. Total query runtime: 560 msec.
1 rows affected.


------- Criando ??ndices de tipos diferentes: ---------

CREATE INDEX pedidos_cod ON pedidos USING BTREE (cod_pedido);

-- tipo: BTREE, RTREE, HASH, GIST --


---------- 36 43 -------------

SELECT siape AS ???Matricula d?? Servidor??? FROM pessoal;

SELECT pessoal.siape, pessoal.senha, locacoes.lotacao
FROM pessoal, lotacoes WHERE pessoal.siape = lotacoes.siape
ORDER BY lotacoes.lotacao;


---------- TABELA PARA BASE-------------

CREATE TABLE clientes(
codigo INTEGER PRIMARY key,
nome VARCHAR(50),
idade INT DEFAULT 18,
email VARCHAR(50),
estado CHAR(2),
dinheiro INT
);


---------- DISTINCT -------------

SELECT DISTINCT email FROM clientes;


---------- ALL  -------------

SELECT ALL email FROM clientes;


---------- CL??USULA WHERE   -------------

SELECT nome FROM clientes WHERE email = 'ribafs@ribafs.org';

SELECT nome FROM clientes WHERE idade > 18;

SELECT nome FROM clientes WHERE idade < 21;

SELECT nome FROM clientes WHERE idade >= 18;

SELECT nome FROM clientes WHERE idade <= 21;

SELECT nome FROM clientes WHERE UPPER(estado) != 'CE';

SELECT nome FROM clientes WHERE email = 'ribafs@ribafs.org';


-- BETWEEN, LIKE, OR, AND, NOT, EXISTS, IS NULL, IS NOT NULL, IN --


SELECT nome FROM clientes WHERE idade BETWEEN 18 and 45;

SELECT nome FROM clientes WHERE email LIKE '%@gmail.com';

SELECT nome FROM clientes WHERE idade >18 OR idade < 21; -- entre 18 e 21

SELECT nome FROM clientes WHERE idade >= 18 AND UPPER(estado) = 'CE';

SELECT nome FROM clientes WHERE idade NOT BETWEEN 18 AND 21;


----------  EXISTS  -------------

SELECT * FROM datas WHERE EXISTS(SELECT * FROM datas2 WHERE datas.data =
datas2.data);


----------  IS NULL, IS NOT NULL  -------------

SELECT nome FROM clientes WHERE estado IS NULL;
SELECT nome FROM clientes WHERE estado IS NOT NULL;


-------------  IN  ---------------

SELECT nome FROM clientes WHERE estado IN ('CE', 'RN');


-------------  GROUP BY  ---------------


-------------  HAVING  ---------------

SELECT SUM(horas) FROM empregados; -- Traz a soma das horas de todos os empregados

SELECT empregado, SUM(horas) FROM empregados GROUP BY empregado;

SELECT codigo, nome, count(valor) FROM vendas GROUP BY codigo, nome.



----------- Exemplo:  ---------------

SELECT c.nome, COUNT(p.quant) AS quantos
FROM clientes c, pedidos p
WHERE c.codigo = p.cod_cliente
GROUP BY (p.cod_cliente);

----------- Exemplo:   ---------------

SELECT cliente, SUM(uant) AS total
FROM pedidos GROUP BY cliente
HAVING total > 50; -- ou HAVING SUM(quant) > 50;


----------- Exemplo:   ---------------

SELECT * FROM pedidos ORDER BY cliente, quantidade;


---------- INSERT ---------

--------  DEFAULT   ------------

ALTER TABLE clientes  default 18.
INSERT INTO clientes (codigo, nome) VALUES (1, ???Ribamar FS???);


------- Forma Abreviada: -----------

INSERT INTO clientes VALUES (1, ???Ribamar FS???);


----------  Inserindo com SubConsulta ---------

INSERT INTO clientes (codigo, nome, idade) VALUES
(SELECT fnome, fidade FROM funcionarios WHERE cli = 'S');

SELECT firstname, lastname, city, state INTO newfriend FROM friend;


---------------- UPDATE ----------------

UPDATE clientes SET idade = idade + 1; -- Todos os registros de clientes ser??o atualizados
UPDATE pedidos SET quant = quant + 3
WHERE cliente IN (SELECT codigo FROM clientes WHERE idade > 18);


----------- DELETE ----------

DELETE FROM pedidos; -- Cuidado, excluir?? todos os registros da tabela pedidos

DELETE FROM pedidos WHERE (codigo IS NULL);


----------- Jun????es de Tabelas ou Consultas ----------

------ CROSS JOIN -------

SELECT p.siape, p.senha, l.lotacao FROM pessoal p CROSS JOIN lotacoes l;

------ Exemplo ANSI: -------

SELECT p.siape, p.nome, l.lotacao
FROM pessoal p INNER JOIN lotacoes l
ON p.siape = l.siape ORDER BY p.siape;

------ WHERE -------

SELECT p.siape, p.nome, l.lotacao
FROM pessoal p, lotacoes l
WHERE p.siape = l.siape ORDER BY p.siape;


------ OUTER JOIN  -------

------ LEFT JOIN -------
SELECT p.siape, p.nome, l.lotacao
FROM pessoal p LEFT JOIN lotacoes l
ON p.siape = l.siape ORDER BY p.siape;

------ RIGHT JOIN -------

SELECT p.siape, p.nome, l.lotacao
FROM pessoal p RIGHT JOIN lotacoes l
ON p.siape = l.siape ORDER BY p.nome;


-------  FULL OUTER JOIN  ------------

-----  CROSS JOIN e SELF JOIN -----------


--------- LIMIT  ------------

SELECT nota FROM notas ORDER BY nota LIMIT 5 OFFSET 2 ;

-------- LIMIT, OFFSET ----------

-------- Exemplos ---------
SELECT id, name FROM products ORDER BY name LIMIT 20 OFFSET 1;

SELECT * FROM news_m LIMIT $inicio, $n_resultados;

-------------  Sub consultas  -----------

select descricao, (select max(preco) from produtos where produto_no=1) as "maior pre??o" from
produtos;

SELECT * FROM tabela1 WHERE tabela1.col1 =
(SELECT col2 FROM tabela2 WHERE col2 = valor);

SELECT name FROM customer WHERE customer_id NOT IN 
( SELECT customer_id FROM salesorder );

SELECT 'test' AS test, id FROM (SELECT * FROM books) AS example_sub_query;

SELECT firstname, state,
CASE
WHEN state = 'PA' THEN 'close'
WHEN state = 'NJ' OR state = 'MD' THEN 'far'
ELSE 'very far'
END AS distance
FROM friend;


-----------  Sub Consultas, EXISTS -----------


SELECT campo1 FROM tabela1 WHERE EXISTS
(SELECT 1 FROM tabela2 WHERE campo2 = tabela1.campo2);

------------- Combinando CASE e EXISTS --------------- 


-----------  CREATE TABLE TEMPORARY-----------	

CREATE TEMPORARY TABLE frutas (id SERIAL PRIMARY KEY, nome TEXT);

-----------  INSERT NA TABLE TEMPORARY-----------	

INSERT INTO frutas VALUES (DEFAULT, 'banana');
INSERT INTO frutas VALUES (DEFAULT, 'ma????');	


-----------  CREATE TABLE TEMPORARY-----------

CREATE TEMPORARY TABLE alimentos (id SERIAL PRIMARY KEY, nome TEXT);

-----------  INSERT NA TABLE TEMPORARY-----------	

INSERT INTO alimentos VALUES (DEFAULT, 'ma????');
INSERT INTO alimentos VALUES (DEFAULT, 'espinafre');

SELECT nome, CASE WHEN EXISTS (SELECT nome FROM frutas WHERE nome=a.nome)
THEN 'sim'
ELSE 'n??o'
END AS fruta
FROM alimentos a;


------------   IN   -------------

SELECT nome, CASE WHEN nome IN (SELECT nome FROM frutas)
THEN 'sim'
ELSE 'n??o'
END AS fruta
FROM alimentos;


------------   NOT IN , ANY/SOME  -------------

SELECT nome, CASE WHEN nome = ANY (SELECT nome FROM frutas)
THEN 'sim'
ELSE 'n??o'
END AS fruta
FROM alimentos;


-------------  CASE WHEN  ---------------

------------- TABELA BASE ---------------

CREATE TABLE notas (
nota decimal(4,2) CONSTRAINT chknota
CHECK (nota BETWEEN 0.00 AND 10.00)
);

------------- INSERT INTO ---------------

INSERT INTO notas VALUES(10);
INSERT INTO notas VALUES(9.2);
INSERT INTO notas VALUES(9.0);
INSERT INTO notas VALUES(8.3);
INSERT INTO notas VALUES(7.7);
INSERT INTO notas VALUES(7.4);
INSERT INTO notas VALUES(6.4);
INSERT INTO notas VALUES(5.8);
INSERT INTO notas VALUES(5.1);
INSERT INTO notas VALUES(5.0);
INSERT INTO notas VALUES(0);


SELECT CASE
WHEN nota < 3 THEN 'E' -- 0 a 3
WHEN nota < 5 THEN 'D' -- 3 a 5
WHEN nota < 7 THEN 'C' -- 5 a 7
WHEN nota < 9 THEN 'B' -- 7 a 9
ELSE 'A' -- 9 a 10
END AS conceito,
COUNT(*) AS quantidade,
MIN(nota) AS menor,
MAX(nota) AS maior,
ROUND(AVG(nota)) AS media
FROM notas
GROUP BY CASE
WHEN nota < 3 THEN 'E'-- Aqui podemos utilizar express??es
WHEN nota < 5 THEN 'D'
WHEN nota < 7 THEN 'C'
WHEN nota < 9 THEN 'B'
ELSE 'A'
END
ORDER BY conceito;

-------- CREATE VIEWs ---------

CREATE VIEW nota_mmm AS
SELECT CASE
WHEN nota < 3 THEN 'E' -- 0 a 3
WHEN nota < 5 THEN 'D' -- 3 a 5
WHEN nota < 7 THEN 'C' -- 5 a 7
WHEN nota < 9 THEN 'B' -- 7 a 9
ELSE 'A' -- 9 a 10
END AS conceito,
COUNT(*) AS quantidade,
MIN(nota) AS menor,
MAX(nota) AS maior,
ROUND(AVG(nota)) AS media
FROM notas
GROUP BY CASE
WHEN nota < 3 THEN 'E'-- Aqui podemos utilizar express??es
WHEN nota < 5 THEN 'D'
WHEN nota < 7 THEN 'C'
WHEN nota < 9 THEN 'B'
ELSE 'A'
END
ORDER BY conceito;

--------------- SELECT VIEW -----------

SELECT * FROM nota_mmm;

--------------- SELECT ??NICA LINHA   -----------

SELECT COUNT(CASE WHEN nota BETWEEN 9.00 AND 10.00 THEN 1 ELSE NULL END)
AS A,
COUNT(CASE WHEN nota BETWEEN 7.00 AND 8.99 THEN 1 ELSE NULL END) AS B,
COUNT(CASE WHEN nota BETWEEN 5.00 AND 6.99 THEN 1 ELSE NULL END) AS C,
COUNT(CASE WHEN nota BETWEEN 3.00 AND 4.99 THEN 1 ELSE NULL END) AS D,
COUNT(CASE WHEN nota BETWEEN 0.00 AND 2.99 THEN 1 ELSE NULL END) AS E
FROM notas;


--------------- CREATE VIEWs  -----------

CREATE VIEW contar_distribuicao_das_notas AS 
SELECT COUNT(CASE WHEN nota BETWEEN 9.00 AND 10.00 THEN 1 ELSE NULL END)
AS A,
COUNT(CASE WHEN nota BETWEEN 7.00 AND 8.99 THEN 1 ELSE NULL END) AS B,
COUNT(CASE WHEN nota BETWEEN 5.00 AND 6.99 THEN 1 ELSE NULL END) AS C,
COUNT(CASE WHEN nota BETWEEN 3.00 AND 4.99 THEN 1 ELSE NULL END) AS D,
COUNT(CASE WHEN nota BETWEEN 0.00 AND 2.99 THEN 1 ELSE NULL END) AS E
FROM notas;


--------------- SELECT VIEW -----------

SELECT * FROM contar_distribuicao_das_notas ;


--------- SELECT M??DIA, MAIOR E MENOR NOTA --------

SELECT nota,
(SELECT MIN(nota) FROM notas) AS menor,
(SELECT MAX(nota) FROM notas) AS maior,
(SELECT AVG(nota) FROM notas) AS media FROM notas;

--------------- CREATE VIEWs  -----------

CREATE VIEW comparar_nota_maior_menor_e_nota_media AS 
SELECT nota,
(SELECT MIN(nota) FROM notas) AS menor,
(SELECT MAX(nota) FROM notas) AS maior,
(SELECT AVG(nota) FROM notas) AS media FROM notas;

--------------- SELECT VIEWs -----------

SELECT * FROM  comparar_nota_maior_menor_e_nota_media;

--------------- Outro CONTE??DO -----------

--------------- Outro CONTE??DO -----------

--------------- Outro CONTE??DO -----------

--------------- Outro CONTE??DO -----------

--------------- Outro CONTE??DO -----------

--------------- Outro CONTE??DO -----------

--------------- Outro CONTE??DO -----------

--------------- Outro CONTE??DO -----------

--------------- Outro CONTE??DO -----------
5 - Fun????es Internas
5.1 ??? Fun????es de Strings
Concatena????o de Strings - dois || (pipes)


SELECT 'ae' || 'io' || 'u' AS vogais; --vogais -------- aeiou
SELECT CHR(67)||CHR(65)||CHR(84) AS "Dog"; -- Dog CAT


Quantidade de Caracteres de String


char_length - retorna o n??mero de caracteres

SELECT CHAR_LENGTH('UNIFOR'); - -Retorna 6
Ou SELECT LENGTH('Database'); - - Retorna 8
Converter para min??sculas
SELECT LOWER('UNIFOR');
Converter para mai??sculas
SELECT UPPER('universidade');
Posi????o de caractere

SELECT POSITION ('@' IN 'ribafs@gmail.com'); -- Retorna 7
Ou SELECT STRPOS('Ribamar' ,'mar'); - - Retorna 5
Substring
SUBSTRING(string [FROM inteiro] [FOR inteiro])
SELECT SUBSTRING ('Ribamar FS' FROM 9 FOR 10); - - Retorna FS
SUBSTRING(string FROM padr??o);
SELECT SUBSTRING ('PostgreSQL' FROM '.......'); - - Retorna Postgre
SELECT SUBSTRING ('PostgreSQL' FROM '...$'); - -Retorna SQL

Primeiros ....... e ??ltimos ...$
Ou
SUBSTR ( 'string', inicio, quantidade);
SELECT SUBSTR ('Ribamar', 4, 3); - - Retorna mar
Substituir todos os caracteres semelhantes
SELECT TRANSLATE(string, velho, novo);
SELECT TRANSLATE('Brasil', 'il', '??o'); - - Retorna Bras??o
SELECT TRANSLATE('Brasileiro...leiro', 'eiro', 'eira');
Remover Espa??os de Strings
SELECT TRIM(' SQL - PADR??O ');
Calcular MD5 de String
SELECT MD5('ribafs'); - - Retorna 53cd5b2af18063bea8ddc804b21341d1
Repetir uma string n vezes
SELECT REPEAT('SQL-', 3); - - Retorna SQL-SQL-SQLSobrescrever substring em string
SELECT REPLACE ('Postgresql', 'sql', 'SQL'); - - Retorna PostgreSQL


Dividir Cadeia de Caracteres com Delimitador
SELECT SPLIT_PART( 'PostgreSQL', 'gre', 2); - -Retorna SQL
SELECT SPLIT_PART( 'PostgreSQL', 'gre', 1); - -Retorna Post

Iniciais Mai??sculas
INITCAP(text) - INITCAP ('ol?? mundo') - - Ol?? Mundo
Remover Espa??os em Branco
TRIM ([leading | trailing | both] [characters] from string)- remove caracteres da direita e da
esquerda. trim (both 'b' from 'babacatebbbb'); - - abacate
RTRIM (string text, chars text) - Remove os caracteres chars da direita (default ?? espa??o)
rtrim('removarrrr', 'r') - - remova
LTRIM - (string text, chars text) - Remove os caracteres chars da esquerda
ltrim('abssssremova', 'abs') - - remova
Detalhes no item 9.4 do Manual:
http://pgdocptbr.sourceforge.net/pg80/functions-string.html
Like e %
SELECT * FROM FRIENDS WHERE LASTNAME LIKE 'M%';
O ILIKE ?? case INsensitive e o LIKE case sensitive.
~~ equivale ao LIKE
~~* equivale equivale ao ILIKE
!~~ equivale ao NOT LIKE
!~~* equivale equivale ao NOT ILIKE
... LIKE '[4-6]_6%' -- Pegar o primeiro sendo de 4 a 6,
-- o segundo qualquer d??gito,
-- o terceiro sendo 6 e os demais quaisquer
% similar a *
_ similar a ? (de arquivos no DOS)
Correspond??ncia com um Padr??o
O PostgreSQL disponibiliza tr??s abordagens distintas para correspond??ncia com padr??o: o
operador LIKE tradicional do SQL; o operador mais recente SIMILAR TO (adicionado ao
SQL:1999); e as express??es regulares no estilo POSIX. Al??m disso, tamb??m est?? dispon??vel
a fun????o de correspond??ncia com padr??o substring, que utiliza express??es regulares tanto no
estilo SIMILAR TO quanto no estilo POSIX.
SELECT substring('XY1234Z', 'Y*([0-9]{1,3})'); - - Resultado: 123
SELECT substring('XY1234Z', 'Y*?([0-9]{1,3})'); - - Resultado: 1
47
SIMILAR TO
O operador SIMILAR TO retorna verdade ou falso conforme o padr??o corresponda ou n??o ??
cadeia de caracteres fornecida. Este operador ?? muito semelhante ao LIKE, exceto por
interpretar o padr??o utilizando a defini????o de express??o regular do padr??o SQL.
'abc' SIMILAR TO 'abc' verdade
'abc' SIMILAR TO 'a' falso
'abc' SIMILAR TO '%(b|d)%' verdade
'abc' SIMILAR TO '(b|c)%' falso
SELECT 'abc' SIMILAR TO '%(b|d)%'; -- Procura b ou d em 'abc' e no caso retorna TRUE
REGEXP
SELECT 'abc' ~ '.*ab.*';
~ distingue a de A
~* n??o distingue a de A
!~ distingue express??es distingue a de A
!~* distingue express??es n??o distingue a de A
'abc' ~ 'abc' -- TRUE
'abc' ~ '^a' -- TRUE
'abc' ~ '(b|j)' -- TRUE
'abc' ~ '^(b|c)' -- FALSE
5.2 ??? Fun????es Matem??ticas
Operadores L??gicos:
AND, OR e NOT. TRUE, FALSE e NULL
Operadores de Compara????o:
<, >, <=, >=, =, <> ou !=
a BETWEEN x AND y
a NOT BETWEEN x AND y
express??o IS NULL
express??o IS NOT NULL
express??o IS TRUE
express??o IS NOT TRUE
express??o IS FALSE
express??o IS NOT FALSE
express??o IS UNKNOWN
express??o IS NOT UNKNOWN
48
OPERADOR NULL
Em SQL NULL ?? para valores inexistentes. Regra geral: NULL se propaga, o que
significa que com quem NULL se combina o resultado ser?? um NULL.
NULL n??o zero, n??o ?? string vazia nem string de comprimento zero.
Um exemplo: num cadastro de alunos, para o aluno que ainda n??o se conhece a nota,
n??o ?? correto usar zero para sua nota, mas sim NULL.
N??o se pode efetuar c??lculos de express??es onde um dos elementos ?? NULL.
COMPARANDO NULLs
NOT NULL com NULL -- Unknown
NULL com NULL -- Unknown
CONVERS??O DE/PARA NULL
NULLIF() e COALESCE()
NULLIF(valor1, valor2)
NULLIF ??? Retorna NULL se, e somente se, valor1 e valor2 forem iguais, caso contr??rio
retorna valor1.
Algo como:
if (valor1 == valor2){
then NULL
else valor1;
Retorna valor1 somente quando valor1 == valor2.
COALESCE ??? retorna o primeiro de seus argumentos que n??o for NULL. S?? retorna NULL
quando todos os seus argumentos forem NULL.
Uso: mudar o valor padr??o cujo valor seja NULL.
create table nulos(nulo int, nulo2 int, nulo3 int);
insert into nulos values (1,null,null);
select coalesce(nulo, nulo2, nulo3) from nulos; - - Retorna 1, valor do campo nulo;
select coalesce(nulo2, nulo3) from nulos; - - Retorna NULL, pois ambos s??o NULL.
GREATEST - Retorna o maior valor de uma lista - SELECT GREATEST(1,4,6,8,2); - - 8
LEAST - Retorna o menor valor de uma lista.
Todos os valores da lista devem ser do mesmo tipo e nulos s??o ignorados.
Obs.: Ambas as fun????es acima n??o pertencem ao SQL standard, mas s??o uma extens??o do
PostgreSQL.
49
CONCATENANDO NULLs
A regra ??: NULL se propaga. Qualquer que concatene com NULL gerar?? NULL.
STRING || NULL -- NULL
Usos:
- Como valor default para campos que futuramente receber??o valor.
- Valor default para campos que poder??o ser sempre inexistentes.
Operadores Matem??ticos
+, -, *, /, % (m??dulo, resto de divis??o de inteiros), ^(pot??ncia), !(fatorial), @(valor absoluto)
| / - rais quadrada ( | / 25.0 = 5)
| | / - raiz c??bica ( | | / 27.0 = 3)
Algumas fun????es Matem??ticas
ABS(x) - valor absoluto de x
CEIL(numeric) - arredonda para o pr??ximo inteiro superior
DEGREES(valor) - converte valor de radianos para graus
FLOOR(numeric) - arredonda para o pr??ximo inteiro inferior
MOD(x,y) - resto da divis??o de x por y
PI() - constante PI (3,1415...)
POWER(x,y) - x elevado a y
RADIANS(valor) - converte valor de graus para radianos
RANDOM() - valor aleat??rio entre 0 e 1
ROUND(numeric) - arredonda para o inteiro mais pr??ximo
ROUND(v, d) - arredonda v com d casas decimais
SIGN(numeric) - retorna o sinal da entrada, como -1 ou +1
SQRT(X) - Raiz quadrada de X
TRUNC (numeric) - trunca para o nenhuma casa decimal
TRUNC (v numeric, s int) - trunca para s casas decimais
5.3 ??? Fun????es de Agrupamento (Agrega????o)
As fun????es de agrupamento s??o usadas para contar o n??mero de registros de uma tabela.
avg(express??o)
count(*)
count(express??o)
max(express??o)
min(express??o)
stddev(express??o)
sum(express??o)
variance(express??o)

Onde express??o, pode ser "ALL express??o" ou ???DISTINCT express??o???.
As fun????es de Agrupamento (agrega????o) n??o podem ser utilizadas na cl??usula WHERE.
Devem ser utilizadas entre o SELECT e o FROM. Num SELECT que usa uma fun????o
agregada, as demais colunas devem fazer parte da cl??usula GROUP BY. Somente podem
aparecer ap??s o SELECT ou na cl??usula HAVING. De uso proibido nas demais cl??usulas.
50
Obs.: Ao contar os registros de uma tabela com a fun????o COUNT(campo) e esse campo for
nulo em alguns registros, estes registros n??o ser??o computados, por isso cuidado com os
nulos nas fun????es de agrega????o.
A cl??usula HAVING normalmente vem precedida de uma cl??usula GROUP BY e
obrigatoriamente cont??m fun????es de agrega????o.
ALERTA: Retornam somente os registros onde o campo pesquisado seja diferente de NULL.
NaN - Not a Number (N??o ?? um n??mero)
UPDATE tabela SET campo1 = 'NaN';
SELECT MIN(campo) AS "Valor M??nimo" FROM tabela;
Caso tenha problema com esta consulta use:
SELECT campo FROM tabela ORDER BY campo ASC LIMIT 1;
SELECT MAN(campo) AS "Valor M??ximo" FROM tabela;
Caso tenha problema com esta consulta use:
SELECT campo FROM tabela ORDER BY campo DESC LIMIT 1;
5.4 ??? Fun????es de Data/Hora
Opera????es com datas:
timestamp '2001-09-28 01:00' + interval '23 hours' -> timestamp '2001-09-29 00:00'
date '2001-09-28' + interval '1 hour' -> timestamp '2001-09-28 01:00'
date '01/01/2006' ??? date '31/01/2006'
time '01:00' + interval '3 hours'time -> '04:00'
interval '2 hours' - time '05:00' -> time '03:00:00'
Fun????o age (retorna Interval) - Diferen??a entre datas
age(timestamp)interval (Subtrai de hoje)
age(timestamp '1957-06-13') -> 43 years 8 mons 3 days
age(timestamp, timestamp)interval Subtrai os argumentos
age('2001-04-10', timestamp '1957-06-13') -> 43 years 9 mons 27 days
Fun????o extract (retorna double)
Extrai parte da data: ano, m??s, dia, hora, minuto, segundo.
select extract(year from age('2001-04-10', timestamp '1957-06-13'))
select extract(month from age('2001-04-10', timestamp '1957-06-13'))
select extract(day from age('2001-04-10', timestamp '1957-06-13'))
Data e Hora atuais (retornam data ou hora)
SELECT CURRENT_DATE;
SELECT CURRENT_TIME;
SELECT CURRENT_TIME(0);
SELECT CURRENT_TIMESTAMP;
SELECT CURRENT_TIMESTAMP(0);
Obtendo o dia do m??s:
SELECT DATE_PART('DAY', CURRENT_TIMESTAMP) AS Dia;


Somar dias e horas a uma data:
SELECT CAST('06/04/2006' AS DATE) + INTERVAL '27 DAYS' AS Data;
Fun????o now (retorna timestamp with zone)
now() - Data e hora corrente (timestamp with zone);
N??o usar em campos somente timestamp.
Fun????o date_part (retorna double)
SELECT date_part('day', TIMESTAMP '2001-02-16 20:38:40');
Resultado: 16 (day ?? uma string, diferente de extract)
Fun????o date_trunc (retorna timestamp)
SELECT date_trunc('year', TIMESTAMP '2001-02-16 20:38:40');
Retorna 2001-02-16 00:00:00
Convertendo (CAST)
select to_date('1983-07-18', 'YYYY-MM-DD')
select to_date('19830718', 'YYYYMMDD')
Fun????o timeofday (retorna texto)
select timeofday() -> Fri Feb 24 10:07:32.000126 2006 BRT
Interval
interval [ (p) ]
to_char(interval '15h 2m 12s', 'HH24:MI:SS')
date '2001-09-28' + interval '1 hour'
interval '1 day' + interval '1 hour'
interval '1 day' - interval '1 hour'
900 * interval '1 second'
Interval trabalha com as unidades: second, minute, hour, day, week, month, year, decade,
century, millenium ou abreviaturas ou plurais destas unidades.
Se informado sem unidades '13 10:38:14' ser?? devidamente interpretado '13 days 10 hours
38 minutes 14 seconds'.
CURRENTE_DATE - INTERVAL '1' day;
TO_TIMESTAMP('2006-01-05 17:56:03', 'YYYY-MM-DD HH24:MI:SS')




Tipos Geom??tricos:
CREATE TABLE geometricos(ponto POINT, segmento LSEG, retangulo BOX, poligono
POLYGON, circulo CIRCLE);

ponto (0,0),
segmento de (0,0) at?? (0,1),
ret??ngulo (base inferior (0,0) at?? (1,0) e base superior (0,1) at?? (1,1)) e
c??rculo com centro em (1,1) e raio 1.

INSERT INTO geometricos VALUES ('(0,0)','((0,0),(0,1))', '((0,0),(0,1))',
'((0,0),(0,1),(1,1),(1,0))','((1,1),1)');
Tipos de Dados para Rede:
Para tratar especificamente de redes o PostgreSQL tem os tipos de dados cidr, inet e
macaddr.
52
cidr ??? para redes IPV4 e IPV6
inet ??? para redes e hosts IPV4 e IPV6
macaddr ??? endere??os MAC de placas de rede
Assim como tipos data, tipos de rede devem ser preferidos ao inv??s de usar tipos texto para
guardar IPs, M??scaras ou endere??os MAC.
Veja um exemplo em ??ndices Parciais e a documenta????o oficial para mais detalhes.
5.5 - Formata????o de Tipos de Dados
TO_CHAR - Esta fun????o deve ser evitada, pois ser?? descontinuada.
TO_DATE
date TO_DATE(text, text); Recebe dois par??metros text e retorna date.
Um dos par??metros ?? a data e o outro o formato.
SELECT TO_DATE('29032006','DDMMYYYY'); - Retorna 2006-03-29
TO_TIMESTAMP
tmt TO_TIMESTAMP(text,text) - Recebe dois text e retorna timestamp with zone
SELECT TO_TIMESTAMP('29032006 14:23:05','DDMMYYYY HH:MI:SS'); - Retorna 2006-
03-29 14:23:05+00
TO_NUMBER
numeric TO_NUMBER(text,text)
SELECT TO_NUMBER('12,454.8-', '99G999D9S'); Retorna -12454.8
SELECT TO_NUMBER('12,454.8-', '99G999D9'); Retorna 12454.8
SELECT TO_NUMBER('12,454.8-', '99999D9'); Retorna 12454
Detalhes no item 9.8 do manual.
5.6 - Convers??o Expl??cita de Tipos (CAST)
CAST ( express??o AS tipo ) AS apelido; -- Sintaxe SQL ANSI
Outra forma:
Tipo ( express??o );
Exemplo:
SELECT DATE '10/05/2002' - DATE '10/05/2001'; -- Retorna a quantidade de dias
- -entre as duas datas
Para este tipo de convers??o devemos:
Usar float8 ao inv??s de double precision;
Usar entre aspas alguns tipos como interval, time e timestamp
Obs.: aplica????es port??veis devem evitar esta forma de convers??o e em seu lugar usar o
CAST explicitamente.
A fun????o CAST() ?? utilizada para converter explicitamente tipos de dados em outros.
SELECT CAST(2 AS double precision) ^ CAST(3 AS double precision) AS "exp";
SELECT ~ CAST('20' AS int8) AS "negativo"; - Retorna -21
53
SELECT round(CAST (4 AS numeric), 4); - Retorna 4.0000
SELECT substr(CAST (1234 AS text), 3);
SELECT 1 AS "real" UNION SELECT CAST('2.2' AS REAL);
Fun????es Diversas
SELECT CURRENT_DATABASE();
SELECT CURRENT_SCHEMA();
SELECT CURRENT_SCHEMA(boolean);
SELECT CURRENT_USER;
SELECT SESSION_USER;
SELECT VERSION();
SELECT CURRENT_SETTING('DATESTYLE');
SELECT HAS_TABLE_PRIVILEGE('usuario','tabela','privilegio');
SELECT HAS_TABLE_PRIVILEGE('postgres','nulos','insert'); - - Retorna: t
SELECT HAS_DATABASE_PRIVILEGE('postgres','testes','create'); - - Retorna: t
SELECT HAS_SCHEMA_PRIVILEGE('postgres','public','create'); - - Retorna: t
SELECT relname FROM pg_class WHERE pg_table_is_visible(oid);
Arrays
SELECT ARRAY[1.1,2.2,3.3]::INT[] = ARRAY[1,2,3];
SELECT ARRAY[1,2,3] = ARRAY[1,2,8];
SELECT ARRAY[1,3,5] || ARRAY[2,4,6];
SELECT 0 || ARRAY[2,4,6];
Array de char com 48 posi????es e cada uma com 2:
campo char(2) [48]
Fun????es Geom??tricos
area(objeto) - - area(box '((0,0), (1,1))');
center(objeto) - - center(box '((0,0), (1,2))');
diameter(circulo double) - - diameter(circle '((0,0), 2.0)');
height(box) - - height(box '((0,0), (1,1))');
length(objeto) - - length(path '((-1,0), (1,0))');
radius(circle) - - radius(circle '((0,0), 2.0)');
width(box) - - width(box '((0,0), (1,1))');
54
Fun????es para Redes
Fun????es cidr e inet
host(inet) - - host('192.168.1.5/24') - - 192.168.1.5
masklen(inet) - - masklen('192.168.1.5/24') - - 24
netmask(inet) - - netmask('192.168.1.5/24') - - 255.255.255.0
network(inet) - - network('192.168.1.5/24') - - 192.168.1.0/24
Fun????o macaddr
trunt(macaddr) - - trunc(maraddr '12:34:34:56:78:90:ab') - - 12:34:56:00:00:00
Fun????es de Informa????o do Sistema
current_database()
current_schema()
current_schemas(boolean)
current_user()
inet_client_addr()
inet_client_port()
inet_server_addr()
inet_server_port()
pg_postmaster_start_time()
version()
has_table_privilege(user, table, privilege) - d?? privil??gio ao user na tabela
has_table_privilege(table, privilege) - d?? privil??gio ao usu??rio atual na tabela
has_database_privilege(user, database, privilege) - d?? privil??gio ao user no banco
has_function_privilege(user, function, privilege) - d?? privil??gio ao user na fun????o
has_language_privilege(user, language, privilege) - d?? privil??gio ao user na linguagem
has_schema_privilege(user, schema, privilege) - d?? privil??gio ao user no esquema
has_tablespace_privilege(user, tablespace, privilege) - d?? privil??gio ao user no tablespace
current_setting(nome) - valor atual da configura????o
set_config(nome, novovalor, is_local) - seta par??metro de retorna novo valor
pg_start_backup(label text)
pg_stop_backup()
pg_column_size(qualquer)
pg_tablespace_size(nome)
pg_database_size(nome)
pg_relation_size(nome)
pg_total_relation_size(nome)
pg_size_pretty(bigint)
pg_ls_dir(diretorio)
pg_read_file(arquivo text, offset bigint, tamanho bigint)
pg_stat_file(arquivo text)
55
6 - Fun????es Definidas pelo Usu??rio e Triggers
O PostgreSQL oferece quatro tipos de fun????es:
- Fun????es escritas em SQL
- Fun????es em linguagens de procedimento (PL/pgSQL, PL/Tcl, PL/php, PL/Java, etc)
- Fun????es internas (rount(), now(), max(), count(), etc).



- Fun????es na linguagem C
CREATE [ OR REPLACE ] FUNCTION
name ( [ [ argmode ] [ argname ] argtype [, ...] ] )
[ RETURNS rettype ]
{ LANGUAGE langname
| IMMUTABLE | STABLE | VOLATILE
| CALLED ON NULL INPUT | RETURNS NULL ON NULL INPUT | STRICT
| [ EXTERNAL ] SECURITY INVOKER | [ EXTERNAL ] SECURITY DEFINER
| AS 'definition'
| AS 'obj_file', 'link_symbol'
} ...
[ WITH ( attribute [, ...] ) ]

Para refor??ar a seguran??a ?? interessante usar o par??metro SECURITY DEFINER, que
especifica que a fun????o ser?? executada com os privil??gios do usu??rio que a criou.
SECURITY INVOKER indica que a fun????o deve ser executada com os privil??gios do usu??rio
que a chamou (padr??o).
SECURITY DEFINER especifica que a fun????o deve ser executada com os privil??gios do
usu??rio que a criou.
Uma grande for??a do PostgreSQL ?? que ele permite a cria????o de fun????es pelo usu??rio em
diversas linguagens: SQL, PlpgSQL, TCL, Perl, Phyton, Ruby.
Para ter exemplos a disposi????o vamos instalar os do diret??rio "tutorial" dos fontes do
PostgreSQL:
Acessar /usr/local/src/postgresql-8.1.3/src/tutorial e executar:
make install
Feito isso teremos 5 arquivos .sql.
O syscat.sql traz consultas sobre o cat??logo de sistema, o que se chama de metadados
(metadata).
O basic.sql e o advanced.sql s??o consultas SQL.
O complex.sql trata da cria????o de um tipo de dados pelo usu??rio e seu uso.
O func.sql traz algumas fun????es em SQL e outras em C.
56
6.1 ??? Fun????es em SQL
O que outros SGBDs chamam de stored procedures o PostgreSQL chama de fun????es, que
podem ser em diversas linguagens.




CREATE OR REPLACE FUNCTION olamundo() RETURNS int4
AS 'SELECT 1' LANGUAGE 'sql';


SELECT olamundo() ;

CREATE OR REPLACE FUNCTION add_numeros(nr1 int4, nr2 int4) RETURNS int4
AS 'SELECT $1 + $2' LANGUAGE 'sql';


SELECT add_numeros(300, 700) AS resposta ;

Podemos passar como par??metro o nome de uma tabela:

CREATE TEMP TABLE empregados (
nome text,
salario numeric,
idade integer,
baia point
);

INSERT INTO empregados VALUES('Jo??o',2200,21,point('(1,1)'));
INSERT INTO empregados VALUES('Jos??',4200,30,point('(2,1)'));

CREATE FUNCTION dobrar_salario(empregados) RETURNS numeric AS $$
SELECT $1.salario * 2 AS salario;
$$ LANGUAGE SQL;


SELECT nome, dobrar_salario(emp.*) AS sonho
FROM empregados emp
WHERE emp.baia ~= point '(2,1)';


Algumas vezes ?? pr??tico gerar o valor do argumento composto em tempo de execu????o. Isto
pode ser feito atrav??s da constru????o ROW.

SELECT nome, dobrar_salario(ROW(nome, salario*1.1, idade, baia)) AS sonho
FROM empregados;

Fun????o que retorna um tipo composto. Fun????o que retorna uma ??nica linha da tabela
empregados:

CREATE FUNCTION novo_empregado() RETURNS empregados AS $$
SELECT text 'Nenhum' AS nome,
1000.0 AS salario,
25 AS idade,
point '(2,2)' AS baia;
$$ LANGUAGE SQL;


Ou
57

CREATE OR REPLACE FUNCTION novo_empregado() RETURNS empregados AS $$
SELECT ROW('Nenhum', 1000.0, 25, '(2,2)')::empregados;
$$ LANGUAGE SQL;

Chamar assim:
SELECT novo_empregado();
ou
SELECT * FROM novo_empregado();
Fun????es SQL como fontes de tabelas

CREATE TEMP TABLE teste (testeid int, testesubid int, testename TEXT);

INSERT INTO teste VALUES (1, 1, 'Jo??o');
INSERT INTO teste VALUES (1, 2, 'Jos??');
INSERT INTO teste VALUES (2, 1, 'Maria');

CREATE FUNCTION getteste(int) RETURNS teste AS $$
SELECT * FROM teste WHERE testeid = $1;
$$ LANGUAGE SQL;

SELECT *, upper(testename) FROM getteste(1) AS t1;

Tabelas Tempor??rias - criar tabelas tempor??rias (TEMP), faz com que o servidor se
encarregue de remov??-la (o que faz logo que a conex??o seja encerrada).

CREATE TEMP TABLE nometabela (campo tipo);


Fun????es SQL retornando conjunto

CREATE FUNCTION getteste(int) RETURNS SETOF teste AS $$
SELECT * FROM teste WHERE testeid = $1;
$$ LANGUAGE SQL;


SELECT * FROM getteste(1) AS t1;

Fun????es SQL polim??rficas
As fun????es SQL podem ser declaradas como recebendo e retornando os tipos polim??rficos
anyelement e ANYARRAY.

CREATE FUNCTION constroi_matriz(anyelement, anyelement) RETURNS anyarray AS $$
SELECT ARRAY[$1, $2];
$$ LANGUAGE SQL;

SELECT constroi_matriz(1, 2) AS intarray, constroi_matriz('a'::text, 'b') AS textarray;
CREATE FUNCTION eh_maior(anyelement, anyelement) RETURNS boolean AS $$
SELECT $1 > $2;
$$ LANGUAGE SQL;

SELECT eh_maior(1, 2);

Mais detalhes no cap??tulo 31 do manual.
58
6.2 - Fun????es em PlpgSQL
As fun????es em linguagens procedurais no PostgreSQL, como a PlpgSQL s??o
correspondentes ao que se chama comumente de Stored Procedures.
Por default o PostgreSQL s?? traz suporte ??s fun????es na linguagem SQL. Para dar suporte ??
fun????es em outras linguagens temos que efetuar procedimentos como a seguir.
Para que o banco postgres tenha suporte ?? linguagem de procedimento PlPgSQL
executamos na linha de comando como super usu??rio do PostgreSQL:
createlang plpgsql ???U nomeuser nomebanco
A PlpgSQL ?? a linguagem de procedimentos armazenados mais utilizada no PostgreSQL,
devido ser a mais madura e com mais recursos.

CREATE FUNCTION func_escopo() RETURNS integer AS $$
DECLARE
quantidade integer := 30;
BEGIN
RAISE NOTICE 'Aqui a quantidade ?? %', quantidade; -- A quantidade aqui ?? 30
quantidade := 50;
--
-- Criar um sub-bloco
--
DECLARE
quantidade integer := 80;
BEGIN
RAISE NOTICE 'Aqui a quantidade ?? %', quantidade; -- A quantidade aqui ?? 80
END;
RAISE NOTICE 'Aqui a quantidade ?? %', quantidade; -- A quantidade aqui ?? 50
RETURN quantidade;
END;
$$ LANGUAGE plpgsql;


SELECT func_escopo();


CREATE FUNCTION instr(varchar, integer) RETURNS integer AS $$
DECLARE
v_string ALIAS FOR $1;
index ALIAS FOR $2;
BEGIN
-- algum processamento neste ponto
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION concatenar_campos_selecionados(in_t nome_da_tabela) RETURNS
text AS $$
BEGIN
RETURN in_t.f1 || in_t.f3 || in_t.f5 || in_t.f7;
END;
$$ LANGUAGE plpgsql;


59


CREATE FUNCTION somar_tres_valores(v1 anyelement, v2 anyelement, v3 anyelement)
RETURNS anyelement AS $$
DECLARE
resultado ALIAS FOR $0;
BEGIN
resultado := v1 + v2 + v3;
RETURN resultado;
END;
$$ LANGUAGE plpgsql;

SELECT somar_tres_valores(10,20,30);


Utiliza????o de tipo composto:


CREATE FUNCTION mesclar_campos(t_linha nome_da_tabela) RETURNS text AS $$
DECLARE
t2_linha nome_tabela2%ROWTYPE;
BEGIN
SELECT * INTO t2_linha FROM nome_tabela2 WHERE ... ;
RETURN t_linha.f1 || t2_linha.f3 || t_linha.f5 || t2_linha.f7;
END;
$$ LANGUAGE plpgsql;



SELECT mesclar_campos(t.*) FROM nome_da_tabela t WHERE ... ;


Temos uma tabela (datas) com dois campos (data e hora) e queremos usar uma fun????o para
manipular os dados desta tabela:


CREATE or REPLACE FUNCTION data_ctl(opcao char, fdata date, fhora time) RETURNS
char(10) AS '
DECLARE
opcao ALIAS FOR $1;
vdata ALIAS FOR $2;
vhora ALIAS FOR $3;
retorno char(10);
BEGIN
IF opcao = ''I'' THEN
insert into datas (data, hora) values (vdata, vhora);
retorno := ''INSERT'';
END IF;
IF opcao = ''U'' THEN
update datas set data = vdata, hora = vhora where data=''1995-11-01'';
retorno := ''UPDATE'';
END IF;
IF opcao = ''D'' THEN
delete from datas where data = vdata;
retorno := ''DELETE'';
ELSE
retorno := ''NENHUMA'';
END IF;
RETURN retorno;
END;
' LANGUAGE plpgsql;

select data_ctl('I','1996-11-01', '08:15');


60
select data_ctl('U','1997-11-01','06:36');
select data_ctl('U','1997-11-01','06:36');


Mais Detalhes no cap??tulo 35 do manual oficial.
Fun????es que Retornam Conjuntos de Registros (SETS)

CREATE OR REPLACE FUNCTION codigo_empregado (codigo INTEGER)
RETURNS SETOF INTEGER AS '
DECLARE
registro RECORD;
retval INTEGER;
BEGIN
FOR registro IN SELECT * FROM empregados WHERE salario >= $1 LOOP
RETURN NEXT registro.departamento_cod;
END LOOP;
RETURN;
END;
' language 'plpgsql';


select * from codigo_empregado (0);
select count (*), g from codigo_empregado (5000) g group by g;
Fun????es que retornam Registro
Para criar fun????es em plpgsql que retornem um registro, antes precisamos criar uma vari??vel
composta do tipo ROWTYPE, descrevendo o registro (tupla) de sa??da
da fun????o.
CREATE TABLE empregados(
nome_emp text,
salario int4,
codigo int4 NOT NULL,
departamento_cod int4,
CONSTRAINT empregados_pkey PRIMARY KEY (codigo),
CONSTRAINT empregados_departamento_cod_fkey FOREIGN KEY (departamento_cod)
REFERENCES departamentos (codigo) MATCH SIMPLE
ON UPDATE NO ACTION ON DELETE NO ACTION
)
CREATE TABLE departamentos (codigo INT primary key, nome varchar);
CREATE TYPE dept_media AS (minsal INT, maxsal INT, medsal INT);
create or replace function media_dept() returns dept_media as
'
declare
r dept_media%rowtype;
dept record;
bucket int8;
counter int;
begin
bucket := 0;
counter := 0;
r.maxsal :=0;
r.minsal :=0;
61
for dept in select sum(salario) as salario, d.codigo as departamento
from empregados e, departamentos d where e.departamento_cod = d.codigo
group by departamento loop
counter := counter + 1;
bucket := bucket + dept.salario;
if r.maxsal <= dept.salario or r.maxsal = 0 then
r.maxsal := dept.salario;
end if;
if r.minsal <= dept.salario or r.minsal = 0 then
r.minsal := dept.salario;
end if;
end loop;
r.medsal := bucket/counter;
return r;
end
' language 'plpgsql';
Fun????es que Retornam Conjunto de Registros (SETOF, Result Set)
Tamb??m requerem a cria????o de uma vari??vel (tipo definidopelo USER)


CREATE TYPE media_sal AS
(deptcod int, minsal int, maxsal int, medsal INT);


CREATE OR REPLACE FUNCTION medsal() RETURNS SETOF media_sal AS
'
DECLARE
s media_sal%ROWTYPE;
salrec RECORD;
bucket int;
counter int;
BEGIN
bucket :=0;
counter :=0;
s.maxsal :=0;
s.minsal :=0;
s.deptcod :=0;
FOR salrec IN SELECT salario AS salario, d.codigo AS departamento
FROM empregados e, departamentos d WHERE e.departamento_cod =
d.codigo ORDER BY d.codigo LOOP
IF s.deptcod = 0 THEN
s.deptcod := salrec.departamento;
s.minsal := salrec.salario;
s.maxsal := salrec.salario;
counter := counter + 1;
bucket := bucket + salrec.salario;
ELSE
IF s.deptcod = salrec.departamento THEN
IF s.maxsal <= salrec.salario THEN
s.maxsal := salrec.salario;
END IF;
IF s.minsal >= salrec.salario THEN
62
s.minsal := salrec.salario;
END IF;
counter := counter +1;
ELSE
s.medsal := bucket/counter;
RETURN NEXT s;
s.deptcod := salrec.departamento;
s.minsal := salrec.salario;
s.maxsal := salrec.salario;
counter := 1;
bucket := salrec.salario;
END IF;
END IF;
END LOOP;
s.medsal := bucket/counter;
RETURN NEXT s;
RETURN;
END '
LANGUAGE 'plpgsql';


select * from medsal()

Relacionando:

select d.nome, a.minsal, a.maxsal, a.medsal
from medsal() a, departamentos d
where d.codigo = a.deptcod


6.3 - Triggers (Gatilhos)
Cap??tulo 32 do manual oficial. e:
http://pgdocptbr.sourceforge.net/pg80/sql-createtrigger.html
At?? a vers??o atual n??o existe como criar fun????es de gatilho na linguagem SQL.
Uma fun????o de gatilho pode ser criada para executar antes (BEFORE) ou ap??s (AFTER) as
consultas INSERT, UPDATE OU DELETE, uma vez para cada registro (linha) modificado ou
por instru????o SQL. Logo que ocorre um desses eventos do gatilho a fun????o do gatilho ??
disparada automaticamente para tratar o evento.
A fun????o de gatilho deve ser declarada como uma fun????o que n??o recebe argumentos e que
retorna o tipo TRIGGER.
Ap??s criar a fun????o de gatilho, estabelecemos o gatilho pelo comando CREATE TRIGGER.
Uma fun????o de gatilho pode ser utilizada por v??rios gatilhos.
As fun????es de gatilho chamadas por gatilhos-por-instru????o devem sempre retornar NULL.
As fun????es de gatilho chamadas por gatilhos-por-linha podem retornar uma linha da tabela
(um valor do tipo HeapTuple) para o executor da chamada, se assim o decidirem.
Sintaxe:


CREATE TRIGGER nome { BEFORE | AFTER } { evento [ OR ... ] }
ON tabela [ FOR [ EACH ] { ROW | STATEMENT } ]
EXECUTE PROCEDURE nome_da_fun????o ( argumentos )
63
O gatilho fica associado ?? tabela especificada e executa a fun????o especificada
nome_da_fun????o quando determinados eventos ocorrerem.
O gatilho pode ser especificado para disparar antes de tentar realizar a opera????o na linha
(antes das restri????es serem verificadas e o comando INSERT, UPDATE ou DELETE ser
tentado), ou ap??s a opera????o estar completa (ap??s as restri????es serem verificadas e o
INSERT, UPDATE ou DELETE ter completado).
evento
Um entre INSERT, UPDATE ou DELETE; especifica o evento que dispara o gatilho. V??rios
eventos podem ser especificados utilizando OR.
Exemplos:





CREATE TABLE empregados(
codigo int4 NOT NULL,
nome varchar,
salario int4,
departamento_cod int4,
ultima_data timestamp,
ultimo_usuario varchar(50),
CONSTRAINT empregados_pkey PRIMARY KEY (codigo) )



CREATE FUNCTION empregados_gatilho() RETURNS trigger AS $empregados_gatilho$
BEGIN
-- Verificar se foi fornecido o nome e o sal??rio do empregado
IF NEW.nome IS NULL THEN
RAISE EXCEPTION 'O nome do empregado n??o pode ser nulo';
END IF;
IF NEW.salario IS NULL THEN
RAISE EXCEPTION '% n??o pode ter um sal??rio nulo', NEW.nome;
END IF;
-- Quem paga para trabalhar?
IF NEW.salario < 0 THEN
RAISE EXCEPTION '% n??o pode ter um sal??rio negativo', NEW.nome;
END IF;
-- Registrar quem alterou a folha de pagamento e quando
NEW.ultima_data := 'now';
NEW.ultimo_usuario := current_user;
RETURN NEW;
END;
$empregados_gatilho$ LANGUAGE plpgsql;



CREATE TRIGGER empregados_gatilho BEFORE INSERT OR UPDATE ON empregados
FOR EACH ROW EXECUTE PROCEDURE empregados_gatilho();
INSERT INTO empregados (codigo,nome, salario) VALUES (5,'Jo??o',1000);
INSERT INTO empregados (codigo,nome, salario) VALUES (6,'Jos??',1500);
INSERT INTO empregados (codigo,nome, salario) VALUES (7,'Maria',2500);


SELECT * FROM empregados;


INSERT INTO empregados (codigo,nome, salario) VALUES (5,NULL,1000);


NEW ??? Para INSERT e UPDATE
OLD ??? Para DELETE

CREATE TABLE empregados (
nome varchar NOT NULL,
salario integer
);

CREATE TABLE empregados_audit(
operacao char(1) NOT NULL,
usuario varchar NOT NULL,
data timestamp NOT NULL,
nome varchar NOT NULL,
salario integer
);

CREATE OR REPLACE FUNCTION processa_emp_audit() RETURNS TRIGGER AS
$emp_audit$
BEGIN
--
-- Cria uma linha na tabela emp_audit para refletir a opera????o
-- realizada na tabela emp. Utiliza a vari??vel especial TG_OP
-- para descobrir a opera????o sendo realizada.
--
IF (TG_OP = 'DELETE') THEN
INSERT INTO emp_audit SELECT 'E', user, now(), OLD.*;
RETURN OLD;
ELSIF (TG_OP = 'UPDATE') THEN
INSERT INTO emp_audit SELECT 'A', user, now(), NEW.*;
RETURN NEW;
ELSIF (TG_OP = 'INSERT') THEN
INSERT INTO emp_audit SELECT 'I', user, now(), NEW.*;
RETURN NEW;
END IF;
RETURN NULL; -- o resultado ?? ignorado uma vez que este ?? um gatilho AFTER
END;
$emp_audit$ language plpgsql;


CREATE TRIGGER emp_audit
AFTER INSERT OR UPDATE OR DELETE ON empregados
FOR EACH ROW EXECUTE PROCEDURE processa_emp_audit();

INSERT INTO empregados (nome, salario) VALUES ('Jo??o',1000);
INSERT INTO empregados (nome, salario) VALUES ('Jos??',1500);
INSERT INTO empregados (nome, salario) VALUES ('Maria',250);

UPDATE empregados SET salario = 2500 WHERE nome = 'Maria';

DELETE FROM empregados WHERE nome = 'Jo??o';

SELECT * FROM empregados;

SELECT * FROM empregados_audit;

Outro exemplo:

CREATE TABLE empregados (
codigo serial PRIMARY KEY,
nome varchar NOT NULL,
salario integer
);

CREATE TABLE empregados_audit(
usuario varchar NOT NULL,
data timestamp NOT NULL,
id integer NOT NULL,
coluna text NOT NULL,
valor_antigo text NOT NULL,
valor_novo text NOT NULL
);


CREATE OR REPLACE FUNCTION processa_emp_audit() RETURNS TRIGGER AS
$emp_audit$
BEGIN
--
-- N??o permitir atualizar a chave prim??ria
--
IF (NEW.codigo <> OLD.codigo) THEN
RAISE EXCEPTION 'N??o ?? permitido atualizar o campo codigo';
END IF;
--
-- Inserir linhas na tabela emp_audit para refletir as altera????es
-- realizada na tabela emp.
--
IF (NEW.nome <> OLD.nome) THEN
INSERT INTO emp_audit SELECT current_user, current_timestamp,
NEW.id, 'nome', OLD.nome, NEW.nome;
END IF;
IF (NEW.salario <> OLD.salario) THEN
INSERT INTO emp_audit SELECT current_user, current_timestamp,
NEW.codigo, 'salario', OLD.salario, NEW.salario;
END IF;
RETURN NULL; -- o resultado ?? ignorado uma vez que este ?? um gatilho AFTER
END;
$emp_audit$ language plpgsql;



CREATE TRIGGER emp_audit
AFTER UPDATE ON empregados
FOR EACH ROW EXECUTE PROCEDURE processa_emp_audit();
INSERT INTO empregados (nome, salario) VALUES ('Jo??o',1000);
INSERT INTO empregados (nome, salario) VALUES ('Jos??',1500);
INSERT INTO empregados (nome, salario) VALUES ('Maria',2500);
UPDATE empregados SET salario = 2500 WHERE id = 2;
UPDATE empregados SET nome = 'Maria Cec??lia' WHERE id = 3;
UPDATE empregados SET codigo=100 WHERE codigo=1;



ERRO: N??o ?? permitido atualizar o campo codigo
66
SELECT * FROM empregados;
SELECT * FROM empregados_audit;
Crie a mesma fun????o que insira o nome da empresa e o nome do cliente retornando o id de
ambos

create or replace function empresa_cliente_id(varchar,varchar) returns _int4 as
declare
nempresa alias for $1;
ncliente alias for $2;
empresaid integer;
clienteid integer;
begin
insert into empresas(nome) values(nempresa);
insert into clientes(fkempresa,nome) values (currval (''empresas_id_seq''), ncliente);
empresaid := currval(''empresas_id_seq'');
clienteid := currval(''clientes_id_seq'');
return ''{''|| empresaid ||'',''|| clienteid ||''}'';
end;
language 'plpgsql';

Crie uma fun????o onde passamos como par??metro o id do cliente e seja retornado o
seu nome


create or replace function id_nome_cliente(integer) returns text as
'
declare
r record;
begin
select into r * from clientes where id = $1;
if not found then
raise exception ''Cliente n??o existente !'';
end if;
return r.nome;
end;
'
language 'plpgsql';


Crie uma fun????o que retorne os nome de toda a tabela clientes concatenados em um s??
campo

create or replace function clientes_nomes() returns text as
'
declare
x text;
r record;
begin
x:=''Inicio'';
for r in select * from clientes order by id loop
x:= x||'' : ''||r.nome;
67
e
n
d lo
o
p
;
re
t
urn x||'' : fim'';
e
n
d
;
'la
n
g
u
a
g
e 'plp
gsql';
68
7 - DCL (Data Control Language)
7.1 - Usu??rios, grupos e privil??gios
De fora do banco utiliza-se comandos sem espa??o: createdb, dropdb, etc.
De dentro do banco (psql) os comandos s??o formados por duas palavras:

CREATE DATABASE, DROP DATABASE, etc.
De dentro do banco:
CREATE USER ?? agora um alias para CREATE ROLE, que tem mais recursos.
banco=# \h create role
Comando: CREATE ROLE
Descri????o: define um novo papel (role) do banco de dados
Sintaxe:

CREATE ROLE nome [ [ WITH ] op????o [ ... ] ]
onde op????o pode ser:
SUPERUSER | NOSUPERUSER
| CREATEDB | NOCREATEDB
| CREATEROLE | NOCREATEROLE
| CREATEUSER | NOCREATEUSER
| INHERIT | NOINHERIT
| LOGIN | NOLOGIN
| CONNECTION LIMIT limite_con
| [ ENCRYPTED | UNENCRYPTED ] PASSWORD 'senha'
| VALID UNTIL 'tempo_absoluto'
| IN ROLE nome_role [, ...]
| IN GROUP nome_role [, ...]
| ROLE nome_role [, ...]
| ADMIN nome_role [, ...]
| USER nome_role [, ...]
| SYSID uid
Caso n??o seja fornecido ENCRYPTED ou UNENCRYPTED ent??o ser?? usado o valor do
par??metro password_encryption (postgresql.conf).
Criar Usu??rio
CREATE ROLE nomeusuario;
Nas vers??es anteriores usava-se o par??metro ???CREATEUSER??? para indicar a cria????o de um
superusu??rio, agora usa-se o par??metro mais adequado SUPERUSER.
Para poder criar um novo usu??rio local, com senha, devemos setar antes o
pg_hba.conf:
local all all 127.0.0.1/32 password
Comentar as outras entradas para conex??o local.
Isso para usu??rio local (conex??o via socket UNIX).
69
Criamos assim:
CREATE ROLE nomeuser WITH ENCRYPTED PASSWORD '********';
Ao se logar: psql -U nomeuser nomebanco.
CREATE ROLE nomeusuario VALID UNTIL 'data'
Excluindo Usu??rio
DROP USER nomeusuario;
Como usu??rio, fora do banco:
Criar Usu??rio
CREATEROLE nomeusuario;
Excluindo Usu??rio
DROPUSER nomeusuario;
Detalhe: sem espa??os.
Criando Superusu??rio

CREATE ROLE nomeuser WITH SUPERUSER ENCRYPTED PASSWORD '******';
Alterar Conta de Usu??rio

ALTER ROLE nomeuser ENCRYPTED PASSWORD '******' CREATEUSER
ALTER ROLE nomeuser VALID UNTIL '12/05/2006';
ALTER ROLE fred VALID UNTIL ???infinity???;
ALTER ROLE miriam CREATEROLE CREATEDB;
Obs.: Lembrando que ALTER ROLE ?? uma extens??o do PostgreSQL.
Listando todos os usu??rios:
SELECT usename FROM pg_user;

A tabela pg_user ?? uma tabela de sistema (_pg) que guarda todos os usu??rios do
PostgreSQL.
Tamb??m podemos utilizar:
\du no psql
Criando Um Grupo
CREATE GROUP nomedogrupo;
Adicionar/Remover Usu??rios Em Grupos
ALTER GROUP nomegrupo ADD USER user1, user2,user3 ;
ALTER GROUP nomegrupo DROP USER user1, user2 ;
Excluindo Grupo
DROP GROUP nomegrupo;
Obs.: isso remove o grupo mas n??o remove os usu??rios do mesmo.
Listando todos os grupos:
SELECT groname FROM pg_group;
70
Privil??gios
Dando Privil??gios A Um Usu??rio
GRANT UPDATE ON nometabela TO nomeusuario;
Dando Privil??gios A Um Grupo Inteiro
GRANT SELECT ON nometabela TO nomegrupo;
Removendo Todos os Privil??gios de Todos os Users
REVOKE ALL ON nometabela FROM PUBLIC
Privil??gios
O superusu??rio tem direito a fazer o que bem entender em qualquer banco de dados do
SGBD.
O usu??rio que cria um objeto (banco, tabela, view, etc) ?? o dono do objeto.
Para que outro usu??rio tenha acesso ao mesmo deve receber privil??gios.
Existem v??rios privil??gios diferentes: SELECT, INSERT, UPDATE, DELETE, RULE,
REFERENCES, TRIGGER, CREATE, TEMPORARY, EXECUTE e USAGE.
Os privil??gios aplic??veis a um determinado tipo de objeto variam de acordo com o tipo do
objeto (tabela, fun????o, etc.).
O comando para conceder privil??gios ?? o GRANT. O de remover ?? o REVOKE.
GRANT UPDATE ON contas TO joel;
D?? a joel o privil??gio de executar consultas update no objeto contas.
GRANT SELECT ON contas TO GROUP contabilidade;
REVOKE ALL ON contas FROM PUBLIC;
Os privil??gios especiais do dono da tabela (ou seja, os direitos de DROP, GRANT, REVOKE,
etc.) s??o sempre inerentes ?? condi????o de ser o dono, n??o podendo ser concedidos ou
revogados. Por??m, o dono do objeto pode decidir revogar seus pr??prios privil??gios comuns
como, por exemplo, tornar a tabela somente para leitura para o pr??prio, assim como para os
outros.
Normalmente, s?? o dono do objeto (ou um superusu??rio) pode conceder ou revogar
privil??gios para um objeto.

-- Cria????o dos grupos

CREATE GROUP adm;

CREATE USER paulo ENCRYPTED PASSWORD 'paulo' CREATEDB CREATEUSER;

-- Cria????o dos Usu??rios do Grupo adm
CREATE USER andre ENCRYPTED PASSWORD 'andre' CREATEDB IN GROUP adm;
CREATE USER michela ENCRYPTED PASSWORD 'michela' CREATEDB IN GROUP adm;
O usu??rio de sistema (super usu??rio) deve ser um usu??rio criado exclusivamente para o
PostgreSQL. Nunca devemos torn??-lo dono de nenhum execut??vel.
71
Os nomes de usu??rios s??o globais para todo o agrupamento de bancos de dados, ou seja,
podemos utilizar um usu??rio com qualquer dos bancos.
Os privil??gios DROP, GRANT, REVOKE, etc pertencem ao dono do objeto n??o podendo ser
concedidos ou revogados. O m??ximo que um dono pode fazer ?? abdicar de seus privil??gios e
com isso ningu??m mais teria os mesmos e o objeto seria somente leitura para todos.
Dando Privil??gios
GRANT SELECT,UPDATE,INSERT ON nometabela TO nomeusuario;
Retirando Privil??gios
REVOKE ALL ON nometabela FROM nomeusuario;
Para garantir, sempre remova todos os privil??gios antes de delegar algum.
Mais detalhes:
http://pgdocptbr.sourceforge.net/pg80/user-manag.html
http://pgdocptbr.sourceforge.net/pg80/sql-revoke.html
http://pgdocptbr.sourceforge.net/pg80/sql-grant.html
72
8 ??? Transa????es
Uma transa????o acontece por completo (todas as opera????es) ou nada acontece.
Tamb??m a transa????o deve garantir um n??vel de isolamento das demais transa????es, de
maneira que as demais transa????es somente enxerguem as opera????es ap??s a transa????o
conclu??da.
Caso haja um erro qualquer na transa????o ou falha no sistema o SGBR ir?? executar um
comando ROLLBACK.
Transa????es s??o uma forma de dar suporte ??s opera????es concorrentes, garantindo a
seguran??a e integridade das informa????es.
Garantir que duas solicita????es diferentes n??o efetuar??o uma mesma opera????o ao mesmo
tempo.
Ao consultar o banco de dados, uma transa????o enxerga um snapshot (instant??neo) dos
dados, como estes eram no exato momento em que a consulta foi solicitada, desprezando as
mudan??as ocorridas depois disso.
O PostgreSQL trata a execu????o de qualquer comando SQL como sendo executado dentro de
uma transa????o.
Na vers??o 8 apareceram os SAVEPOINTS (pontos de salvamento) , que guardam as
informa????es at?? eles. Isso salva as opera????es existentes antes do SAVEPOINT e basta um
ROLLBACK TO para continuar com as demais opera????es.
O PostgreSQL mant??m a consist??ncia dos dados utilizando o modelo multivers??o MVCC
(Multiversion Concurrency Control), que permite que leitura n??o bloqueie escrita nem escrita
bloqueie leitura.
O PostgreSQL tamb??m conta com um n??vel de isolamento chamado serializable
(serializ??vel), que ?? mais rigoroso e emula execu????o serial das transa????es.
BEGIN;
UPDATE contas SET saldo = saldo ??? 100.00 WHERE codigo = 5;
SAVEPOINT meu_ponto_de_salvamento;
UPDATE contas SET saldo = saldo + 100.00 WHERE codigo = 5;
-- ops ... o certo ?? na conta 6
ROLLBACK TO meu_ponto_de_salvamento;
UPDATE contas SET saldo = saldo + 100.00 WHERE conta = 6;
COMMIT;
Exemplos:
CREATE TABLE contas(codigo INT2 PRIMARY KEY, nome VARCHAR(40), saldo
NUMERIC());
INSERT INTO contas values (5, 'Ribamar', 500.45);
Uma transa????o ?? dita um processo at??mico, o que significa que ou acontecem todas as suas
opera????es ou ent??o nenhuma ser?? salva.
Vamos iniciar a seguinte transa????o na tabela acima:
BEGIN; -- Iniciar uma transa????o
UPDATE contas SET saldo = 800.35 WHERE codigo= 5;
73
SELECT nome,saldo FROM contas WHERE codigo = 5;
COMMIT; -- Executar todos os comandos da transa????o
Agora para testar se de fato todas as opera????es foram salvas execute:
SELECT nome,saldo FROM contas WHERE codigo = 5;
Vamos a outro teste da atomicidade das transa????es. Intencionalmente vamos cometer um
erro no SELECT (FRON):
BEGIN; -- Iniciar uma transa????o
UPDATE contas SET saldo = 50.85 WHERE codigo= 5;
SELECT nome,saldo FRON contas WHERE codigo = 5;
COMMIT; -- Executar todos os comandos da transa????o
Isso causar?? um erro e o comando ROLLBACK ser?? automaticamente executado, o que
garante que nenhuma das opera????es ser?? realizada.
Ent??o execute a consulta para testar se houve a atualiza????o:
SELECT nome,saldo FRON contas WHERE codigo = 5;
Remover Campo (vers??es anteriores a 7.3 n??o contam com esse recurso):
BEGIN;
LOCK TABLE nometabela;
INTO TABLE nomenovo FROM nometabela;
DROP TABLE nometabela;
ALTER TABLE nomenovo RENAME TO nometabela;
COMMIT;
Alterar Tipos de Dados (vers??es antigas):
BEGIN;
ALTER TABLE tabela ADD COLUMN novocampo novotipodados;
UPDATE tabela SET novocampo = CAST (antigocampo novotipodados);
ALTER TABLE tabela DROP COLUMN antigocampo;
COMMIT;
Transa????es que n??o se Concretizam
BEGIN; -- Iniciar uma transa????o
UPDATE contas SET saldo = 50.85 WHERE codigo= 5;
SELECT nome,saldo FRON contas WHERE codigo = 5;
ROLLBACK; -- Cancelando todos os comandos da transa????o
BEGIN;
CREATE TABLE teste (id integer, nome text);
INSERT INTO teste VALUES (1, 'Teste1');
INSERT INTO teste VALUES (2, 'Teste2');
DELETE FROM teste;
COMMIT;
BEGIN;
74
CREATE TABLE teste (id integer, nome text);
INSERT INTO teste VALUES (3, 'Teste3');
INSERT INTO teste VALUES (4, 'Teste4');
DELETE FROM teste;
ROLLBACK;
Detalhes sobre conflitos de bloqueios:
http://www.postgresql.org/docs/current/static/explicit-locking.html
Isolamento de Transa????es
O n??vel de isolamento padr??o do PostgreSQL ?? o Read Committed (leitura efetivada). Uma
consulta SELECT realizada com este n??vel perceber?? os registros existente no in??cio da
consulta. Este ?? o n??vel mais flex??vel.
Existe tamb??m o n??vel serializable, mais rigoroso. Os n??veis Read uncommitted e Repeatable
read s??o suportados, mas assumem a forma de um dos dois anteriores.
Setando o N??vel de Isolamento de uma transa????o:
banco=# \h set transaction
Comando: SET TRANSACTION
Descri????o: define as caracter??sticas da transa????o atual
Sintaxe:
SET TRANSACTION modo_transa????o [, ...]
SET SESSION CHARACTERISTICS AS TRANSACTION modo_transa????o [, ...]
onde modo_transa????o ?? um dos:
ISOLATION LEVEL { SERIALIZABLE | REPEATABLE READ | READ COMMITTED | READ
UNCOMMITTED }
READ WRITE | READ ONLY
Exemplo:
BEGIN;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
Aqui as consultas da transa????o;
...
COMMIT;
Controle de Simultaneidade no Cap??tulo 12 do manual oficial.
75
9 - Administra????o
9.1 - Backup e Restore
Especialmente quem j?? teve problemas em HDs e n??o pode recuperar os dados, sabe da
import??ncia dos backups.
Para efetuar backup e restore utilizamos o comando pg_dump em conjunto com o psql.
Obs.: O pg_dump n??o faz backup de objetos grandes (lo) por default. Caso desejemos
tamb??m estes objetos no backup devemos utilizar uma sa??da no formato tar e utilizar a op????o
-b.
pg_dump -Ftb banco > banco.tar
Backup local de um ??nico banco:
pg_dump -U usuario -d banco > banco.sql
pg_dump -Ft banco > banco.tar
O script normalmente leva a extens??o .sql, por conven????o, mas pode ser qualquer extens??o
e o script ter?? conte??do texto puro.
Restore de um banco local:
psql -U usuario -d banco < banco.sql
pg_restore -d banco banco.sql
pg_restore -d banco banco.tar
Obs.: Cuidado ao restaurar um banco, especialmente se existirem tabelas sem integridade.
Corre-se o risco de duplicar os registros.
Descompactar e fazer o restore em um s?? comando:
gunzip -c backup.tar.gz | pg_restore -d banco
ou
cat backup.tar.gz | gunzip | pg_restore -d banco
(o cat envia um stream do arquivo para o gunzip que passa para o pg_restore)
Backup local de apenas uma tabela de um banco:
pg_dump -U nomeusuario -d nomebanco -t nometabela > nomescript
Restaurar apenas uma tabela
Para conseguir restaurar apenas uma tabela uma forma ?? gerar o dump do tipo com tar:
pg_dump -Ft banco -f arquivo.sql.tar
pg_restore -d banco -t tabela banco.sql.tar
Backup local de todos os bancos:
pg_dumpall -U nomeusuario -d nomebanco > nomescript
Backup remoto de um banco:
pg_dump -h hostremoto -d nomebanco | psql -h hostlocal -d banco
Backup em multivolumes (volumes de 200MB):
pg_dump nomebanco | split -m 200 nomearquivo
76
m para 1Mega, k para 1K, b para 512bytes
Importando backup de vers??o anterior do PostgreSQL
??? Instala-se a nova vers??o com porta diferente (ex.: 5433) e conectar ambos
??? pg_dumpall -p 5432 | psql -d template1 -p 5433
Visualizar comando atual e PID de todos os processos do servidor:
SELECT pg_stat_get_backend_pid(s.backendid) AS procpid,
pg_stat_get_backend_activity(s.backendid) AS current_query
FROM (SELECT pg_stat_get_backend_idset() AS backendid) AS s;
Determina????o da utiliza????o em disco pelas Tabelas
Tendo um banco com cadastro de CEPs e apenas uma tabela ???cep_tabela???, mostrar o uso do
disco por esta tabela. Precisamos filtrar as tabelas de sistema, veja:
VACUUM ANALYZE;
O utilit??rio VACUUM recupera espa??o em disco ocupado pelos registros exclu??dos e
atualizados, atualiza os dados para as estat??sticas usadas pelo planejador de consultas e
tamb??m protege contra perca de dados quando atingir um bilh??o de transa????es.
SELECT relname, relfilenode, relpages FROM pg_class WHERE relname LIKE 'cep_%'
ORDER BY relname;
relname | relfilenode | relpages
------------+-------------+----------
cep_pk | 25140 | 2441
cep_tabela | 16949 | 27540
O daemon do auto-vacuum
Iniciando na vers??o 8.1 ?? um processo opcional do servidor, chamado de autovacuum
daemon, cujo uso ?? para automatizar a execu????o dos comandos VACUUM e ANALYZE.
Roda periodicamente e checa o uso em baixo n??vel do coletor de estat??sticas.
N??o pode ser usado enquanto stats_start_collector e stats_row_level forem alterados para
true. Portanto o postgresql.conf deve ficar assim:
stats_start_collector = on
stats_row_level = on
autovacuum = on
Por default ser?? executado a casa 60 segundos. Para alterar descomente e mude a linha:
#autovacuum_naptime = 60
Determinar o uso do disco por tabela
SELECT relfinenode, relpages FROM pg_class WHERE relname = 'nometabela'
Cada p??gina usa 8kb.
77
Tamanho de ??ndices
SELECT c2.relname, c2.relpages
FROM pg_class c, pg_class c2, pg_index i
WHERE c.relname = 'customer'
AND c.oid = i.indrelid
AND c2.oid = i.indexrelid
ORDER BY c2.relname;
Encontrar as maiores tabelas e ??ndices
SELECT relname, relpages FROM pg_class ORDER BY relpages DESC;
Veja que no resultado tamb??m aparece a tabela de ??ndices, e com uso significativo.
Ferramentas Contrib
pgbench ??? testa desempenho do SGBD.
dbsize ??? mostra o tamanho de tabelas e bancos
oid2name ??? retorna OIDs, fileinode e nomes de tabelas
D:\ARQUIV~1\POSTGR~1\8.1\bin>oid2name -U postgres -P ********
All databases:
Oid Database Name Tablespace
-------------------------------------
33375 bdcluster ncluster
16948 cep_brasil pg_default
25146 cep_full pg_default
33360 controle_estoque pg_default
16879 municipios pg_default
33340 pgbench pg_default
10793 postgres pg_default
10792 template0 pg_default
33377 template1 pg_default
16898 testes pg_default
No README desta contrib existe uma boa sugest??o para encontrar o tamanho aproximados
dos dados de cada objeto interno do PostgreSQL com:
SELECT relpages, relfilenode, relname FROM pg_class ORDER BY relpages DESC;
Cada p??gina tem tipicamente 8KB e o relpages ?? atualizado pelo comando VACUUM.
Backup Autom??tico de Bancos no Windows com o Agendador de Tarefas
Cria????o do script backuppg.bat:
rem Adapta????o de Ribamar FS do original de Ivlison Souza para a lista PostgreSQL Brasil
@echo off
rem (Nome do Usu??rio do banco para realizar o backup)
REM Dados que precisa alterar:
REM PGUSER
REM PGPASSWORD
REM nome pasta de backup
78
REM nome pasta de instala????o do PostgreSQL se diferente de C:\Arquivos de
programas\PostgreSQL\8.1\
REM
REM (Nome do usu??rio do PostgreSQL que executar?? o script)
SET PGUSER=postgres
rem (Senha do usu??rio acima)
SET PGPASSWORD=******
rem (Indo para a raiz do disco)
C:
rem (Selecionando a pasta onde ser?? realizada o backup)
chdir C:\backup
rem (banco.sql ?? o nome que defini para o meu backup
rem (Deletando o backup existente)
del banco*.sql
echo "Aguarde, realizando o backup do Banco de Dados"
rem C:\Arquiv~1\Postgr~1\8.1\bin\pg_dump -i -U postgres -b -o -f "C:\backup\banco.sql"
condominio
rem Observa????o: Caso queira colocar o nome do backup seguindo de uma data ?? s?? usar:
for /f "tokens=1,2,3,4 delims=/ " %%a in ('DATE /T') do set Date=%%b-%%c-%%d
rem O comando acima serve para armazenar a data no formato dia-mes-ano na vari??vel
Date;
C:\Arquiv~1\Postgr~1\8.1\bin\pg_dump -i -U postgres -b -o -f "C:\backup\banco%Date%.sql"
condominio
rem (sair da tela depois do backup)
exit
Configura????o do Agendador de Tarefas para executar o script diariamente:
- Iniciar - Programas - Acess??rios - Ferramentas de Sistema - Tarefas agendadas
- Adicionar tarefa agendada
- Avan??ar
- Clique em procurar e indique o backuppg.bat
- Em executar esta tarefa escolha como achar mais adequado (diariamente) e clique em
Avan??ar
- Clique em Avan??ar e OK. Na pr??xima tela marque "Executar somente se conectado".
- Ent??o clique em Concluir
- No pr??ximo boot o backup ser?? efetuado a cada dia.
Um bom artigo sobre backup e restaura????o no PostgreSQL encontra-se no site oficial
do PostgreSQL do Brasil: https://wiki.postgresql.org.br/wiki/BackupAndRestore
Veja tamb??m a documenta????o em ingl??s:
http://www.postgresql.org/docs/8.1/static/app-pgrestore.html
http://www.postgresql.org/docs/8.1/static/app-pgdump.html
http://www.postgresql.org/docs/8.1/static/app-pg-dumpall.html
79
9.2 - Importar e Exportar
Para importar scripts gerados via pg_dump de dentro do banco devemos utilizar o comando
\i /path/script.sql
\i ./script.sql -- No windows com o arquivo no diret??rio atual
Para importar arquivos texto com delimitadores, tipo TXT, CSV ou bin??rios utilizamos os
comandos do banco (psql), como usu??rio do banco:
Importando:
\COPY tabela FROM ???script.csv???
\COPY paises FROM 'clientes.csv';
Exportando:
CREATE TEMP TABLE paises AS SELECT * FROM teste WHERE nome LIKE '%a%';
\COPY paises TO '/usr/teste.copy';
Com Delimitadores
\COPY tabela FROM '/arquivo.csv' DELIMITERS '|';
\COPY tabela TO '/arquivo.txt' DELIMITERS '|';
Obs.: O arquivo teste.copy deve ter permiss??o de escrita para o user do banco.
Importar uma planilha do Excel ou do Calc do OpenOffice para uma tabela:
Gerando um arquivo CSV no OpenOffice Calc
- Abrir calc e selecionar e copiar a ??rea a importar
- Abrir uma nova planilha
- Clicar com o bot??o direito sobre a primeira c??lula e Colar Especial
- Desmarque Colar tudo, marque N??meros, desmarque F??rmulas e OK
- Tecle Ctrl+S para salvar
- Em Tipo de arquivo escolha Texto CSV, digite o nome e Salvar. Confirme
- Como Delimitador de Campo escolha Tabula????o
- Em Delimitador de texto delete as aspas e OK
- Ignore a mensagem de erro, caso apare??a.
Importar o arquivo texto CSV para uma tabela com estrutura semelhante ?? do arquivo csv:
su - postgres
psql nomebanco
\copy nometabela from /home/nomearquivo.csv
No Windows
\copy nometabela from ./arquivo.csv -- o arquivo estando no path do usu??rio
Exportar um Banco Access para uso no PostgreSQL ou outros bancos
Selecionar a tabela e Exportar
- Escolher o tipo de arquivos Texto (txt, csv, ...)
- Em avan??ado: Delimitador de campos ??? Tabula????o
- Qualificador de texto ??? remover (deixar em branco)
80
9.3 - Converter
Uma boa forma de converter bancos MySQL para bancos PostgreSQL no Windows ??
instalando o driver ODBC para o MySQL e para o PostgreSQL.
Ent??o cria-se a comunica????o com os dois bancos e exporta-se para o PostgreSQL.
Existem ferramentas comerciais com muitos recursos, como ?? o caso do EMS Data Export e
Import for PostgreSQL: http://www.sqlmanager.net/en/products/postgresql/dataexport
Veja: export to MS Excel, MS Word / RTF, MS Access, HTML, TXT, CSV, PDF, XML and SQL.
Outra op????o ?? exportar para CSV do MySQL e importar pelo PostgreSQL.
9.4 - Otimiza????o e Desempenho
Para isso ajusta-se bem o postgresql.conf, utiliza-se o vacuum, analyze e explain.
Lembrando que na vers??o 8.1 o vacuum n??o mais ?? um programa separado e vem embutido
no execut??vel. Mesmo embutido ele ?? configur??vel e podemos utilizar ou n??o e se usar,
podemos tamb??m configurar sua periodicidade.
Uma ??tima fonte de consulta:
http://www.metatrontech.com/wpapers/mysql2postgresql.pdf
Cap??tulo 21 do manual:
http://pgdocptbr.sourceforge.net/pg80/maintenance.html
Vacuum:
http://pgdocptbr.sourceforge.net/pg80/sql-vacuum.html
Analyze:
http://pgdocptbr.sourceforge.net/pg80/sql-analyze.html
VACUUM
O comando Vacuum tanto recupera espa??o em disco, quanto otimiza o desempenho do
banco e previne contra perda de dados muito antigos devido ao recome??o do ID das
transa????es, portanto deve ser utilizado constantemente, como tamb??m atualiza as
estat??sticas dos dados utilizados pelo planejador de comandos. Lembrando que na vers??o
8.1 j?? vem embutido no execut??vel, podendo apenas ser configurado para que seja
executado automaticamente.
Na linha de comando:
vacuumdb -faze ou vacuumdb -fazq.
ANALYZE
O comando ANALYZE coleta estat??sticas sobre o conte??do das tabelas do banco de dados e
armazena os resultados na tabela do sistema pg_statistic. Posteriormente, o planejador de
comandos utiliza estas estat??sticas para ajudar a determinar o plano de execu????o mais
eficiente para os comandos. Caso n??o atualizemos estas estat??sticas com freq????ncia
podemos comprometer o desempenho do banco de dados por uma escolha errada do plano
de comandos.
Normalmente opera????es DELETE ou UPDATE n??o removem os registros automaticamente.
Somente ap??s a execu????o do VACUUM isso acontece.
Recomenda????o
Para a maioria das instala????es executar o comando VACUUM ANALYZE para todo o banco
de dadosuma vez ao dia em hor??rio de pouca utiliza????o. Tamb??m podemos utilizar o
comando:
81
vacuumdb -fazq.
Quando foi exclu??da a maioria dos registros de uma tabela sugere-se a execu????o do
comando VACUUM FULL. Este comando gera um forte bloqueio nas tabelas em que ??
executado.
Em tabelas cujo conte??do ?? exclu??do periodicamente, como tabelas tempor??rias, ?? indicado o
uso do comando TRUNCATE ao inv??s de DELETE.
Exemplo de uso do vacuum. Acesse o banco e execute:
VACUUM VERBOSE ANALYZE nometabela;
De fora do psql usar o comando ???vacuumdb -faze??? ou ???vacuumdb -fazq??? (silencioso).
VACUUM VERBOSE ANALYZE autor;
INFO: vacuuming "public.autor"
INFO: "autor": found 0 removable, 0 nonremovable row versions in 0 pages
DETAIL: 0 dead row versions cannot be removed yet.
There were 0 unused item pointers.
0 pages are entirely empty.
CPU 0.00s/0.00u sec elapsed 0.00 sec.
INFO: analyzing "public.autor"
INFO: "autor": scanned 0 of 0 pages, containing 0 live rows and 0 dead rows; 0 rows in
sample, 0 estimated total rows
Em um Banco Completo
S?? VACUUM
Ou
VACUUM FULL ANALYZE;
Dicas de Desempenho:
- Adicionar ??ndice ?? tabela (toda chave prim??ria j?? cont??m um ??ndice)
- Adicionar ??ndices aos campos de cl??usulas WHERE;
- Evitar campos com tamanho vari??vel. Preferir o CHAR ao VARCHAR.
- Evitar muitos ??ndices
- Evitar ??ndice em tabela muito pequena (poucos registros, n??o compensa)
- Evitar, sempre que poss??vel, chaves compostas
- Separar bancos em um HD e logs em outro HD
- Aumentar shared buffers (postgresql.conf) de acordo com RAM dispon??vel.
Recomenda????es: 25% da RAM para shared buffers cache e 2-4% para sort buffer.
bancos em /usr/local/pgsql/data (hda)
logs em /usr/local/pgsql/data/pg_xlog (hdb)
Utilizar links simb??licos para mover tabelas, ??ndices, ... para outro HD.
Ativar o chip DMA
Testar: hdparm -Tr /dev/hda
Ativar o chip: hdparm -d 1 /dev/hda
Desativar: hdparm -d 0 /dev/hda
82
No postgresql.conf existem configura????es para shared_buffers, que quanto maior melhor,
respeitando-se a RAM.
O default da vers??o 8.1.3 ??:
shared_buffers = 1000 # min 16 ou max_connections*2 (8KB cada)
Plano de Consulta
O PostgreSQL concebe um plano de comando para cada comando recebido. A escolha do
plano correto, correspondendo ?? estrutura do comando e ??s propriedades dos dados, ??
absolutamente cr??tico para o bom desempenho. Pode ser utilizado o comando EXPLAIN para
ver o plano criado pelo sistema para qualquer comando (conjunto execut??vel de instru????es).
A leitura do plano ?? uma arte que merece um tutorial extenso, o que este n??o ??; por??m, aqui
s??o fornecidas algumas informa????es b??sicas.
Os n??meros apresentados atualmente pelo EXPLAIN s??o:
* O custo de partida estimado (O tempo gasto antes de poder come??ar a varrer a sa??da
como, por exemplo, o tempo para fazer a classifica????o em um n?? de classifica????o).
* O custo total estimado (Se todas as linhas fossem buscadas, o que pode n??o acontecer:
uma consulta contendo a cl??usula LIMIT p??ra antes de gastar o custo total, por exemplo).
* N??mero de linhas de sa??da estimado para este n?? do plano (Novamente, somente se for
executado at?? o fim).
* Largura m??dia estimada (em bytes) das linhas de sa??da deste n?? do plano.
EXPLAIN SELECT * FROM NOMETABELA;
Mostra plano de execu????o interna da consulta, acusando tempo gasto
EXPLAIN SELECT sum(i) FROM tabela1 WHERE i = 4;
Agora a consulta ser?? modificada para incluir uma condi????o WHERE:
EXPLAIN SELECT * FROM tenk1 WHERE unique1 < 1000;
Modificando-se a consulta para restringir mais ainda a condi????o
EXPLAIN SELECT * FROM tenk1 WHERE unique1 < 50;
Adi????o de outra condi????o ?? cl??usula WHERE:
EXPLAIN SELECT * FROM tenk1 WHERE unique1 < 50 AND stringu1 = 'xxx';
A seguir ?? feita a jun????o de duas tabelas, utilizando as colunas sendo discutidas:
EXPLAIN SELECT * FROM tenk1 t1, tenk2 t2 WHERE t1.unique1 < 50 AND t1.unique2 =
t2.unique2;
Uma forma de ver outros planos ?? for??ar o planejador a n??o considerar a estrat??gia que sairia
vencedora, habilitando e desabilitando sinalizadores de cada tipo de plano (Esta ?? uma
ferramenta deselegante, mas ??til.
SET enable_nestloop = off;
EXPLAIN SELECT * FROM tenk1 t1, tenk2 t2 WHERE t1.unique1 < 50 AND t1.unique2 =
t2.unique2;
?? poss??vel verificar a precis??o dos custos estimados pelo planejador utilizando o comando
EXPLAIN ANALYZE. Na verdade este comando executa a consulta, e depois mostra o tempo
real acumulado dentro de cada n?? do plano junto com os custos estimados que o comando
EXPLAIN simples mostraria. Por exemplo, poderia ser obtido um resultado como este:
EXPLAIN ANALYZE SELECT * FROM tenk1 t1, tenk2 t2 WHERE t1.unique1 < 50 AND
t1.unique2 = t2.unique2;
83
Rein??cio do ID de Transa????es
Para prevenir com seguran??a o recome??o do ID das Transa????es devemos utilizar o
comando VACUUM em todas as tabelas do banco de dados pelo menos uma vez a cada
meio bilh??o de transa????es. Caso o VACUUM n??o seja executado pelo menos uma vez a
cada 2 bilh??es de transa????es ocorrer?? a perca de todos os dados do banco. De fato eles n??o
se perdem, voltando dentro de mais 2 bilh??es de transa????es, mas isso n??o serve de consolo.
Como saber quantas transa????es ainda falta para a perca dos dados:
SELECT datname AS banco, AGE(datfrozenxid) AS idade FROM pg_database;
Sempre que se executa o comando VACUUM em um banco, a coluna com age come??a de 1
bilh??o. Ao se aproximar de 2 bilh??es devemos executar novamente o comando VACUUM.
Alerta
Caso um banco j?? esteja com mais de 1,5 bilh??es de transa????es, ao executar o comando
VACUUM para o banco inteiro receber?? um alerta sobre a necessidade de execu????o do
VACUUM.
84
10 - Replica????o
?? o processo de compartilhar e distribuir informa????es entre diferentes bancos de dados.
Estes dados ser??o mantidos sincronizados e ??ntegros em rela????o ??s regras de integridade
referencial e de neg??cios.
No PostgreSQL algumas formas de realizar replica????o s??o atrav??s do contrib dblink e das
ferramenta slony e pgcluster.
Para importar o dblink no banco onde queremos replicar:
\i /usr/local/pgsql/contrib/dblink.sql
Exemplo dbLink - Select
select *
from dblink
(
'dbname=pgteste
hostaddr=200.174.40.63
user=paulo
password=paulo
port=5432',
'select nome
from clientes
'
) as t1(nome varchar(30));
Exemplo dbLink - Insert
select
dblink_exec(
'dbname=pgteste
hostaddr=200.174.40.63
user=paulo
password=paulo
port=5432',
'insert into clientes(nome)
values(''roger'')
'
);
Exemplo dbLink - Update
select
dblink_exec(
'dbname=pgteste
hostaddr=200.174.40.63
user=paulo
password=paulo
port=5432',
'update clientes
set nome=''Paulo Rogerio''
where id = 18
85
'
);
Exemplo dbLink - Delete
select
dblink_exec(
'dbname=pgteste
hostaddr=200.174.40.63
user=paulo
password=paulo
port=5432',
'delete from clientes
where id = 18
'
);
Temos o contrib dblink e o projerto slony para replica????o de bancos do PostgreSQL.
O dblink n??o vem ativo por default.
Ativando o dblink:
De fora do banco:
psql -U nomeuser nomebanco < /usr/local/pgsql/contrib/dblink.sql
Ou de dentro do banco:
\i /usr/local/pgsql/contrib/dblink.sql
Fun????es do dblink:
dblink - para SELECT
dblinkexec - para INSERT, UPDATE e DELETE (remotos)
Tutorial sobre replica????o no site da dbExperts - www.dbexperts.com.br
Usado para fazer consultas remotas em bancos do PG
dblink -> select
dblinkexec -> insert, update e delete (remotos)
Dica: Remover postmarter.pid em caso de queda anormal do SGBD
Bons documentos sobre replica????o:
- Replica????o do PostgreSQL com Slony do Marlon Petry
- Backup Quente no PostgreSQL com Replica????o do S??lvio C??sar
- Replicando banco de dados PostgreSQL do Rafael Donato
86
11 ??? Configura????es
Ao instalar o PostgreSQL 8.1.4 via fontes ele cria (e alerta) o arquivo pg_hba.conf com
autentica????o do tipo trust (conex??o local sem senha).
Para autenticar exigindo um dos tipos com senha, devemos antes, ainda no trust,
alterar os usu??rios adicionando senha:
ALTER ROLE nomeuser WITH PASSWORD 'senhadopg';
Somente ent??o devemos alterar o pg_hba.conf para pedir senha e restartar o
PostgreSQL.
Numa instala????o via fontes da vers??o 8.1.4 a autentica????o padr??o ?? do tipo trust
(pg_hba.conf), o que permite acesso local sem senha.
Caso queiramos alterar para que os usu??rios sejam autenticados com o tipo password, md5
ou crypt, temos que dar a devida senha ao usu??rio, ainda usando trust e somente ap??s ter
criado as senhas dentro do psql ou outra interface, s?? ent??o mudar o tipo de autentica????o no
pg_hba.conf.
As configura????es principais s??o feitas nos arquivos pg_hba.conf e postgresql.conf. Se
instalado atrav??s dos fontes ficam no subdiret??rio data de instala????o do PostgreSQL,
normalmente em /usr/local/pgsql. Se instalado via bin??rios da distribui????o vai variar com a
distribui????o. No Slackware est??o no diret??rio /usr/share/postgresql.
O pg_hba.conf controla que m??quinas ter??o acesso ao PostgreSQL e a autentica????o dessas
m??quinas clientes (sem autentica????o ou atrav??s de outras formas, trust, md5, crypt, etc).
O pg_hba.conf ?? muito rico e podemos controlar o acesso pelo IP, pela m??scara, pelo banco,
pelo usu??rio, pelo m??todo (trust, md5, password, etc).
Trechos do pg_hba.conf:
...
M??todos: "trust", "reject", "md5", "crypt", "password", "krb5", "ident" ou "pam".
O m??todo "password" envia senhas em texto claro; "md5" deve ser preferido j?? que envia
senhas criptografadas. Configurando aqui como md5 as conex??es em um cliente como o
PHP dever??o acontecer com a senha do usu??rio trazendo o hash md5 respectivo a sua
senha e n??o em texto claro.
Dica: para conex??o local, o TYPE local n??o pode estar comentado, ou seja, abaixo deveria
aparecer uma linha com local ao inv??s de host.
# TYPE DATABASE USER CIDR-ADDRESS METHOD
# IPv4 local connections:
host all all 127.0.0.1/32 trust
host all all 10.0.0.16/32 password
host all all 10.0.2.113/32 md5
host all all 0.0.0.0/0.0.0.0 reject
No exemplo acima diz que:
- as conex??es que vierem de 127.0.0.1 via TCP, s??o confi??veis e tem acesso garantido.
- As que vierem de 10.0.0.16 dever??o vir com senha em texto claro
87
- As que vierem de 10.0.2.113 dever??o vir os hashs md5 das senhas e n??o texto claro.
- Todas as demais m??quinas tem acesso negado (reject).
Exemplos do manual oficial (traduzido para o portugu??s do Brasil pelo Halley
Pacheco):
Exemplo 19-1. Exemplo de registros do arquivo pg_hba.conf
# Permitir qualquer usu??rio do sistema local se conectar a qualquer banco
# de dados sob qualquer nome de usu??rio utilizando os soquetes do dom??nio
# Unix (o padr??o para conex??es locais).
#
# TYPE DATABASE USER CIDR-ADDRESS METHOD
local all all trust
# A mesma coisa utilizando conex??es locais TCP/IP retornantes (loopback).
#
# TYPE DATABASE USER CIDR-ADDRESS METHOD
host all all 127.0.0.1/32 trust
# O mesmo que o exemplo anterior mas utilizando uma coluna em separado para
# m??scara de rede.
#
# TYPE DATABASE USER IP-ADDRESS IP-MASK METHOD
host all all 127.0.0.1 255.255.255.255 trust
# Permitir qualquer usu??rio de qualquer hospedeiro com endere??o de IP 192.168.93.x
# se conectar ao banco de dados "template1" com o mesmo nome de usu??rio que "ident"
# informa para a conex??o (normalmente o nome de usu??rio do Unix).
#
# TYPE DATABASE USER CIDR-ADDRESS METHOD
host template1 all 192.168.93.0/24 ident sameuser
# Permitir o usu??rio do hospedeiro 192.168.12.10 se conectar ao banco de dados
# "template1" se a senha do usu??rio for fornecida corretamente.
#
# TYPE DATABASE USER CIDR-ADDRESS METHOD
host template1 all 192.168.12.10/32 md5
# Na aus??ncia das linhas "host" precedentes, estas duas linhas rejeitam todas
# as conex??es oriundas de 192.168.54.1 (uma vez que esta entrada ser??
# correspondida primeiro), mas permite conex??es Kerberos V de qualquer ponto
# da Internet. A m??scara zero significa que n??o ?? considerado nenhum bit do
# endere??o de IP do hospedeiro e, portanto, corresponde a qualquer hospedeiro.
#
# TYPE DATABASE USER CIDR-ADDRESS METHOD
host all all 192.168.54.1/32 reject
host all all 0.0.0.0/0 krb5
# Permite os usu??rios dos hospedeiros 192.168.x.x se conectarem a qualquer
# banco de dados se passarem na verifica????o de "ident". Se, por exemplo, "ident"
# informar que o usu??rio ?? "oliveira" e este requerer se conectar como o usu??rio
# do PostgreSQL "guest1", a conex??o ser?? permitida se houver uma entrada
# em pg_ident.conf para o mapa "omicron" informando que "oliveira" pode se
88
# conectar como "guest1".
#
# TYPE DATABASE USER CIDR-ADDRESS METHOD
host all all 192.168.0.0/16 ident omicron
# Se as linhas abaixo forem as ??nicas tr??s linhas para conex??o local, v??o
# permitir os usu??rios locais se conectarem somente aos seus pr??prios bancos de
# dados (bancos de dados com o mesmo nome que seus nomes de usu??rio), exceto
# para os administradores e membros do grupo "suporte" que podem se conectar a
# todos os bancos de dados. O arquivo $PGDATA/admins cont??m a lista de nomes de
# usu??rios. A senha ?? requerida em todos os casos.
#
# TYPE DATABASE USER CIDR-ADDRESS METHOD
local sameuser all md5
local all @admins md5
local all +suporte md5
# As duas ??ltimas linhas acima podem ser combinadas em uma ??nica linha:
local all @admins,+suporte md5
Obs.: @admins - lista de usu??rios em arquivo
+suporte - grupo de usu??rios
Local ?? para conex??o usando apenas Socket UNIX, local.
# A coluna banco de dados tamb??m pode utilizar listas e nomes de arquivos,
# mas n??o grupos:
local db1,db2,@demodbs all md5
Um arquivo pg_ident.conf que pode ser utilizado em conjunto com o arquivo pg_hba.conf do
Exemplo 19-1 est?? mostrado no Exemplo 19-2. Nesta configura????o de exemplo, qualquer
usu??rio autenticado em uma m??quina da rede 192.168 que n??o possua o nome de usu??rio
Unix oliveira, lia ou andre n??o vai ter o acesso permitido. O usu??rio Unix andre somente
poder?? acessar quando tentar se conectar como o usu??rio do PostgreSQL pacheco, e n??o
como andre ou algum outro. A usu??ria lia somente poder?? se conectar como lia. O usu??rio
oliveira poder?? se conectar como o
pr??prio oliveira ou como guest1.
Exemplo 19-2. Arquivo pg_ident.conf de exemplo
# MAPNAME IDENT-USERNAME PG-USERNAME
omicron oliveira oliveira
omicron lia lia
# pacheco possui o nome de usu??rio andre nestas m??quinas
omicron andre pacheco
# oliveira tamb??m pode se conectar como guest1
omicron oliveira guest1
host ??? conex??es remotas usando TCP/IP. Conex??es host aceitam conex??es SSL e n??o SSL,
mas conex??es hostssl somente aceitam conex??es SSL
hostssl - via SSL em TCP/IP
IP address e IP MASK - do cliente
md5 - requer cliente com senha md5
password - requer senha mas texto claro
89
Se houver preocupa????o com rela????o aos ataques de ???farejamento??? (sniffing) de senhas,
ent??o md5 ?? o m??todo preferido, com crypt como a segunda op????o se for necess??rio
suportar clientes pr??-7.2. O m??todo password deve ser evitado, especialmente em conex??es
pela Internet aberta (a menos que seja utilizado SSL, SSH ou outro m??todo de seguran??a
para proteger a conex??o).
ident
Obt??m o nome de usu??rio do sistema operacional do cliente (para conex??es TCP/IP fazendo
contato com o servidor de identifica????o no cliente, para conex??es locais obtendo a partir do
sistema operacional) e verifica se o usu??rio possui permiss??o para se conectar como o
usu??rio de banco de dados solicitado consultando o mapa especificado ap??s a palavra chave
ident.
Mais detalhes sobre o pg_hba.conf em:
http://pgdocptbr.sourceforge.net/pg80/client-authentication.html
O postgresql.conf permite configurar as demais funcionalidades do PostgreSQL
Liberando acesso via rede TCP/IP na vers??o 7.4.x:
tcp_socket = true (default = false)
No 8.0.x:
listen_address = '10.0.0.16'
Alguns configura????es do postgresql.conf:
Regra geral: os valores que v??m comentados com # s??o os valores default. Se formos alterar
algum idealmente devemos fazer uma c??pia da linha e descomentar, para sempre saber o
valor default.
sameuser ?? o usu??rio padr??o no ident.conf (significa o mesmo user do sistema operacional).
# FILE LOCATIONS
#hba_file = 'ConfigDir/pg_hba.conf' # host-based authentication file
# CONNECTIONS AND AUTHENTICATION
# O par??metro listen_address indica as m??quinas que ter??o acesso via TCP/IP
# - Connection Settings ??? Aqui as m??quinas que ter??o acesso via TCP/IP
#listen_addresses = 'localhost' # Que IP ou nome para escutar;
# lista de endere??os separados por v??rgula;
# defaults para 'localhost', '*' = all ???*??? permite acesso a todos
# Por default aceita somente conex??es locais
#port = 5432
max_connections = 100 (duas s??o reservadas para o superusu??rio)
# note: increasing max_connections costs ~400 bytes of shared memory per
#superuser_reserved_connections = 2
# - Security & Authentication -
#authentication_timeout = 60 # 1-600, in seconds
#ssl = off
#password_encryption = on
# RESOURCE USAGE (except WAL)
# - Memory -
shared_buffers = 1000 # min 16 or max_connections*2, 8KB each
#temp_buffers = 1000 # min 100, 8KB each
#max_prepared_transactions = 5 # can be 0 or more
90
# note: increasing max_prepared_transactions costs ~600 bytes of shared memory
# per transaction slot, plus lock space (see max_locks_per_transaction).
#work_mem = 1024 # min 64, size in KB
#maintenance_work_mem = 16384 # min 1024, size in KB
#max_stack_depth = 2048 # min 100, size in KB
# - Free Space Map -
#max_fsm_pages = 20000 # min max_fsm_relations*16, 6 bytes each
#max_fsm_relations = 1000 # min 100, ~70 bytes each
Algumas Configura????es no postgresql.conf
...
# AUTOVACUUM PARAMETERS
#autovacuum = off # enable autovacuum subprocess?
...
# - Locale and Formatting -
#datestyle = 'iso, mdy' # Era o original
datestyle = 'sql, european' # Formato dd/mm/yyyy
...
#client_encoding = sql_ascii
#client_encoding = latin1 # Suporte ?? acentua????o do Brasil
...
Consultando no psql:
SHOW DATESTYLE;
Retorna -> SQL, DMY
Ajustando o estilo da data no psql:
SET DATESTYLE TO SQL, DMY;
ALTER ROLE nomeuser SET datestyle TO SQL, DMY;
O caminho de entrada num banco do PostgreSQL:
-> postgresql.conf -> ph_hba.conf -> ident.conf (caso este exista e seja citado no
pg_hba.conf)
O encoding e outros recursos podem ser passados para cada banco, no momento de sua
cria????o, como por exemplo:
De fora do banco:
createdb -E LATIN1 nomebanco.
De dentro do banco (psql):
CREATE DATABASE nomebanco WITH ENCODING 'LATIN1';
Para a rela????o completa dos encoding suportados veja tabela 21-2.
Para visualizar a codifica????o no psql digite
\encoding.
Para mudar a codifica????o de um banco dinamicamente, estando nele utilize:
\encoding novoencoding
91
Como tamb??m podemos utilizar o comando SET:
SET CLIENT_ENCODING 'LATIN1';
Consultando o encoding existente
SHOW CLIENT_ENCODING;
PARA DESFAZER AS ALTERA????ES E VOLTAR ?? CODIFICA????O PADR??O:
RESET CLIENT_ENCODING;
Mais detalhes:
http://www.postgresql.org/docs/8.1/interactive/runtime-config.html#CONFIG-SETTING
Para saber os locales existentes execute de dentro do psql:
\l -- Exibe bancos, donos e locales (Codifica????o)
Em cada conex??o com o PostgreSQL, somente se pode acessar um ??nico banco.
No postgresql.conf podemos definir o encoding atrav??s da vari??vel client_encoding.
92
12 Metadados (Cat??logo)
Metadados s??o dados sobre dados.
Uma consulta normal retorna informa????es existentes em tabelas, j?? uma consulta sobre os
metadados retorna informa????es sobre os bancos, os objetos dos bancos, os campos de
tabelas, seus tipos de dados, seus atributos, suas constraints, etc.
Retornar Todas as Tabelas do banco e esquema atual
SELECT schemaname AS esquema, tablename AS tabela, tableowner AS dono
FROM pg_catalog.pg_tables
WHERE schemaname NOT IN ('pg_catalog', 'information_schema', 'pg_toast')
ORDER BY schemaname, tablename
Informa????es de Todos os Tablespaces
SELECT spcname, pg_catalog.pg_get_userbyid(spcowner) AS spcowner, spclocation
FROM pg_catalog.pg_tablespace
Retornar banco, dono, codifica????o, coment??rios e tablespace
SELECT pdb.datname AS banco,
pu.usename AS dono,
pg_encoding_to_char(encoding) AS codificacao,
(SELECT description FROM pg_description pd WHERE pdb.oid=pd.objoid) AS comentario,
(SELECT spcname FROM pg_catalog.pg_tablespace pt WHERE pt.oid=pdb.dattablespace)
AS tablespace
FROM pg_database pdb, pg_user pu WHERE pdb.datdba = pu.usesysid ORDER BY
pdb.datname
Tabelas, donos, coment??rios, registros e tablespaces de um schema
SELECT c.relname as tabela,
pg_catalog.pg_get_userbyid(c.relowner) AS dono,
pg_catalog.obj_description(c.oid, 'pg_class') AS comentario, reltuples::integer as registros,
(SELECT spcname FROM pg_catalog.pg_tablespace pt WHERE pt.oid=c.reltablespace) AS
tablespace
FROM pg_catalog.pg_class c
LEFT JOIN pg_catalog.pg_namespace n ON n.oid = c.relnamespace
WHERE c.relkind = 'r'
AND nspname='public'
ORDER BY c.relname
Mostrar Sequences de um Esquema
SELECT c.relname AS seqname, u.usename AS seqowner, pg_catalog.obj_description(c.oid,
'pg_class') AS seqcomment,
(SELECT spcname FROM pg_catalog.pg_tablespace pt WHERE
pt.oid=c.reltablespace) AS tablespace
FROM pg_catalog.pg_class c, pg_catalog.pg_user u, pg_catalog.pg_namespace n
WHERE c.relowner=u.usesysid AND c.relnamespace=n.oid
AND c.relkind = 'S' AND n.nspname='public' ORDER BY seqname
93
Mostrar Tablespaces
SELECT spcname, pg_catalog.pg_get_userbyid(spcowner) AS spcowner, spclocation
FROM pg_catalog.pg_tablespace
Mostrar detalhes de uma function
SELECT
pc.oid AS prooid,
proname,
lanname as prolanguage,
pg_catalog.format_type(prorettype, NULL) as proresult,
prosrc,
probin,
proretset,
proisstrict,
provolatile,
prosecdef,
pg_catalog.oidvectortypes(pc.proargtypes) AS proarguments,
proargnames AS proargnames,
pg_catalog.obj_description(pc.oid, 'pg_proc') AS procomment
FROM pg_catalog.pg_proc pc, pg_catalog.pg_language pl
WHERE pc.oid = 'oid_da_function'::oid
AND pc.prolang = pl.oid
Este exemplo mostra uma consulta que lista os nomes dos esquemas, tabelas,
colunas e chaves das chaves estrangeiras, e os nomes dos esquemas, tabelas e
colunas referenciadas. Exemplo tirado da lista de discuss??o pgsql-sql
CREATE TEMPORARY TABLE t1 (id SERIAL PRIMARY KEY, nome TEXT);
CREATE TEMPORARY TABLE t2 (id INT REFERENCES t1, nome TEXT);
SELECT
n.nspname AS esquema,
cl.relname AS tabela,
a.attname AS coluna,
ct.conname AS chave,
nf.nspname AS esquema_ref,
clf.relname AS tabela_ref,
af.attname AS coluna_ref,
pg_get_constraintdef(ct.oid) AS criar_sql
FROM pg_catalog.pg_attribute a
JOIN pg_catalog.pg_class cl ON (a.attrelid = cl.oid AND cl.relkind = 'r')
JOIN pg_catalog.pg_namespace n ON (n.oid = cl.relnamespace)
JOIN pg_catalog.pg_constraint ct ON (a.attrelid = ct.conrelid AND
ct.confrelid != 0 AND ct.conkey[1] = a.attnum)
JOIN pg_catalog.pg_class clf ON (ct.confrelid = clf.oid AND clf.relkind = 'r')
JOIN pg_catalog.pg_namespace nf ON (nf.oid = clf.relnamespace)
JOIN pg_catalog.pg_attribute af ON (af.attrelid = ct.confrelid AND
af.attnum = ct.confkey[1]);
94
Mostrar Esquemas e Tabelas
SELECT n.nspname as esquema, c.relname as tabela, a.attname as campo,
format_type(t.oid, null) as tipo_de_dado
FROM pg_namespace n, pg_class c,
pg_attribute a, pg_type t
WHERE n.oid = c.relnamespace
and c.relkind = 'r' -- no indices
and n.nspname not like 'pg\\_%' -- no catalogs
and n.nspname != 'information_schema' -- no information_schema
and a.attnum > 0 -- no system att's
and not a.attisdropped -- no dropped columns
and a.attrelid = c.oid
and a.atttypid = t.oid
ORDER BY nspname, relname, attname;
Mostrar Esquemas e respectivas tabelas do Banco atual:
SELECT n.nspname as esquema, c.relname as tabela FROM pg_namespace n, pg_class c
WHERE n.oid = c.relnamespace
and c.relkind = 'r' -- no indices
and n.nspname not like 'pg\\_%' -- no catalogs
and n.nspname != 'information_schema' -- no information_schema
ORDER BY nspname, relname
Contar Todos os Registros de todas as tabelas de todos os bancos:
<?php
$conexao=pg_connect("host=127.0.0.1 user=postgres password=postabir");
$sql="SELECT datname AS banco FROM pg_database ORDER BY datname";
$consulta=pg_query($conexao,$sql);
$banco = array();
$c=0;
while ($data = @pg_fetch_object($consulta,$c)) {
$cons=$data->banco;
$banco[] .= $cons;
$c++;
}
$sql2="SELECT n.nspname as esquema,c.relname as tabela FROM pg_namespace n,
pg_class c
WHERE n.oid = c.relnamespace
and c.relkind = 'r' -- no indices
and n.nspname not like 'pg\\_%' -- no catalogs
and n.nspname != 'information_schema' -- no information_schema
ORDER BY nspname, relname";
for ($x=0; $x < count($banco);$x++){
if ($banco[$x] !="template0" && $banco[$x] != "template1" && $banco[$x] !
="postgres"){
$conexao2=pg_connect("host=127.0.0.1 dbname=$banco[$x] user=postgres
95
password=postabir");
$consulta2=pg_query( $conexao2, $sql2 );
while ($data = pg_fetch_object($consulta2)) {
$esquematab=$data->esquema.'.'.$data->tabela;
$sql3="SELECT count(*) FROM $esquematab";
$consulta3=pg_query($conexao2,$sql3);
$res=@pg_fetch_array($consulta3);
print 'Banco.Esquema.Tabela -> '.$banco[$x].'.'.$data->esquema.'.'.$data-
>tabela.' - Registro(s) - '.$res[0].'<br>';
$total += $res[0];
}
}
}
print "Total de Registro de todas as tabelas de todos os bancos ". $total;
?>
Dado o banco de dados, qual o seu diret??rio:
select datname, oid from pg_database;
Dado a tabela, qual o seu arquivo:
select relname, relfilenode from pg_class;
Mostrar chaves prim??rias das tabelas do esquema public
select indexrelname as indice, relname as tabela from pg_catalog.pg_statio_user_indexes as
A INNER JOIN pg_catalog.pg_index as B ON A.indexrelid=B.indexrelid WHERE
A.schemaname='public' AND B.indisprimary = true;
Para visualizar como as consultas s??o feitas internamente via psql usamos o comando
assim:
psql -U user banco -E
Vamos usar o banco municipios, criado com os munic??pios do Brasil. A tabela opt_cidades.
Veja Um Exemplo Que Retorna a Chave Prim??ria da Tabela opt_cidades
SELECT
ic.relname AS index_name,
bc.relname AS tab_name,
ta.attname AS column_name,
i.indisunique AS unique_key,
i.indisprimary AS primary_key
FROM
pg_class bc,
pg_class ic,
pg_index i,
pg_attribute ta,
pg_attribute ia
WHERE
bc.oid = i.indrelid
AND ic.oid = i.indexrelid
96
AND ia.attrelid = i.indexrelid
AND ta.attrelid = bc.oid
AND bc.relname = 'opt_cidades'
AND ta.attrelid = i.indrelid
AND ta.attnum = i.indkey[ia.attnum-1]
ORDER BY
index_name, tab_name, column_name;
Retornar??:
index_name | tab_name | column_name | unique_key | primary_key
opt_cidades_pkey | opt_cidades | id | t | t
Retornando o Nome do Esquema
SELECT n.nspname AS "Esquema"
FROM pg_catalog.pg_namespace AS n,
pg_catalog.pg_class AS c
WHERE c.relnamespace = n.oid AND c.relname='opt_cidades';
Retorno: Esquema
Retornar nomes de bancos:
SELECT datname AS banco FROM pg_database
WHERE datname != 'template0' and datname != 'template1' and datname != 'postgres'
ORDER BY datname
Retornar nomes e OIDs dos bancos:
SELECT oid, datname FROM pg_database;
Dado a tabela, qual o seu arquivo:
select relname, relfilenode from pg_class;
No Windows
Podemos passar par??metros para as macros, por exemplo:
doskey /exename=psql.exe dbinfo=SELECT datname,pg_encoding_to_char(encoding) FROM
pg_database WHERE datname='$1';
E ent??o apenas passar o par??metro na linha de comando:
postgres=# dbinfo postgres
Listar tabelas, e dono do esquema atual:
SELECT n.nspname as "Schema",
c.relname as "Tabela",
CASE c.relkind WHEN 'r' THEN 'table' WHEN 'v' THEN 'view' WHEN 'i' THEN
'index' WHEN 'S' THEN 'sequence' WHEN 's' THEN 'special' END as "Tipo",
u.usename as "Dono"
FROM pg_catalog.pg_class c
LEFT JOIN pg_catalog.pg_user u ON u.usesysid = c.relowner
LEFT JOIN pg_catalog.pg_namespace n ON n.oid = c.relnamespace
WHERE c.relkind IN ('r','')
AND n.nspname NOT IN ('pg_catalog', 'pg_toast')
AND pg_catalog.pg_table_is_visible(c.oid)
ORDER BY 1,2;
97
Listar Tabelas
select c.relname FROM pg_catalog.pg_class c
LEFT JOIN pg_catalog.pg_namespace n ON n.oid = c.relnamespace
WHERE c.relkind IN ('r','') AND n.nspname NOT IN ('pg_catalog', 'pg_toast')
AND pg_catalog.pg_table_is_visible(c.oid);
SELECT tablename FROM pg_tables WHERE tablename NOT LIKE 'pg%' AND tablename
NOT LIKE 'sql\_%'
Listar todas as tabelas, ??ndices, tamanho em KB e OIDs:
VACUUM; --Executar antes este comando
SELECT c1.relname AS tabela, c2.relname AS indice,
c2.relpages * 8 AS tamanho_kb, c2.relfilenode AS arquivo
FROM pg_class c1, pg_class c2, pg_index i
WHERE c1.oid = i.indrelid AND i.indexrelid = c2.oid
UNION
SELECT relname, NULL, relpages * 8, relfilenode
FROM pg_class
WHERE relkind = 'r'
ORDER BY tabela, indice DESC, tamanho_kb;
Tabelas e Soma
SELECT tablename, SUM( size_kb )
FROM
( SELECT c1.relname AS "tablename",
c2.relpages * 8 AS "size_kb"
FROM pg_class c1, pg_class c2, pg_index i
WHERE c1.oid = i.indrelid
AND i.indexrelid = c2.oid
UNION
SELECT relname, relpages * 8
FROM pg_class
WHERE relkind = 'r' ) AS relations
GROUP BY tablename;
-- r = ordinary table, i = index, S = sequence, v = view, c = composite type,
-- s = special, t = TOAST table
Tamanho em bytes de um banco:
select pg_database_size('banco');
Tamanho em bytes de uma tabela:
pg_total_relation_size('tabela')
Tamanho em bytes de tabela ou ??ndice:
pg_relation_size('tabelaouindice')
Lista donos e bancos:
SELECT rolname as dono, datname as banco
FROM pg_roles, pg_database
WHERE pg_roles.oid = datdba
ORDER BY rolname, datname;
98
Nomes de bancos:
select datname from pg_database where datname not in ('template0','template1') order by 1
Nomes e colunas:
select tablename,'T' from pg_tables where tablename not like 'pg\_%'
and tablename not in ('sql_features', 'sql_implementation_info', 'sql_languages',
'sql_packages', 'sql_sizing', 'sql_sizing_profiles')
union
select viewname,'V' from pg_views where viewname not like 'pg\_%'
Tamanho de esquema e ??ndice:
SELECT nspname,
sum(relpages * cast( 8192 AS bigint )) as "table size",
sum( ( select sum(relpages)
from pg_class i, pg_index idx
where i.oid = idx.indexrelid
and t.oid=idx.indrelid ) ) * cast( 8192 AS bigint ) as "index size",
sum ( relpages * cast( 8192 AS bigint ) + ( select sum(relpages)
from pg_class i, pg_index idx
where i.oid = idx.indexrelid
and t.oid=idx.indrelid ) * cast( 8192 AS bigint ) ) as "size"
FROM pg_class t, pg_namespace
WHERE relnamespace = pg_namespace.oid
and pg_namespace.nspname not like 'pg_%'
and pg_namespace.nspname != 'information_schema'
and relkind = 'r' group by nspname;
Retornando Tabelas e Seus Donos de um Esquema
SELECT n.nspname as "public",
c.relname as "opt_cidades",
CASE c.relkind WHEN 'r' THEN 'tabela' WHEN 'v' THEN 'view' WHEN 'i' THEN '??ndice'
WHEN 'S' THEN 'sequencia' WHEN 's' THEN 'especial' END as "Tipo", u.usename as "Dono"
FROM pg_catalog.pg_class c
LEFT JOIN pg_catalog.pg_user u ON u.usesysid = c.relowner
LEFT JOIN pg_catalog.pg_namespace n ON n.oid = c.relnamespace
WHERE c.relkind IN ('r','')
AND n.nspname NOT IN ('pg_catalog', 'pg_toast')
AND pg_catalog.pg_table_is_visible(c.oid)
ORDER BY 1,2;
Retorno:
public | opt_cidades | Tipo | Dono
--------+------------------+--------+----------
public | opt_cidades | tabela | postgres
public | opt_estado | tabela | postgres
Retornando o OID e o Esquema de uma Tabela
SELECT c.oid AS "OID",
n.nspname AS "Esquema",
c.relname AS "Tabela"
FROM pg_catalog.pg_class c
LEFT JOIN pg_catalog.pg_namespace n ON n.oid = c.relnamespace
99
WHERE pg_catalog.pg_table_is_visible(c.oid)
AND c.relname ~ '^opt_cidades$'
ORDER BY 2, 3;
Retorno:
OID | Esquema | Tabela
Este exemplo mostra uma consulta que lista os esquemas, nomes das tabelas e nomes
das colunas das chaves prim??rias de um banco de dados. Exemplo tirado da lista de
discuss??o pgsql-sql .
CREATE TEMP TABLE teste1 (id INT, texto TEXT, PRIMARY KEY (id));
CREATE TEMP TABLE teste2 (id1 INT, id2 INT, texto TEXT, PRIMARY KEY (id1,id2));
\dt
SELECT
pg_namespace.nspname AS esquema,
pg_class.relname AS tabela,
pg_attribute.attname AS coluna_pk
FROM pg_class
JOIN pg_namespace ON pg_namespace.oid=pg_class.relnamespace AND
pg_namespace.nspname NOT LIKE 'pg_%'
JOIN pg_attribute ON pg_attribute.attrelid=pg_class.oid AND
pg_attribute.attisdropped='f'
JOIN pg_index ON pg_index.indrelid=pg_class.oid AND
pg_index.indisprimary='t' AND
(
pg_index.indkey[0]=pg_attribute.attnum OR
pg_index.indkey[1]=pg_attribute.attnum OR
pg_index.indkey[2]=pg_attribute.attnum OR
pg_index.indkey[3]=pg_attribute.attnum OR
pg_index.indkey[4]=pg_attribute.attnum OR
pg_index.indkey[5]=pg_attribute.attnum OR
pg_index.indkey[6]=pg_attribute.attnum OR
pg_index.indkey[7]=pg_attribute.attnum OR
pg_index.indkey[8]=pg_attribute.attnum OR
pg_index.indkey[9]=pg_attribute.attnum
)
ORDER BY pg_namespace.nspname, pg_class.relname,pg_attribute.attname;
Este exemplo mostra uma consulta que lista os nomes dos esquemas, tabelas,
colunas e chaves das chaves estrangeiras, e os nomes dos esquemas, tabelas e
colunas referenciadas. Exemplo tirado da lista de discuss??o pgsql-sql
CREATE TEMPORARY TABLE t1 (id SERIAL PRIMARY KEY, nome TEXT);
CREATE TEMPORARY TABLE t2 (id INT REFERENCES t1, nome TEXT);
SELECT
n.nspname AS esquema,
cl.relname AS tabela,
a.attname AS coluna,
ct.conname AS chave,
nf.nspname AS esquema_ref,
clf.relname AS tabela_ref,
af.attname AS coluna_ref,
100
pg_get_constraintdef(ct.oid) AS criar_sql
FROM pg_catalog.pg_attribute a
JOIN pg_catalog.pg_class cl ON (a.attrelid = cl.oid AND cl.relkind = 'r')
JOIN pg_catalog.pg_namespace n ON (n.oid = cl.relnamespace)
JOIN pg_catalog.pg_constraint ct ON (a.attrelid = ct.conrelid AND
ct.confrelid != 0 AND ct.conkey[1] = a.attnum)
JOIN pg_catalog.pg_class clf ON (ct.confrelid = clf.oid AND clf.relkind = 'r')
JOIN pg_catalog.pg_namespace nf ON (nf.oid = clf.relnamespace)
JOIN pg_catalog.pg_attribute af ON (af.attrelid = ct.confrelid AND
af.attnum = ct.confkey[1]);
Retorno:
esquema | tabela | coluna | chave | esquema_ref | tabela_ref | coluna_ref |
criar_sql
pg_temp_1 | t2 | id | t2_id_fkey | pg_temp_1 | t1 | id | FOREIGN KEY (id)
REFERENCES t1(id)
SELECT a.attnum, a.attname AS field, t.typname as type, a.attlen AS length, a.atttypmod-4 as
lengthvar, a.attnotnull as notnull
FROM pg_class c, pg_attribute a, pg_type t
WHERE c.relname = 'apagar' AND a.attnum > 0 AND a.attrelid = c.oid AND a.atttypid =
t.oid
ORDER BY a.attnum;
Sa??da:
ID do campo, nomecampo, tipo, tamanho, nulo/n??onulo
Outros
SELECT ic.relname AS index_name, bc.relname AS tab_name, ta.attname AS column_name,
i.indisunique AS unique_key, i.indisprimary AS primary_key
FROM pg_class bc, pg_class ic, pg_index i, pg_attribute ta, pg_attribute ia
WHERE (bc.oid = i.indrelid)
AND (ic.oid = i.indexrelid)
AND (ia.attrelid = i.indexrelid)
AND (ta.attrelid = bc.oid)
AND (bc.relname = 'apagar')
AND (ta.attrelid = i.indrelid)
AND (ta.attnum = i.indkey[ia.attnum-1])
ORDER BY index_name, tab_name, column_name
Sa??da:
nomeindex/chave, nometabela, nomecampo, unique(t/f), nomepk (t/f)
SELECT rcname as index_name, rcsrc
FROM pg_relcheck, pg_class bc
WHERE rcrelid = bc.oid
AND bc.relname = 'apagar'
AND NOT EXISTS (
SELECT *
FROM pg_relcheck as c, pg_inherits as i
WHERE i.inhrelid = pg_relcheck.rcrelid
AND c.rcname = pg_relcheck.rcname
AND c.rcsrc = pg_relcheck.rcsrc
AND c.rcrelid = i.inhparent
)
101
Sa??da: retorna as constraints check.
SELECT pg_class.relname, pg_attribute.attname, pg_type.typname,
pg_attribute.atttypmod-4
FROM pg_class, pg_attribute, pg_type
WHERE pg_attribute.attrelid = pg_class.oid
AND pg_attribute.atttypid = pg_type.oid
AND pg_class.relname = 'apagar'
AND pg_attribute.attname = 'descricao'
Sa??da: tabela, campo, tipo, tamanho (varchar)
Outros Exemplos
create table tabela_exemplo (
campo_1 integer default 5, campo_2 text default 'exemplo', campo_3 float(10),
campo_4 serial, campo_5 double precision, campo_6 int8, campo_7 Point,
campo_8 char(3), campo_9 varchar(17) );
Depois de criada a tabela vamos criar a consulta que nos retornar?? as informa????es da
tabela:
SELECT
rel.nspname AS Esquema, rel.relname AS Tabela, attrs.attname AS Campo, "Type",
"Default", attrs.attnotnull AS "NOT NULL"
FROM (
SELECT c.oid, n.nspname, c.relname
FROM pg_catalog.pg_class c
LEFT JOIN pg_catalog.pg_namespace n ON n.oid = c.relnamespace
WHERE pg_catalog.pg_table_is_visible(c.oid) ) rel
JOIN (
SELECT a.attname, a.attrelid, pg_catalog.format_type(a.atttypid, a.atttypmod) as
"Type",
(SELECT substring(d.adsrc for 128) FROM pg_catalog.pg_attrdef d
WHERE d.adrelid = a.attrelid AND d.adnum = a.attnum AND a.atthasdef) as "Default",
a.attnotnull, a.attnum
FROM pg_catalog.pg_attribute a WHERE a.attnum > 0 AND NOT a.attisdropped )
attrs
ON (attrs.attrelid = rel.oid )
WHERE relname = 'tabela_exemplo' ORDER BY attrs.attnum;
Retorno:
testes-# WHERE relname = 'tabela_exemplo' ORDER BY attrs.attnum;
esquema | tabela | campo | Type | Default | NOT
NULL
Antes de tudo devemos criar um novo tipo de dado relacionado ao retorno que
obteremos da fun????o:
CREATE TYPE tabela_estrutura AS (Esquema text, Tabela text, Campo text, Tipo text,
Valor text, AutoIncremento bool);
102
A fun????o abaixo ?? definida em PL/PgSQL, linguagem procedural muito semelhante ao
PL/SQL do Oracle. A fun????o foi criada nesta linguagem devido a certas limita????es que
as fun????es em SQL possuem.
CREATE OR REPLACE FUNCTION Dados_Tabela(varchar(30))
RETURNS SETOF tabela_estrutura AS '
DECLARE
r tabela_estrutura%ROWTYPE;
rec RECORD;
vTabela alias for $1;
eSql TEXT;
BEGIN
eSql := ''SELECT
CAST(rel.nspname as TEXT), CAST(rel.relname AS TEXT) , CAST(attrs.attname AS
TEXT), CAST("Type" AS TEXT), CAST("Default" AS TEXT), attrs.attnotnull
FROM
(SELECT c.oid, n.nspname, c.relname
FROM pg_catalog.pg_class c
LEFT JOIN pg_catalog.pg_namespace n ON n.oid = c.relnamespace
WHERE pg_catalog.pg_table_is_visible(c.oid) ) rel
JOIN
(SELECT a.attname, a.attrelid,
pg_catalog.format_type(a.atttypid, a.atttypmod) as "Type",
(SELECT substring(d.adsrc for 128) FROM pg_catalog.pg_attrdef d
WHERE d.adrelid = a.attrelid AND d.adnum = a.attnum AND a.atthasdef)
as "Default", a.attnotnull, a.attnum
FROM pg_catalog.pg_attribute a
WHERE a.attnum > 0 AND NOT a.attisdropped ) attrs
ON (attrs.attrelid = rel.oid )
WHERE relname LIKE ''''%'' || vTabela || ''%''''
ORDER BY attrs.attnum'';
FOR r IN EXECUTE eSql
LOOP
RETURN NEXT r;
END LOOP;
IF NOT FOUND THEN
RAISE EXCEPTION ''Tabela % n??o encontrada'', vTabela;
END IF;
RETURN;
END
'
LANGUAGE 'plpgsql';
Para utilizar esta fun????o, utilize o seguinte comando:
SELECT * FROM Dados_Tabela('tabela');
Retorno:
esquema | tabela | campo | tipo | valor | autoincremento
Exemplos contidos no arquivo:
/usr/local/src/postgresql-8.1.3/src/tutorial/syscat.sql
SELECT rolname as "Donos", datname as Bancos
FROM pg_roles, pg_database
WHERE pg_roles.oid = datdba
103
ORDER BY rolname, datname;
Retorno: Donos e Bancos
SELECT n.nspname as esquema, c.relname as tabela
FROM pg_class c, pg_namespace n
WHERE c.relnamespace=n.oid
and c.relkind = 'r' -- not indices, views, etc
and n.nspname not like 'pg\\_%' -- not catalogs
and n.nspname != 'information_schema' -- not information_schema
ORDER BY nspname, relname;
Retorno: Esquemas e Tabelas
SELECT n.nspname as esquema, c.relname as tabela, a.attname as campo,
format_type(t.oid, null) as tipo_de_dado
FROM pg_namespace n, pg_class c,
pg_attribute a, pg_type t
WHERE n.oid = c.relnamespace
and c.relkind = 'r' -- no indices
and n.nspname not like 'pg\\_%' -- no catalogs
and n.nspname != 'information_schema' -- no information_schema
and a.attnum > 0 -- no system att's
and not a.attisdropped -- no dropped columns
and a.attrelid = c.oid
and a.atttypid = t.oid
ORDER BY nspname, relname, attname;
Retorno: esquemas, tabelas, campos, tipos de dados
SELECT n.nspname, o.oprname AS binary_op,
format_type(left_type.oid, null) AS left_opr,
format_type(right_type.oid, null) AS right_opr,
format_type(result.oid, null) AS return_type
FROM pg_namespace n, pg_operator o, pg_type left_type,
pg_type right_type, pg_type result
WHERE o.oprnamespace = n.oid
and o.oprkind = 'b' -- binary
and o.oprleft = left_type.oid
and o.oprright = right_type.oid
and o.oprresult = result.oid
ORDER BY nspname, left_opr, right_opr;
Retorno: operadores bin??rios
Baypassar os de sistema:
and n.nspname not like 'pg\\_%' -- no catalogs
SELECT n.nspname, p.proname, format_type(t.oid, null) as typname
FROM pg_namespace n, pg_aggregate a,
pg_proc p, pg_type t
WHERE p.pronamespace = n.oid
and a.aggfnoid = p.oid
and p.proargtypes[0] = t.oid
ORDER BY nspname, proname, typname;
104
Retorno: lista todas as fun????es agregadas e os tipos que podem ser aplicados
Dado o banco de dados, qual o seu diret??rio:
select datname, oid from pg_database;
Dado a tabela, qual o seu arquivo:
select relname, relfilenode from pg_class;
Exemplo que retorna ??ndice, campo, tipo, comprimento, null, default:
SELECT pg_attribute.attnum AS index,
attname AS field,
typname AS type,
atttypmod-4 as length,
NOT attnotnull AS "null",
adsrc AS default
FROM pg_attribute,
pg_class,
pg_type,
pg_attrdef
WHERE pg_class.oid=attrelid
AND pg_type.oid=atttypid
AND attnum >0
AND pg_class.oid=adrelid
AND adnum=attnum
AND atthasdef='t'
AND lower(relname)='datas'
UNION
SELECT pg_attribute.attnum AS index,
attname AS field,
typname AS type,
atttypmod-4 as length,
NOT attnotnull AS "null",
'' AS default
FROM pg_attribute,
pg_class,
pg_type
WHERE pg_class.oid=attrelid
AND pg_type.oid=atttypid
AND attnum>0
AND atthasdef='f'
AND lower(relname)='datas';
105
13 ???Conectividade
Vou mostrar a conectividade do PostgreSQL com o PHP, com o Java e com o Visual BASIC.
Tamb??m mostrarei a conectividade atrav??s do ODBC com o Access.
Conectando com o PHP
Com o PHP existe uma conex??o nativa. Veja um exemplo:
$conexao = pg_connect("host=127.0.0.1 dbname=testes user=postgres password=*******
port=5432");
if (!$conexao){
echo "Falha na conex??o com o banco. Veja detalhes t??cnicos: " .
pg_last_error($conexao);
}
Conex??o com Java
A conex??o do PostgreSQL com Java ?? utilizada por diversos clientes de gerenciamento ou
modelagem do PostgreSQL. Neste caso utiliza-se o driver JDBC do PostgreSQL. Vide pasta
\jdbc da instala????o.
Baixar de acordo com sua vers??o do PostgreSQL, o driver JDBC para o PostgreSQL
daqui:
http://jdbc.postgresql.org/download.html#jdbcselection
Aqui para o PostgreSQL vers??o 8.1.3 baixei o arquivo 8.1-405 JDBC 3.
VB Acessando PostgreSQL via ODBC
O PGODBC deve ser instalado no micro cliente e encontra-se em:
http://www.postgresql.org/ftp/odbc/versions/msi
Criar uma conex??o ODBC ao banco do PostgreSQL e no c??digo:
Global Conex As New ADODB.Connection
Global AccessConnect As String
Public Sub Conexao()
AccessConnect =
"driver={PostgreSQL};server=10.10.10.10;database=maubanco;uid=postgres;pwd=postgres;"
Conex.ConnectionString = AccessConnect
Conex.Open AtivConex.ActiveConnection = Conex
End Sub
Exemplo B??sico de Java Acessando PostgreSQL Via JDBC
Crie no PostgreSQL um pequeno banco de dados chamado agenda com uma ??nica tabela
chamada amigos.
Esta tabela contendo os campos nome e email apenas. Cadastre um ou mais registros para
melhor visualiza????o dos resultados.
import java.sql.*;
public class SQLStatement {
public static void main(String args[]) {
//String url = "jdbc:postgresql://10.0.1.53:5432/agenda";
String url = "jdbc:postgresql://localhost:5432/agenda";
106
//String url = "jdbc:postgresql:agenda"; //Assim pega os defaults
Connection con;
String query = "select * from amigos???;
Statement stmt;
try {
Class.forName("org.postgresql.Driver");
} catch(java.lang.ClassNotFoundException e) {
System.err.print("ClassNotFoundException: ");
System.err.println(e.getMessage());
}
try {
con = DriverManager.getConnection(url,"postgres", "postgres");
stmt = con.createStatement();
ResultSet rs = stmt.executeQuery(query);
ResultSetMetaData rsmd = rs.getMetaData();
int numberOfColumns = rsmd.getColumnCount();
int rowCount = 1;
while (rs.next()) {
System.out.println("Registro " + rowCount + ": ");
for (int i = 1; i <= numberOfColumns; i++) {
System.out.print(" Campo " + i + ": ");
System.out.println(rs.getString(i));
}
System.out.println("");
rowCount++;
}
stmt.close();
con.close();
} catch(SQLException ex) {
System.err.print("SQLException: ");
System.err.println(ex.getMessage());
}
}
}
Conex??o Com o Visual BASIC
Podemos nos conectar a uma base de dados PostgreSQL usando o Visual Basic via ADO.
Para isto temos que usar um driver ODBC para a plataforma Windows.
Voce vai precisar ter o PostgreSQL instalado e o driver ODBC tamb??m.
Instala-se o psqlODBC e configura-se a conex??o com o banco desejado.
If so then use something like
CurrentProject.Connection.Execute StrSql2
If not linked tables then use something like
Dim cnn as new ADODB.Connection
cnn.Open "DSN=my_dbs_dsn_name" 'or a full PostgreSQL connection string to save a trip
to the registry
cnn.Execute StrSql2
107
O
utr
o
e
x
e
m
p
l
o
:
Cri
ar
u
m
DSN
O
DBC
"
p
grese
arch
" vi
a AD
O
e
use
:
Dim
gcn
R
ese
arch As AD
O
DB.
C
o
n
n
ectio
n
Dim rsUId As AD
O
DB.
R
ecordse
t
'
o
p
e
n
t
h
e
d
a
t
a
b
ase
Se
t
gcn
R
ese
arch
=
3
D
N
e
w AD
O
DB.
C
o
n
n
ectio
n
Wit
h
gcn
R
ese
arch
.
C
o
n
n
ectio
nStri
n
g
=
3
D
"
dsn
=
3
D
p
grese
arch
"
.Pro
p
erties("
User ID
")
=
3
D
txt
Usern
a
m
e
.Pro
p
erties("Passw
ord
")
=
3
D
txtPassw
ord
.
O
p
e
n
En
d
Wit
h
A
c
e
s
s
a
n
d
o
c
o
m
o
V
i
s
u
a
l
C
#
.
n
et,
v
e
r
l
i
n
k
:
h
t
t
p://
w
w
w.lin
h
a
d
eco
dig
o
.co
m
.
br/
artig
os.
asp
?id
_
ac=
3
5
5
108
14 - Ferramentas
14.1 ??? psql
A ferramenta b??sica de administra????o do PostgreSQL ?? o psql, mas ?? uma ferramenta de
administra????o capaz de administrar praticamente tudo do PostgreSQL.
Para acess??-lo execute:
su ??? postgresql
psql ???U nomeuser nomebanco (tanto no Linux quanto em outros SOs).
Geral:
psql -h host -P port -U user -W (perguntar pela senha)
Alguns comandos do PostgreSQL da linha de comando do SO:
Se num UNIX fa??a login como usu??rio do PostgreSQL, se no Windows execute passando -U
nomeusuario.
Obtendo ajuda sobre um comando:
comando ???help
Se num UNIX existem tamb??m as manpages (p??ginas do manual):
man comando
psql -l -> lista os bancos de dados
psql -U nomeusuario nomebanco -> conectar ?? console psql no banco de dados
psql banco -E -> (debug) mostra internamente como cada consulta ?? realizada
psql ???version -> mostra vers??o do PostgreSQL
Outros comandos via linha de comando:
pg_dump, pg_dumpall, pg_restote, createdb, dropdb, createrole, droprole
Alguns Comandos do psql:
Para acessar, estando num UNIX:
su ??? nomeuserpg
psql -U nomeuserpg nomebanco
Estando no Windows
psql -U nomeuserpg nomebanco
O psql aceita quebra de linhas numa consulta.
O ponto e v??rgula (ou <g) indica ordem de execu????o.
Observe atentamente o prompt e suas varia????es:
=# - este prompt indica um superusu??rio
=> - este indica um usu??rio comum
-# - indica comando n??o finalizado. Aguardando o ponto e v??rgula
(# - aguardando o fecha par??nteses )
'# - aguardando um fecha ap??strofo '
Obs.: Em caso de erro teclar Ctrl+C para encerrar. Lembrando que isso no Windows
sai do psql.
109
\q - sair
\c nomebanco nomeuser ??? Conectar a outro banco
\i /path/script.sql -- importar script.sql
\timing -- iniciar/parar o cron??metro para atividades
\dT+ -- lista os tipos de dados do PG com detalhes
\cd -- mudar para outro diret??rio
\d ??? lista tabelas, ??ndices, sequ??ncias ou views
\d nometabela ??? mostra estrutura da tabela
\dt ??? lista tabelas
\di ??? lista indices
\ds ??? lista sequ??ncias
\dv ??? lista views
\dS ??? lista tabelas do sistema
\dn ??? lista esquemas
\dp ??? lista privil??gios
\du ??? lista usu??rios
\dg ??? lista grupos
\l - lista todos os bancos do servidor, juntamente com seus donos e codifica????es
\e - abre o editor vi com a ??ltima consulta
\o - inicia/termina a cria????o de arquivo. Ex.: \o arquivo.sql
\! comando_do_sistemaoperacional -- executa o arquivo do sistema operacional
\? - ajuda geral dos comandos do psql
\h * - exibe ajuda de todos os comandos
\h comandosql ??? ajuda espec??fica sobre o comando SQL, ex.: \h alter table
\H ??? ativa/desativa sa??da em HTML
\encoding ??? exibe codifica????o atual
Boa sugest??o:
\h CREATE DATABASE
\h CREATE ROLE
Exemplo de sa??da de consulta em HTML pelo PostgreSQL:
Gerando um relat??rio em HTML diretamente atrav??s do PostgreSQL
\o relatorio.html
SELECT * FROM cep_tabela WHERE uf='CE';
Obs.: Lembre que o PostgreSQL ?? case sensitive.
Com isso teremos um arquivo HTML contendo todos os registros retornados pela
consulta em uma tabela HTML, como no exemplo abaixo:
<table border="1">
<tr>
<th align="center">cep</th>
<th align="center">tipo</th>
<th align="center">logradouro</th>
<th align="center">bairro</th>
<th align="center">municipio</th>
<th align="center">uf</th>
</tr>
<tr valign="top">
<td align="left">60420440</td>
<td align="left">Rua
110
<td align="left">Vasco da Gama
<td align="left">Montese
<td align="left">Fortaleza
<td align="left">CE</td>
</tr>
</table>
Console do psql
14.2 - phpPgAdmin
Baixar de - http://phppgadmin.sourceforge.net/
- Copiar para o diret??rio web
- Editar o arquivo conf/config.inc.php e alterar para dois servidores (um local e outro remoto):
...
// Display name for the server on the login screen
$conf['servers'][0]['desc'] = 'Local';
// Hostname or IP address for server. Use '' for UNIX domain socket.
// use 'localhost' for TCP/IP connection on this computer
$conf['servers'][0]['host'] = '127.0.0.1';
...
// Example for a second server (PostgreSQL Remoto)
$conf['servers'][1]['desc'] = 'Remoto';
$conf['servers'][1]['host'] = '10.99.00.11';
$conf['servers'][1]['port'] = 5432;
$conf['servers'][1]['defaultdb'] = 'nomebancodefault';
...
// If extra login security is true, then logins via phpPgAdmin with no
// password or certain usernames (pgsql, postgres, root, administrator)
// will be denied. Only set this false once you have read the FAQ and
// understand how to change PostgreSQL's pg_hba.conf to enable
111
// passworded local connections.
$conf['extra_login_security'] = false;
Com isso teremos um login do phppgadmin assim:
14.3 ??? PgAdmin
PgAdmin
Site para download, caso sua distribui????o n??o traga ou n??o tenha como instalar (apt, synaptic
ou outro gerenciador de pacotes).
http://www.pgadmin.org/download/
?? uma ferramenta gr??fica desenvolvida pela equipe de desenvolvimento do PostgreSQL.
Muitos recursos. Traz um help sobre si e a documenta????o do PostgreSQL. Tecle F1 para
exibir.
Ao executar consultas na ferramenta SQL, tecle F7 para visualizar graficamente a consulta
na aba Explain.
112
14.4 - EMS PostgreSQL
O EMS ?? um ??timo gerenciador de diversos tipos de bancos, inclusive do PostgreSQL.
Download ??? http://www.sqlmanager.net/en/products/postgresql/manager (para Windows
existe uma vers??o free, a lite)
Aqui vou abordar as atividades principais e b??sicas de uso do EMS:
- Abrir em banco
- Criar em novo banco
- Criar tabelas
- Criar campos
- Criar chave prim??ria
- Criar chave estrangeira (relacionamento)
- Importar script .sql para um banco existente
- Exportar banco como script sql
- Executar consultas sql
Ap??s executar aparece algo como (vers??o 3.1.5.2 lite for Windows):
113
CRIAR UM NOVO BANCO
- Em Getting Starting (acima e ?? direita) clique no bot??o Create new database
- Ent??o digite o nome do novo banco:
- E clique no bot??o Next
- Ent??o entre com os dados do servidor (como abaixo):
- Na pr??xima tela mude algo somente se tiver certeza:
- Clique em Next
114
- Ent??o clique em Finish
- Ent??o clique em OK.
- Ent??o vemos o banco junto ao servidor (abaixo e ?? direita)
Para abri-lo e criar tabelas basta um duplo clique nele.
115
CRIAR TABELAS
- Execute um duplo clique no novo banco
- Observe a estrutura criada para o novo banco:
- Clique sobre Tables com o bot??o direito e New Table (ou tecle Ctrl+N)
- Acima digitamos o nome da tabela onde existe table1
- Ent??o clicamos na aba Fields.
116
- Mais um duplo clique, agora em Column Name, para que apare??a o Wizard de Campos:
- Veja que o nome do campo ?? ???codigo???. Que ele ?? do tipo BIGINT e tamb??m ?? chave
prim??ria.
- Veja agora como aparece nosso campo (com uma pequena chave ?? direita):
Isso mostra que este campo ?? nossa chave prim??ria.
117
- Clique em Compile e veja como fica:
- Vamos adicionar mais um campo (nome varchar(40)):
- Adicione os demais campos de forma semelhante.
- Veja que sempre depois de um OK vem um bot??o de Commit, com a sintaxe SQL do
comando que estamos executando no banco. Isso ?? um controle de transa????es do EMS
atrav??s do recurso existente no PostgreSQL.
Add Chave Estrangeira Add Chave Estrangeira
Banco e Host
Tabela
Adicionar Campo
Add Chave
??ndice
Campo
Add Chave Dados
DDL
118
ABRIR UM BANCO EXISTENTE
Caso queiramos trabalhar em um banco que j?? exista no servidor, vamos apenas abri-lo:
- Ap??s abrir o EMS apenas executamos um duplo clique sobre o nome do banco.
- Caso o nome do banco n??o esteja aparecendo no EMS clicamos no primeiro bot??o da barra
de ferramentas (Register Database) e informamos os dados do servidor
- Clicamos em Next.
119
- E selecionamos o banco na lista Database Name:
- E clicamos em Finish
COMO CRIAR UMA CHAVE ESTRANGEIRA (FOREIGN KEY)
- Ap??s criar a tabela e os campos, devemos criar a segunda tabela, que ir?? se relacionar com
a primeira atrav??s de um campo (chave estrangeira).
- Vamos supor duas tabelas: pedidos e pedido_itens, que ir??o se relacionar atrav??s do
campo c??digo em pedido e cod_pedido em pedido_itens, como abaixo:
pedido (codigo, descricao, data, preco_unitario)
pedido_itens (codigo, cod_pedido, quantidade)
- Para que um campo de uma tabela se relacione com outro, ele deve ser do mesmo tipo que
o outro.
- Abra a tabela pedido_itens
120
- Estando na aba Fields, clique em Foreign Key na coluna do meio com o bot??o direito e New
Foreign Key. Veja o di??logo abaixo:
- Acima e ?? direita selecione o campo que ir?? se relacionar com a outra tabela (cod_pedido)
- Em Foreign Table selecione a tabela do relacionamento (pedidos)
121
- Ent??o abaixo e ?? direita selecione o campo que vai se relacionar com este (codigo) e clique
na seta para a direita. Ent??o clique em OK. Veja que em OnDelete action e em On Update
Action existem diversas op????es. Veja meu tutorial sobre o assunto em:
http://ribafs.clanshosting.com
- Ent??o clique em Commit.
Agora vejamos como fica o c??digo SQL da nossa tabela pedido_itens. Clique na aba DDL e
ver??:
CREATE TABLE "public"."pedido_itens" (
"codigo" BIGINT NOT NULL,
"cod_pedido" BIGINT,
"quantidade" INTEGER,
CONSTRAINT "pedido_itens_pkey" PRIMARY KEY("codigo"),
CONSTRAINT "pedido_itens_fk" FOREIGN KEY ("cod_pedido")
REFERENCES "public"."pedidos"("codigo")
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE
) WITH OIDS;
122
EXPORTANDO UM BANCO COMO SCRIPT
Uma forma muito comum de se exportar um banco ?? na forma de script, especialmente para
abrir num outro servidor do mesmo tipo:
- Clique no menu Tools ??? Extract Metadata
- Selecione o banco que deseja exportar e clique em Next
- Na combo File name selecione o diret??rio e nome de arquivo para onde deseja exportar e
clique em Salvar. Ent??o clique em Next.
- Escolha se quer exportar somente dados, somente estrutura ou ambos e clique em Next.
- Apenas clique em Finish e ao terminar em Close.
IMPORTANDO UM BANCO DE UM SCRIPT
Esta ?? a opera????o inversa da anterior mas com algumas diferen??as. Se formos importar tudo,
devemos ter aqui apenas um banco vazio.
- Abrir o banco no EMS
- Clicar em Tools ??? SQL Script
- Ao centro clique em Open script e indique onde est?? o script a ser importado.
- Se tudo for importado a contendo clique no bot??o Refresh Tables ?? direita do bot??o Create
para visualizar a importa????o.
EXECUTANDO CONSULTAS SQL NO EMS
Uma boa utilidade para o gerenciador EMS ?? a de teste de consultas SQL.
- Abra o banco, abra o executor de script, digite a consulta em SQL e execute para saber os
resultados.
- Sempre que tiver alguma d??vida sobre uma consulta execute aqui para testar antes.
123
14.5 - Azzurry Clay (modelagem)
Ferramenta de Modelagem Azzurry Clay:
http://www.azzurri.jp/en/software/clay/index.jsp
Visualizador de Objetos e gerador de Diagramas de Entidade Relacionamento (DER), al??m
de fazer engenharia reversa nos bancos existentes.
Um ??timo tutorial online:
http://www.azzurri.jp/en/software/clay/quick_start_guide.jsp?print=on
Uma boa rela????o de ferramentas para o PostgreSQL pode ser encontrada no site do
PostgreSQL Brasil:
https://wiki.postgresql.org.br/wiki/Ferramentas
Outra boa rela????o no site Data Modeling Tools:
http://www.databaseanswers.com/modelling_tools.htm
14.6 ??? DbVisualizer
??tima ferramenta para visualizar bancos e montar o diagrama entidades-relacionamento.
http://www.dbvis.com/products/dbvis/download.html
14.7 ??? Openoffice2 Base
Usando o OpenOffice para abrir, editar bancos de dados PostgreSQL, como tamb??m criar
consultas, formul??rios e relat??rios.
Uma das formas de conectar o OpenOffice ao PostgreSQL ?? usando um driver JDBC do
PostgreSQL.
- Antes devemos ter instalado o OpenOffice com suporte a Java
- Baixe daqui:
http://jdbc.postgresql.org/download.html#jars
Para o PostgreSQL 8.1 podemos pegar o JDBC3 -
http://jdbc.postgresql.org/download/postgresql-8.1-405.jdbc3.jar
- Abrir o OpenOffice, pode ser at?? o Writer ??? Ferramentas ??? Op????es ??? Java ??? Class Path ???
Adicionar Arquivo (indicar o arquivo postgresql-8.0-313.jdbc2.jar baixado) e OK.
- Abrir o OOBase
- Conectar a um banco de dados existente
- Selecionar JDBC - Pr??ximo
- URL da fonte de dados:
jdbc:postgresql://127.0.0.1:5432/bdteste
Classe do driver JDBC:
org.postgresql.Driver
Nome do usu??rio - postgres
password required (marque, caso use senha)
Concluir
Digitar um nome para o banco do OOBase
Pronto. Agora todas as tabelas do banco bdteste est??o dispon??veis no banco criado no
OOBase.
Tamb??m podemos agora criar consulta com assistentes, criar formul??rios e relat??rios com
facilidade.
124
15 - Ap??ndices
15.1 ??? Planejamento e Projeto de Bancos de Dados
Projeto de bancos de dados ?? gen??rico e se aplica a qualquer SGBDR.
?? com um bom planejamento do banco de dados que se determina o qu??o eficaz foi o
processo de an??lise.
Introdu????o
O projeto do banco de dados e tamb??m os testes s??o muito importantes para a efici??ncia e
consist??ncia das informa????es e do aplicativo. ?? muito importante gastar algum tempo nesta
etapa, pois depois de algum tempo de implantado fica muito trabalhoso alterar estruturas de
bancos e aplicativos.
Projetos de banco de dados ineficazes geram consultas que retornam dados inesperados,
relat??rios que retornam valores sem sentido, etc. Um banco de dados bem projetado fornece
um acesso conveniente ??s informa????es desejadas e resultados mais r??pidos e precisos.
Exemplo de software de administra????o de SGBD para o PostgreSQL - PGAdmin
Informa????es de bancos de dados relacionais s??o armazenadas em tabelas ou entidades no
Modelo Entidade Relacionamento (MER).
Dicas sobre Campos
??? N??o armazenar resultado de c??lculos ou dados derivados de outros
??? Armazenar todas as informa????es (campos) separadamente. Cuidado com campos que
cont??m duas ou mais informa????es.
Selecionando o Campo para a Chave Prim??ria
A chave prim??ria ?? o campo ou campos que identificam de forma exclusiva cada registro.
??? N??o ?? permitido valores nulos na chave nem duplicados
??? Caso a tabela n??o tenha um campo que a identifique, pode-se usar um campo que numere
os registros seq??encialmente
Dica de Desempenho: O tamanho da chave prim??ria afeta o desempenho das opera????es,
portanto usar o menor tamanho que possa acomodar os dados do campo.
Exemplo
Tabela - Clientes
Campo - Nome (atributo)
Chave Prim??ria (Primary-Key) - CPF
Todos os campos correspondentes a um ??nico CPF juntamente com seus valores formam um
Registro ou Linha (Row)
A correta determina????o das tabelas, bem como dos campos ?? algo primordial no sucesso do
projeto do banco de dados.
Chave Prim??ria - obriga que todos os registros ter??o o campo correspondente ?? chave
prim??ria exclusivo (??nicos - unique). Num cadastro de clientes, todos os clientes cadastrados
ter??o um campo CPF exclisivo. Caso se tente inserir dois clientes com o mesmo CPF o
banco n??o permitir?? e emitir?? uma mensagem de erro acusando tentativa de viola????o da
chave prim??ria.
Exemplos de Campos indicados para chave prim??ria:
??? CPF
125
??? CNPJ
??? Matr??cula de aluno
??? Matr??cula de funcion??rio
Uma chave prim??ria pode ser formada por mais de um campo, quando um ??nico campo n??o
?? capaz de caracterizar a tabela.
Cada tabela somente pode conter uma ??nica chave prim??ria.
Relacionamentos - Um banco de dados ?? formado por v??rias tabelas. Idealmente essas
tabelas devem ser relacionadas entre si para facilitar a troca de informa????es e garantir a
integridade. Para relacionar tabelas usamos chaves existentes nas mesmas.
Tipos de Relacionamentos
??? Um para um
??? Um para v??rios
??? V??rios para v??rios
Relacionamento Um para Um
Aquele onde os campos que fazem o relacionamento s??o chaves prim??rias. Cada registro de
uma tabela se relaciona com apenas um registro da outra tabela. Este relacionamento n??o ??
muito comum.
Exemplo: CorrentistaBanco - Conjuge
Relacionamento Um para V??rios ou V??rios para Um
Aquele onde uma tabela tem um campo chave prim??ria que se relaciona com outra tabela
atrav??s de um campo chave estrangeira. ?? o tipo de relacionamento mais utilizado.
Exemplos:
??? Clientes - Pedidos
??? Produtos - Itens
??? Categorias - Itens
??? Fornecedores - Produtos
??? NotaFiscal - Produtos
Veja que cada um da esquerda se relaciona com v??rios do da direita.
Importante:
??? O n??mero de campos do relacionamento n??o precisa ser o mesmo
??? O tipo de dados dos campos do relacionamento deve ser igual, assim como o tamanho dos
campos e formatos
??? Chave prim??ria - Chave estrangeira (um - v??rios)
Relacionamento V??rios para V??rios
Este tipo de relacionamento n??o d?? para ser implementado no modelo relacional, portanto
sempre que nos deparamos com um deles devemos dividir em dois relacionamentos um para
v??rios (criando uma terceira tabela, que armazenar?? o lado v??rios dos relacionamentos).
Exemplo:
Pedidos - Produtos
Cada pedido pode conter v??rios produtos, assim como cada produto pode estar em v??rios
126
pedidos. A sa??da ?? criar uma tabela que contenha os itens do pedido.
Pedidos - Pedidos_Itens - Produtos
Pedidos 1 - N Pedidos_Itens N - 1 Produtos
Integridade Referencial
Ela garante a integridade dos dados nas tabelas relacionadas. Um bom exemplo ?? quando o
banco impede que se cadastre um pedido para um cliente inexistente, ou impede que se
remova um cliente que tem pedidos em seu nome.
Tamb??m se pode criar o banco de forma que quando atualizamos o CPF de um cliente ele
seja atualizado em todos os seus pedidos.
Normaliza????o de Tabelas
Normalizar bancos tem o objetivo de tornar o banco mais eficiente.
Uma regra muito importante ao criar tabelas ?? atentar para que cada tabela contenha
informa????es sobre um ??nico assunto, de um ??nico tipo.
1a Forma Normal
Os campos n??o devem conter grupos de campos que se repetem nos registros.
Exemplo:
Alunos: matricula, nome, data_nasc, serie, pai, mae
Se a escola tem v??rios filhos de um mesmo casal haver?? repeti????o do nome dos pais. Est??o
para atender ?? primeira regra, criamos outra tabela com os nomes dos pais e a matr??cula do
aluno.
2?? Forma Normal
Quando a chave prim??ria ?? composta por mais de um campo.
Devemos observar se todos os campos que n??o fazem parte da chave
dependem de todos os campos que fazem parte da chave.
Caso algum campo dependa somente de parte da chave, ent??o devemos colocar este campo
em outra tabela.
Exemplo:
TabelaAlunos
Chave (matricula, codigo_curso)
avaliacao descricao_curso
Neste caso o campo descricao_curso depende apenas do codigo_curso, ou seja, tendo o
c??digo do curso conseguimos sua descri????o. Ent??o esta tabela n??o est?? na 2?? Forma
Normal.
Solu????o:
Dividir a tabela em duas (alunos e cursos):
TabelaAlunos
Chave (matricula, codigo_curso)
avaliacao
127
TabelaCursos
codigo_curso
descricao_curso
3?? Forma Normal
Quando um campo n??o ?? dependente diretamente da chave prim??ria ou de parte dela, mas
de outro campo da tabela que n??o pertence ?? chave prim??ria. Quando isso ocorre esta tabela
n??o est?? na terceira forma normal e a solu????o ?? dividir a tabela.
Lembrando: Engenharia Reversa (parte de um banco ou de um script sql e gera o modelo).
Projeto
Fases do Projeto do Banco de Dados
??? Modelagem Conceitual
??? Projeto L??gico
Observa????o.: Trataremos apenas de novos projetos.
Modelo Conceitual - Define apenas quais os dados que aparecer??o no banco de dados,
sem se importar com a implementa????o do banco. Para essa fase o que mais se utiliza ?? o
DER (Diagrama Entidade-Relacionamento).
Modelo L??gico - Define quais as tabelas e os campos que formar??o as tabelas, como
tamb??m os campos-chave, mas ainda n??o se preocupa com detalhes como o tipo de dados
dos campos, tamanho, etc.
Etapas na Estrutura????o e Projeto de um Banco de Dados
??? Problemas a serem solucionados com o banco de dados
??? Determinar o objetivo do banco de dados
??? Determinar as tabelas necess??rias (cada uma com um ??nico assunto exclusivo)
??? Determinar os campos de cada tabela
??? Criar um DER
??? Verificar a estimativa do crescimento do banco e preparar-se para isso
??? Investigar como s??o armazenadas as informa????es atualmente e recolher a maior
quantidade de informa????es para o projeto
??? Adotar um modelo e justific??-lo
(Os itens acima fazem parte do Modelo Conceitual, abaixo do L??gico)
??? Determinar a chave prim??ria de cada tabela. Pode haver tabela sem chave prim??ria.
??? Determinar os relacionamentos e seus tipos
Obs.: Somente quando da implementa????o (modelo f??sico) ser??o tratados os detalhes
internos de armazenamento. O modelo f??sico ?? a tradu????o do modelo l??gico para a
linguagem do SGBDR a ser utilizado no sistema.
128
15.2 ??? Implementa????o de Banco de Dados com o PostgreSQL - Modelo F??sico
Softwares free de Modelagem e Gerenciamento do PostgreSQL
PGAdmin: (http://www.postgresql.org/ftp/pgadmin3/release/)
EMS: (http://www.sqlmanager.net/en/products/postgresql/manager/download)
DBDesigner: (http://fabforce.net/downloads.php)
DbVisualizer: http://www.dbvis.com/products/dbvis/
Em forma de Plug-ins para Eclipse
QuantumDB: (http://quantum.sourceforge.net/)
Azzurri/Clay: (http://www.azzurri.jp/en/software/clay/download.jsp)
SQLExplorer: (http://sourceforge.net/projects/eclipsesql)
Uma grande e boa rela????o de softwares de projeto, modelagem e gerenciamento para o
PostgreSQL, free e comercial pode ser encontrada em no site oficial so PostgreSQL Brasil:
https://wiki.postgresql.org.br/wiki/Ferramentas.
Suporte ?? Acentua????o na Cria????o de Bancos no PostgreSQL
A codifica????o default do PG 7.X ?? a SQL_ASCII
A do PG 8.X ?? a UNICODE
Ambas tem suporte a acentua????o, mas geram problemas no backup/importa????o.
Codifica????o
Para um suporte est??vel ?? acentua????o em portugu??s do Brasil uma boa op????o ?? criar o
banco passando a codifica????o (Encoding) LATIN1
ENCODING = 'LATIN1'
Cria????o do Banco
Criaremos o banco do projeto de testes com o PGAdmin, contendo esquemas, tabelas,
views, fun????es do tipo SQL e Pl/PgSQL, usu??rios, privil??gios, consultas, etc. para ilustrar
nosso projeto e servir de base para os testes (em seguida).
Analisar o modelo sugerido e detalhar o banco, tipos de dados de cada campo, tamanho,
esquemas do banco, usu??rios e senhas, privil??gios de cada um (cuidados com a seguran??a),
etc.
Ativar o Suporte ??s Fun????es Pl/Pgsql (Stored Procedures)
Ap??s ter criado o banco, podemos ativar o suporte a plpgsql.
Ativar suporte a Pl/PgSQL requer dois passos:
- instalar a biblioteca Pl/PgSQL, que ?? do tipo contrib
- definir a linguagem (como sugerido abaixo)
- Ativando na console do PG depois de conectar ao banco onde ficar?? o suporte:
CREATE LANGUAGE 'plpgsql' HANDLER plpgsql_call_handler LANCOMPILER 'PL/pgSQL'
- Ativando como superusu??rio na console (fora dos bancos)
su - postgres
$ createlang plpgsql -U nomesuperuser nomebanco
Ou simplesmente:
$ createlang plpgsql nomebanco
JDBC
Alguns programas em Java o utilizam, como o plugin QuantumDB.
129
O JDBC para o PostgreSQL encontra-se em:
http://jdbc.postgresql.org/download.html#jars
Veja que para selecionar o arquivo .jar correto, precisamos cruzar a vers??o do
PostgreSQL ?? esquerda com a vers??o do JDBC desejado.
Exemplo: Para uso como cliente em sua m??quina pelo Quantum DB (no Eclipse) e com
PostgreSQL 8.1 baixar o arquivo: 8.1-405 JDBC 3
Esquemas
Definir os esquemas do banco.
Quando o cliente precisa de muitas tabelas, organizadas em v??rias ??reas a sa??da imediata ??
a cria????o de v??rios bancos de dados. Mas quando da implementa????o do aplicativo que ir??
utilizar estes bancos os desenvolvedores se deparar??o com a dificuldade de comunica????o e
acesso entre os bancos, j?? que com uma ??nica conex??o ter??o acesso a todos os objetos do
banco. ?? muito ??til para estes casos criar um ??nico banco e neste criar v??rios esquemas,
organizados por ??reas: pessoal, administracao, contabilidade, engenharia, etc.
Mas e quando uma destas ??reas tem outras sub-??reas, como por exemplo a engenharia, que
tem reservat??rios, obras, custos e cada um destes tem diversas tabelas. O esquema
engenharia ficar?? muito desorganizado. Em termos de organiza????o o ideal seria criar um
banco para cada ??rea, engenharia, contabilidade, administra????o, etc. E para engenharia, por
exemplo, criar esquemas para cada subarea, custos, obras, etc. Mas n??o o ideal em termos
de comunica????o e acesso entre todos os bancos.
Criar Esquema
Num gerenciador do PG entra-se no banco e nesse cria-se o esquema.
Ou
CREATE SCHEMA nomeesquema;
Acessando Objetos de Esquemas
Para acessar um esquema devemos passar seu caminho:
nomeesquema.nometabela
Ou
nomebanco. nomeesquema.nometabela
Criando Tabela em Esquema
CREATE TABLE nomeesquema.nometabela (
...
)
Criando Esquema e tornando um Usu??rio dono
CREATE SCHEMA nomeesquema AUTHORIZATION nomeusuario;
Removendo privil??gios de acesso a usu??rio em esquema
REVOKE CREATE ON SCHEMA public FROM PUBLIC
Com isso estamos tirando o privil??gio de todos os usu??rios acessarem o esquema public.
130
Acesso aos Esquemas
Quando se cria um banco no PostgreSQL, por default, ele cria um esquema p??blico (public)
no mesmo e ?? neste esquema que s??o criados todos os objetos quando n??o especificamos o
esquema. A este esquema public todos os usu??rios do banco t??m livre acesso, mas aos
demais existe a necessidade de se dar permiss??o para que os mesmos acessem.
Tabelas
O PostgreSQL permite adicionar privil??gios por objeto do banco: tabela, esquema, banco,
etc. Em termos de seguran??a ?? importante, em geral, que os privil??gios sejam adicionados ao
usu??rio por tabela, cada tabela tendo um dono e cada dono tendo seus espec??ficos
privil??gios.
Dica de Desempenho: Na cria????o das tabelas alertar para a cria????o de ??ndices para os
campos envolvidos na cl??usula WHERE. Isso tornar?? essas consultas mais r??pidas.
Views
Juntamente com as fun????es armazenadas (stored procedures) as views s??o boas
alternativas para tornar o c??digo mais simples e o aplicativo mais eficientes, j?? que parte do
processamento feito pelo c??digo agora j?? est?? pronto e debugado no banco, o que torna o
c??digo mais r??pido e eficiente. O uso de views e de fun????es armazenadas em bancos ??
semelhante ao uso de fun????es e classes no c??digo.
Dica: para uso de views, sintaxe de fun????es internas e uso de cl??usulas SQL no
PostgreSQL, tutoriais de EMS e v??rios outros sobre PostgreSQL, al??m de PHP, JavaScript,
etc, confira o site abaixo:
http://ribafs.byethost2.com ou
http://ribafs.tk
Cria????o do Banco Tutorial sobre PGAdmin para criar o banco funcionarios.
Bem, de posse do script .sql acima, praticamente o que teremos de fazer ?? criar um banco
vazio no PGAdmin.
Abrir o PGAdmin
Caso n??o tenha salvado a senha ele pedir?? sempre que iniciar
Ao abrir clique com o bot??o direito ?? direita em Databases e em New Database.
- No di??logo New Database entre com o Name do banco (funcionarios), o Owner (postgres).
Idealmente mudar o nome do superusuario default para um nome mais seguro, assim como a
senha (m??nimo de 8 caracteres, misturando letras e algarismos e idealmente com s??mbolos).
Tamb??m altere Encoding (codifica????o) para LATIN1.
- Ent??o selecione o banco funcionarios e clique no bot??o SQL acima.
- Clique no bot??o open file para indicar o nosso script sql gerado anteriormente.
??? Clique na setinha verde (Execute query)
131
Eventuais Corre????es:
Caso receba mensagens de erro sobre tipo UNSIGNED, verifique o script e remova todas as
ocorr??ncias de UNSIGNED e execute novamente. Como o DBDesigner foi projetado para o
MySQL um outro erro que pode ocorrer ?? com a string AUTO_INCREMENT, que tamb??m
deve ser removida e novamente devemos executar o script. Feitas estas corre????es o script
executa normalmente e cria o nosso banco funcionarios.
Ent??o verifique ?? esquerda que o banco j?? cont??m as 3 tabelas de acordo com o script.
Engenharia Reversa
Um ??timo software para conex??o ao PostgreSQL, engenharia reversa (gera diagramas ER
dos bancos existentes) e exporta os diagramas em forma de imagens: DbVisualizer.
15.3 - Integridade Referencial - Postgresql
Tradu????o livre do documenta????o "CBT Integrity Referential":
http://techdocs.postgresql.org/college/002_referentialintegrity/.
Integridade Referencial (relacionamento) ?? onde uma informa????o em uma tabela se
refere ?? informa????es em outra tabela e o banco de dados refor??a a integridade.
Tabela1 ------------> Tabela2
Onde ?? Utilizado?
Onde pelo menos em uma tabela precisa se referir para informa????es em outra tabela e
ambas precisam ter seus dados sincronizados.
Exemplo: uma tabela com uma lista de clientes e outra tabela com uma lista dos pedidos
efetuados por eles.
Com integridade referencial devidamente implantada nestas tabelas, o banco ir?? garantir que
voc?? nunca ir?? cadastrar um pedido na tabela pedidos de um cliente que n??o exista na tabela
clientes.
O banco pode ser instru??do para automaticamente atualizar ou excluir entradas nas tabelas
quando necess??rio.
Primary Key (Chave Prim??ria) - ?? o campo de uma tabela criado para que as outras tabelas
relacionadas se refiram a ela por este campo. Impede mais de um registro com valores
iguais. ?? a combina????o interna de UNIQUE e NOT NULL.
Qualquer campo em outra tabela do banco pode se referir ao campo chave prim??ria, desde
que tenham o mesmo tipo de dados e tamanho da chave prim??ria.
Exemplo:
clientes (codigo INTEGER, nome_cliente VARCHAR(60))
codigo nome_cliente
1 PostgreSQL inc.
2 RedHat inc.
pedidos (relaciona-se ?? Clientes pelo campo cod_cliente)
cod_pedido cod_cliente descricao
132
Caso tentemos cadastrar um pedido com cod_cliente 2 ele ser?? aceito.
Mas caso tentemos cadastrar um pedido com cod_cliente 3 ele ser?? recusado pelo banco.
Criando uma Chave Prim??ria
Deve ser criada quando da cria????o da tabela, para garantir valores exclusivos no campo.
CREATE TABLE clientes(cod_cliente BIGINT, nome_cliente VARCHAR(60)
PRIMARY KEY (cod_cliente));
Criando uma Chave Estrangeira (Foreign Keys)
?? o campo de uma tabela que se refere ao campo Primary Key de outra.
O campo pedidos.cod_cliente refere-se ao campo clientes.codigo, ent??o pedidos.cod_cliente
?? uma chave estrangeira, que ?? o campo que liga esta tabela a uma outra.
CREATE TABLE pedidos(
cod_pedido BIGINT,
cod_cliente BIGINT REFERENCES clientes,
descricao VARCHAR(60)
);
Outro exemplo:
FOREIGN KEY (campoa, campob)
REFERENCES tabela1 (campoa, campob)
ON UPDATE CASCADE
ON DELETE CASCADE);
Cuidado com exclus??o em cascata. Somente utilize com certeza do que faz.
Dica: Caso desejemos fazer o relacionamento com um campo que n??o seja a chave prim??ria,
devemos passar este campo entre par??nteses ap??s o nome da tabela e o mesmo deve
obrigatoriamente ser UNIQUE.
...
cod_cliente BIGINT REFERENCES clientes(nomecampo),
...
Par??metros Opcionais: ON UPDATE parametro e ON DELETE parametro.
ON UPDATE paramentros:
NO ACTION (RESTRICT) - quando o campo chave prim??ria est?? para ser atualizado a
atualiza????o ?? abortada caso um registro em uma tabela referenciada tenha um valor mais
antigo. Este par??metro ?? o default quando esta cl??usula n??o recebe nenhum par??metro.
Exemplo: ERRO Ao tentar usar "UPDATE clientes SET codigo = 5 WHERE codigo = 2. Ele
vai tentar atualizar o c??digo para 5 mas como em pedidos existem registros do cliente 2
haver?? o erro.
CASCADE (Em Cascata) - Quando o campo da chave prim??ria ?? atualizado, registros na
tabela referenciada s??o atualizados.
Exemplo: Funciona: Ao tentar usar "UPDATE clientes SET codigo = 5 WHERE codigo = 2.
Ele vai tentar atualizar o c??digo para 5 e vai atualizar esta chave tamb??m na tabela pedidos.
SET NULL (atribuir NULL) - Quando um registro na chave prim??ria ?? atualizado, todos os
campos dos registros referenciados a este s??o setados para NULL.
133
Exemplo: UPDATE clientes SET codigo = 9 WHERE codigo = 5;
Na clientes o codigo vai para 5 e em pedidos, todos os campos cod_cliente com valor 5
ser??o setados para NULL.
SET DEFAULT (assumir o Default) - Quando um registro na chave prim??ria ?? atualizado,
todos os campos nos registros relacionados s??o setados para seu valor DEFAULT.
Exemplo: se o valor default do codigo de clientes ?? 999, ent??o
UPDATE clientes SET codigo = 10 WHERE codigo = 2. Ap??s esta consulta o campo c??digo
com valor 2 em clientes vai para 999 e tamb??m todos os campos cod_cliente em pedidos.
ON DELETE parametros:
NO ACTION (RESTRICT) - Quando um campo de chave prim??ria est?? para ser deletado, a
exclus??o ser?? abortada caso o valor de um registro na tabela referenciada seja mais velho.
Este par??metro ?? o default quando esta cl??usula n??o recebe nenhum par??metro.
Exemplo: ERRO em DELETE FROM clientes WHERE codigo = 2. N??o funcionar?? caso o
cod_cliente em pedidos contenha um valor mais antigo que codigo em clientes.
CASCADE - Quando um registro com a chave prim??ria ?? exclu??do, todos os registros
relacionados com aquela chave s??o exclu??dos.
SET NULL - Quando um registro com a chave prim??ria ?? exclu??do, os respectivos campos
na tabela relacionada s??o setados para NULL.
SET DEFAULT - Quando um registro com a chave prim??ria ?? exclu??do, os campos
respectivos da tabela relacionada s??o setados para seu valor DEFAULT.
Excluindo Tabelas Relacionadas
Para excluir tabelas relacionadas, antes devemos excluir a tabela com chave estrangeira.
Tudo isso est?? na documenta????o sobre CREATE TABLE:
http://www.postgresql.org/docs/8.0/interactive/sql-createtable.html
ALTER TABLE
http://www.postgresql.org/docs/8.0/interactive/sql-altertable.html
Chave Prim??ria Composta (dois campos)
CREATE TABLE tabela (
codigo INTEGER,
data DATE,
nome VARCHAR(40),
PRIMARY KEY (codigo, data)
);
15.4 - Dicas Pr??ticas de uso do SQL
Armazenar Arquivos Bin??rios no Pr??prio Banco
134
Utilize a contrib LO para esta finalidade.
Lembre que como ?? uma contrib normalmente n??o vem ligada e temos que ligar
especificamente ao banco onde queremos utilizar.
Ligando, de dentro do banco usar o comando \i:
Acesse o diret??rio lo das contribs do PostgreSQL:
/usr/local/src/postgresql-8.1.3/contrib/lo
Ent??o execute o comando "make install".
Acesse o banco e:
\i /usr/local/src/postgresql-8.1.3/contrib/lo/lo.sql
Para usar veja o README.lo no diret??rio lo e tamb??m a documenta????o oficial do
PostgreSQL:
Portugu??s do Brasil - Cap??tulo 28:
http://pgdocptbr.sourceforge.net/pg80/largeobjects.html
Ingl??s - Cap??tulo 29: http://www.postgresql.org/docs/8.1/interactive/largeobjects.html
Nomes de Campos com espa??o ou acento
Devem vir entre aspas duplas.
Coment??rios
Em SQL os coment??rios mais utilizados s??o da seguinte forma:
SELECT * FROM tabela; - - Este ?? um coment??rio
- - Este ?? outro coment??rio
Tamb??m s??o aceitos os coment??rios herdados do C:
/* Coment??rio herdado do C e v??lido em SQL */
Dicas Pr??ticas de Uso do SQL
Testar se campo ?? de e-mail, ou seja, se cont??m um @:
SELECT POSITION('@' IN 'ribafs@gmail.com') > 0
select 'ribafs@gmail.com' ~ '@'
select 'ribafs@gmail.com' like '%@%'
select 'ribafs@gmail.com' similar to '%@%.%';
Alguns da lista de PHP (phpfortaleza@yahoogrupos.com.br - groups.yahoo.com).
135
Temos um campo (insumo) com valores = 1, 2, 3, ... 87
Queremos atualizar para 0001, 0002, 0003, ... 0087
UPDATE equipamentos SET insumo = '000' || insumo WHERE LENGTH(insumo) = 1;
UPDATE equipamentos SET insumo = '00' || insumo WHERE LENGTH(insumo) = 2;
Outra sa??da mais elegante ainda:
UPDATE equipamentos SET insumo = REPEAT('0', 4-LENGTH(insumo)) || insumo;
INSERINDO COM SELECT
Tendo uma tabela com registros e outra para onde desejo incluir registros daquela
INSERT INTO equipamentos2 SELECT grupo, insumo, descricao, unidade from
equipamentos2;
insert into engenharia.precos (insumo_grupo,insumo) select grupo,insumo from engenharia;
Com CAST
insert into engenharia.insumos (grupo,insumo,descricao,unidade) select
grupo,insumo,descricao, CAST(unidade AS int2) AS "unidade" from engenharia.apagar
insert into engenharia.insumos (grupo,insumo,descricao,unidade) select
grupo,insumo,descricao, cast(unidade AS INT2) AS unidade from engenharia.apagar
select trim(length(bairro)) from cep_tabela where cep='60420440'; -- Montese, Retorna 7
Atrav??s do PHP
$conn = pg_connect("host=10.40.100.186 dbname=apoena user=_postgresql");
for($x=10;$x<=87;$x++){
$sql="update engenharia.precos set custo_produtivo = (select custo_produtivo from
engenharia.apagar where insumo='$x') where insumo='00' || '$x'";
$ret=pg_query($conn,$sql);
}
Diferen??a em Dias entre duas Datas
SELECT DATE '2006-03-29' ??? DATE '2006-01-12';
SELECT (CAST('10/02/2005' AS DATE) - CAST('10/01/2006'));
136
POPULAR BANCO COM MASSA DE TESTES
Script el Perl
#!/usr/bin/perl
$count = 1;
$arquivosaida = "populate.sql";
@chars = ("A" .. "Z", "a" .. "z", 0 .. 9);
@numbers = (1 .. 9);
@single_chars = ("a" .. "e");
$totalrecords = 5000; # 5 milhoes
open(OUTPUT, "> $arquivosaida");
print OUTPUT "DROP TABLE index_teste;\n";
print OUTPUT "CREATE TABLE index_teste (";
print OUTPUT "codigo INT, nome VARCHAR(10), numero INT, letra CHAR(1)";
print OUTPUT ");\n";
print OUTPUT "COPY index_teste (codigo, nome, numero, letra) FROM stdin;\n";
while ($count <= $totalrecords){
$randstring = join("", @chars [map{rand @chars} ( 1 .. 8 ) ]);
$randnum = join("", @numbers [map{rand @numbers} ( 1 .. 8 ) ]);
$randletter = join("", @single_chars [map{rand @single_chars} (1)]);
print OUTPUT
#print OUTPUT "INSERT INTO index_teste
VALUES($count,'$randstring',$randnum,'$randletter');\n";
$count."\t".$randstring."\t".$randnum."\t".$randletter."\n";
$count++;
};
#print OUTPUT "\n";
#print OUTPUT "\nCREATE INDEX indexteste_codigo_index ON index_teste(codigo);\n";
#print OUTPUT "CREATE INDEX indexteste_numero_index ON index_teste(numero);\n";
#print OUTPUT "VACUUM ANALYZE index_teste;\n";
close OUTPUT;
Via PHP
$con=pg_connect("host=127.0.0.1 user=postgres password=postgres");
function datediff($data_final, $data_inicial){
global $con;
$str="SELECT DATE '$data_final' - DATE '$data_inicial'";
$recordset = pg_query($con, $str);
$diferen??a=pg_fetch_array($recordset);
return $diferen??a[0];
}
echo "Diferen??a: " . datediff("1969-01-08", "1968-10-16");
137
Ajustando o formato da Data do Sistema
SHOW DATESTYLE;
SET DATESTYLE TO ISO; YYYY-MM-DD HH:MM:SS
SET DATESTYLE TO PostgreSQL; Formato tradicional do PostgreSQL (
SET DATESTYLE TO US; MM/DD/YYYY
SET DATESTYLE TO NONEUROPEAN, GERMAN; DD.MM.YYYY
SET DATESTYLE TO EUROPEAN; DD/MM/YYYY
Obs.: De forma permanente ajustar o postgresql.conf.
Outros usos para SHOW:
SHOW server_version;
SHOW server_encoding; -- Idioma para ordena????o do texto (definido pelo initdb)
SHOW lc_collate; -- Idioma para classifica????o de caracteres (definido pelo initdb)
SHOW all; -- Mostra todos os par??metros
Tamb??m podemos setar o datestyle quando alteramos um banco:
ALTER DATABASE nomebanco SET DATESTYLE = SQL, DMY;
Tamb??m pode ser atribu??do juntamente com o Usu??rio:
ALTER ROLE nomeuser SET DATESTYLE TO SQL, DMY;
Ajustando uma Faixa de Registros com LIMIT and OFFSET
SELECT isbn, title, publication FROM editions NATURAL JOIN books AS b (book_id)
ORDER BY publication DESC LIMIT 5;
SELECT isbn, title, publication FROM editions NATURAL JOIN books AS b (book_id)
ORDER BY publication DESC LIMIT 5 OFFSET 2;
Trar?? 5 registros, iniciando do segundo.
fsync - checa integridade dos dados gravados no banco, vindos dos logs. Vem ligado por
padr??o
Gargalo de SGBDs - leitura/grava????o (I/O) de discos.
Ligar/Desligar fsync no:
postgresql.conf, setar para
fsync=true ??? Nunca deve ficar false
REORDENAR CAMPOS DE TABELA
Se voc?? estiver falando da ordem dos campos na tabela n??o existe raz??o para isso no
modelo relacional.
Voc?? sempre pode especificar os campos desejados, e na ordem desejada,
no SELECT.
Se necess??rio voc?? pode criar uma view:
CREATE VIEW nome_view AS SELECT id,cpf,nome FROM sua_tabela;
138
Se ainda n??o estiver satisfeito pois quer suas tabelas "bonitinhas" e organizadas:
1. CREATE TABLE novo_nome AS SELECT id,cpf,nome FROM sua_tabela;
2. DROP TABLE sua_tabela;
3. ALTER TABLE novo_nome RENAME TO sua_tabela;
Osvaldo (Na lista PostgreSQL-Brasil).
Calculando a Mem??ria a ser usada pelo PostgreSQL
* Shared Buffers
Exemplo de 1GB RAM
A shared buffers ser?? 25% da RAM
256 * 1024 / 8 = 32768
logo shared_buffers = 32768
* Shared Memory
A Shared Memory ser?? igual a shared buffer + (de 10 a 20)%
Shared Memory = 256MB + 15%
256MB + 15% = 295 MB
295MB = 295 * 1024 * 1024 = 309329920
No Linux:
/etc/sysctl.conf
kernel.shmmax = 309329920
kernel.shmall = 309329920
kernel.shmmni = 1
Comando para alterar as vari??veis do kernel sem re-iniciar o Linux:
sysctl -w kernel.shmmax=309329920
sysctl -w kernel.shmall=309329920
sysctl -w kernel.shmmni=1
Dicas de instala????o do PostgreSQL em GNU/Linux.
* Utilizar HD do tipo SATA
* Criar uma parti????o exclusiva para os dados. Ex: /database
* Utilizar nesta parti????o o sistema de arquivos XFS
* Deixar nesta parti????o apenas os flags: RW,NOATIME
Do site: http://www.gescla.com.br/oficina_postgre.asp
Cria????o de Tipos de Dados
CREATE TYPE "img" (input = "int4in", output = "int4out", internallength = 4, externallength =
10, delimiter = ",", send = "int4out", receive = "int4in", passedbyvalue, alignment = int,
storage = plain);
Uso:
create table imagens (codigo int8, descricao varchar(60), imagem img);
Construtor de Matriz
??? Matriz unidimensional - array[2,4,6+2]
??? SELECT array[2,4,6+2]; -- Retorna 2,4,8
??? Multidimensional - composta por duas ou mais matrizes unidimensionais:
??? Obs.: O ??ndice do valor da matriz constru??do com ARRAY sempre come??a com um.
139
??? Ao criar uma tabela podemos usar matriz em seus tipos de dados, ao inv??s de tipos
simples.
??? Exemplo:
??? CREATE TABLE testematriz (codigo INT [], nome char[30][30]);
??? array[array[2,4,6],array[1,3,5]] ou
array[[2,4,6],[1,3,5]]
??? Com subconsultas. Entre par??nteses e n??o concletes.
??? select array(select oid from pg_proc where proname like 'bytea%');
Retorna:
1244,31,1948,1949,1950,1951,1952,1953,1954,2005,2006,2011,2412,2413,16823
ENCONTRAR REGISTROS DUPLICADOS
SELECT DISTINCT cep FROM cep_tabela
WHERE cep IN (SELECT cep FROM cep_tabela AS Tmp GROUP BY cep,tipo,logradouro,
bairro, municipio,uf HAVING Count(*) >1 ) ORDER BY cep;
(Adapta????o de consulta gerada pelo assistente Encontrar duplicadas do Access).
Ou:
select count(*) as quantos, cep from cep_tabela group by cep having count(*) > 1;
REMOVER DUPLICADOS
Para tabelas criadas WITH OIDS:
DELETE FROM cep_tabela2 WHERE oid NOT IN
(SELECT min(oid) FROM cep_tabela2 GROUP BY cep, tipo, logradouro, bairro, municipio,
uf);
Do exemplo 8.10 do manual em portugu??s do Brasil.
Ou:
Criando uma segunda tabela que conter?? somente os registros exclusivos e ainda guarda
uma c??pia da tabela original:
CREATE TABLE cep_tabela2 AS SELECT cep, tipo, logradouro, bairro, municipio, uf FROM
cep_tabela GROUP BY cep, tipo, logradouro, bairro, municipio, uf ORDER BY cep;
Caso n??o importe qual das duplicatas ir?? permanecer:
CREATE TABLE tab_temp AS SELECT DISTINCT * FROM tabela;
DROP tabela;
ALTER TABLE tab_temp RENAME TO tabela;
(Dica de Osvaldo Rosario Kussama na lista de PostgreSQL Brasil)
140
Delimitadores
A maioria dos tipos de dados tem seus valores delimitados por ap??strofos (???), a exemplo de:
- caracteres
- data/hora
- monet??rio
- boleanos
- bin??rios
- geom??tricos
- arrays
A exce????o ?? para os demais tipos num??ricos: date ???18/12/2005??? numeric 12345.45
Caracteres Especiais
Para poder escrever uma barra no valor de uma constante, usa-se duas barras:
SELECT '\\Barra';
Para escrever um ap??strofo usa-se dois ap??strofos:
SELECT 'Editora O''Reyle';
P PostgreSQL tamb??m permite o uso de caracteres de escape para escrever caracteres
especiais:
SELECT 'Editora O\'Reyle';
Concatena????o de express??es no terminal:
SELECT 'Concate'
'na????o';
Equivale a:
SELECT 'Concatena????o';
Quando resolvendo express??es matem??ticas usar par??nteses para tornar mais claras as
preced??ncias.
Convertendo para N??meros
SELECT TO_NUMBER('0' || '1,500.64',99999999.99);
Total de 8 d??gitos com 2 decimais.
Vari??veis no psql
\pset null '(nulo)' -- traduzindo null por nulo
SELECT NULL;
\set variavel 14 -- Dando valor 14 ?? vari??vel
SELECT :variavel;
141
phpPgGIS
http://www.geolivre.org.br/modules/news/
Em mais um grande lan??amento, a OpenGEO coloca ?? disposi????o da comunidade uma
ferramenta extremamente ??ltil para ger??ncia de dados geogr??ficos no PostgreSQL. O
phpPgGIS ?? mais um produto da OpenGEO que contempla uma demanda na ??rea de
Geotecnologias e visa atender usu??rios do mundo inteiro.
Desenvolvido com base no phpPgAdmin, o phpPgGIS utiliza o MapServer para visualizar o
conte??do espacial dos campos do PostGIS com muita simplicidade (um clique). Seq????ncias
de c??digos complexos (campo de geometria) agora podem ser vistos num mapa.
O OpenGEO tem atuado no mercado brasileiro de Geotecnologias com solu????es inovadoras
com base em software livre e j?? ganhou refer??ncia internacional com alguns importantes
projetos como o Open 3D GIS e o GeoLivre Linux.
Este sistema vai integrar a solu????o de Hosting que a empresa dever?? lan??ar nas pr??ximas
semanas.
Algumas Defini????es
Cursor
?? um ponteiro para uma linha (registro).
Replica????o
?? a distribui????o de dados corporativos para v??rios locais ou filiais de uma empresa,
oferecendo confiabilidade, toler??ncia a falhas, melhor desempenho e capacidade de
gerenciamento.
Criptografia
Seu objetivo ?? tornar os dados comuns em bits de apar??ncia completamente aleat??ria.
MAI??SCULAS E MIN??SCULAS NO PORTGRESQL
Ao digitar nomes de tabelas e campos em Mai??sculas eles ser??o convertidos
automaticamente para min??sculas, a n??o ser que sejam digitados entre aspas duplas:
SELECT * FROM "CLIENTES";
Recomenda????o: evitar o uso de mai??sculas e de acentos em nomes de bancos, tabelas e
campos.
POSTGRESQL N??O CONECTA?
Do site do Rodrigo (HJort)
- Pingar no IP
- Verificar o pg_hba.conf - host, banco, usu??rio IP e senha
- Caso apare??a "Is the server running on host.."
- Testar com telnet IP porta (Ctrl+C para sair)
- No postgresql.conf - listen_addresses = 'IP'
- Salvar e restartar o SGBD.
Contador de Resultados
142
Indicado para consultas e relat??rios (n??o grava)
CREATE TEMP SEQUENCE seq;
SELECT nexval('seq'), * FROM esquema.tabela;
(Salvador S. Scardua na lista PostgreSQL Brasil)
LIMITES DO POSTGRESQL
Tamanho de um Banco de Dados - ilimitado
Tamanho de uma tabela - 32 TB
Quantidade de registros por tabela - ilimitados
Quantidade de campos por tabela - 250 a 1600 (depende do tipo)
Quantidade de ??ndices por tabela - ilimitados
15.5 ??? Dicas sobre Desempenho e Otimiza????es do PostgreSQL
Existem duas principais formas de melhorar o desempenho de SGBDs: uma ?? melhorando o
hardware, com CPUs, RAM, Discos mais novos, r??pidos e confi??veis. A outra ?? otimizando as
consultas realizadas nos bancos (usando VACUUM, VACUUM ANALYZE, EXPLAIN, criando
CLUSTERS, entre outros).
Uma das medidas b??sicas adotada para melhorar o desempenho de tabelas com grandes
quantidades de registros e especialmente com muitos acessos, ?? a inclus??o de ??ndices
estrat??gicos. Al??m da chave prim??ria ?? importante inserir ??ndices em campos que comp??em a
cl??usula WHERE, que fazem parte de cl??usulas ORDER BY, GROUP BY entre outras. Em
consultas com WHERE de v??rios campos usando OR, n??o adianta inserir ??ndice, pois n??o
ser?? utilizado pelo PostgreSQL, somente usando AND.
Na cria????o do banco de dados e especialmente na cria????o das consultas ?? muito importante
atentar para um bom planejamento, normaliza????o, consultas otimizadas tendo em vista o
planejador de consultas do PostgreSQL atrav??s do uso dos comandos EXPLAIN e ANALYZE.
A administra????o do PostgreSQL tamb??m ?? muito importante para tornar o SGBD mais
eficiente e r??pido. Desde a instala????o e configura????o temos cuidados que ajudam a otimizar
o PostgreSQL.
Adapta????o do Artigo sobre otimiza????o do PostgreSQL do Diogo Biazus e do original
do Bruce Momjian (http://www.ca.postgresql.org/docs/momjian/hw_performance).
Hardware
No computador as informa????es s??o manipuladas pelos registradores da CPU, pelo cache da
CPU, pela mem??ria RAM e pelos discos r??gidos.
Na pr??tica as informa????es utilizadas com mais freq????ncia s??o colocadas pr??ximas ?? CPU.
Quem determina que informa????es devem ficar nos registradores s??o os compiladores.
Cache da CPU guarda ar informa????es utilizadas recentemente.
O Sistema Operacional controla o que est?? armazenado na RAM e o que mandar para o
disco r??gido.
143
Cache e Registradores da CPU n??o podem ser otimizados diretamente pelo administrador do
SGBD. Efetivamente otimiza????o em bancos de dados envolvem aumento da quantidade de
informa????es ??teis na RAM, prevenindo acesso a disco sempre que poss??vel.
N??o ?? tarefa simples de ser colocada em pr??tica, pois a mem??ria RAM guarda muitas outras
informa????es: programas em execu????o, pilhas e dados de programas, mem??ria cache
compartilhada do PostgreSQL, cache do buffer de disco do kernel e kernel.
Otimiza????o correta de bancos de dados procura manter a maior quantidade poss??vel de
informa????es do banco na mem??ria RAM ao mesmo tempo que n??o afeta as demais ??reas do
sistema operacional.
Existem dois tipos de configura????o de mem??ria no PostgreSQL, a compartilhada e a
individual. A compartilhada tem um tamanho fixo, ela ?? alocada sempre que o PostgreSQL
inicializa e ent??o ?? compartilhada por todos os clientes. J?? a mem??ria individual ?? tem um
tamanho vari??vel e ?? alocada separadamente para cada conex??o feita ao SGBD.
Mem??ria Cache Compartilhada do PostgreSQL
O PostgreSQL n??o altera as informa????es diretamente no disco. Ao inv??s disso ele solicita
que os dados sejam lidos da mem??ria cache compartilhada do PostgreSQL. O cliente
PostgreSQL ent??o l?? e escreve os blocos e finalmente escreve no disco.
Clientes que precisam acessar tabelas primeiro procuram pelos blocos necess??rios no
cache. Caso estejam a?? ent??o continuam processando normalmente. Caso contr??rio ?? feita
uma solicita????o ao sistema operacional para carregar os blocos. Os blocos s??o carregados
do cache de buffer de disco do kernel ou diretamente do disco. Estas opera????es podem ser
onerosas (lentas).
Na configura????o default do PostgreSQL 8.1.3 ele aloca 1000 shared buffers. Cada buffer usa
8KB, o que soma 8MB. Aumentando o n??mero de buffers far?? com que os clientes encontrem
as informa????es que procuram em cache e evita requisi????es onerosas ao sistema
operacional. Mas cuidado, pois se aumentar muito a mem??ria compartilhada (shared buffers)
pode acarretar uso da mem??ria virtual (swap). As altera????es podem ser feitas atrav??s do
comando postmaster na linha de comando ou atrav??s da configura????o do valor do
shared_buffers no postgresql.conf.
Que Por????o da RAM Reservar para o PostgreSQL?
A maior por????o ??til que n??o atrapalhe os outros programas.
Nos sistemas UNIX as informa????es saem da RAM (quando insuficiente) para o swap. Ruim ??
quando as informa????es voltam do swap para a RAM, pois ent??o os programas s??o
suspensos at?? que as mesmas sejam carregadas.
Tamanho da Cache
Imaginemos que o PostgreSQL shared buffer cache seja suficiente para manipular uma
tabela inteira. Repetidas buscas seq??enciais da tabela n??o devem necessitar de acesso ao
disco j?? que todos os dados j?? est??o em cache. Agora vamos imaginar que o cache ?? menor
que a tabela, ent??o neste caso as informa????es ir??o para o disco (swap) e ter??o um
desempenho bem inferior.
Tamanho Adequado da Shared Buffer Cache
144
Idealmente a PostgreSQL shared buffer cache (Mem??ria Cache Compartilhada do
PostgreSQL) deve ser:
??? Grande o suficiente para conseguir manipular as tabelas mais comumente acessadas.
??? Pequena o bastante para evitar atividades de swap pagein.
Exemplo:
Por exemplo queremos x MB para mem??ria compartilhada
( x / 8 ) * 1024 = Resultado a ser configurado em shared_buffer
Se x = 768 MB
(768 / 8) * 1024
Resultado a ser configurado em shared_buffer = 98304
Para informa????es sobre uma configura????o do kernel para que v??rios sistemas operacionais
trabalharem com o PostgreSQL:
http://developer.postgresql.org/docs/postgres/kernel-resources.html
Mem??ria Individual (Sort Memory)
Principalmente utilizada em ordena????es de registros das tabelas, em opera????es de cria????o
de ??ndices, ordena????o (order by), merge join, etc.
Esta mem??ria pode ser configurada atrav??s do par??metro sort_mem do postgresql.conf.
Para a configura????o leve em conta sua mem??ria dispon??vel (incluindo a mem??ria j?? alocada
para o shared buffers), tamb??m o n??mero m??dio de conex??es e o uso da mem??ria virtual
(swap).
Exemplo:
Considerando um servidor dedicado (rodando somente o servidor PostgreSQL), com
mem??ria RAM de 1,5GB e com at?? 10 conex??es simult??neas com o SGBD:
shared_buffers = 80000 # 80.000 blocos de 8KB = 625 MB
sort_mem = 64000 # tamanho em KB = 62,5 MB, para cada usu??rio com
# 10 usu??rios = 526 MB
vacuum_mem = 2000
Por exemplo: queremos x KB para mem??ria individual sort_men
( x * 1024 ) = resultado para mem??ria individual
x = 16
(16 * 1024) = sort_mem = 16384
Seria bom mudar tamb??m mem??ria para vaccum
vacuum_mem = 131072 (mesmo c??lculo do sort_mem)
145
Uso de V??rios Discos
Em sistemas com mais de um disco podemos melhorar a performance do mesmo
distribuindo algumas tarefas entre discos diferentes.
Supondo que temos dois HDs, hda e hdb:
Movendo os logs de transa????o para outro disco:
- Parar o PostgreSQL
- Montar hdb em /mnt/hdb
- Mover a pasta /usr/local/pgsql/data/pg_xlog para o /mnt/hdb
- Criar um link simb??lico para o diret??rio original:
ln -s /mnt/hdb/pg_xlog /usr/local/pgsql/data/pg_xlog
- Banco - /usr/local/pgsql/data (no hda)
- Logs - /usr/local/pgsql/data/pg_xlog (link simb??lico para /mnt/hdb/pg_xlog).
Os logs de transa????o s??o os ??nicos registros que n??o podem ter o seu salvamento em disco
adiado sem comprometer a seguran??a do sistema.
Mover os ??ndices para um HD diferente de onde est??o as tabelas:
- Parar PostgreSQL
- Mover os ??ndices para o hdb
- Criar link simb??lico para o local original
Para recriar os ??ndices em outro Tablespace:
ALTER TABLE nometabela DROP CONSTRAINT nomeconstraint;
CREATE INDEX nome_idx ON nometabela (nomecampo) TABLESPACE nometablespace;
ALTER TABLE nometabela ADD CONSTRAINT nome_pk PRIMARY KEY (nomecampo);
ALTER INDEX nome_idx SET TABLESPACE nometablespace;
Ainda podemos separar astabelas mais utilizadas para o hdb, utilizando o comando
tablespace no PostgreSQL 8.1.3 podemos fazer isso:
- Criar diret??rio /mnt/hdb/hotcluster e tornar postgres seu dono
CREATE TABLESPACE hotcluster OWNER postgres LOCATION '/mnt/hdb/hotcluster';
Criando um banco no novo cluster:
CREATE DATABASE hotbanco TABLESPACE = hotcluster;
Exportar as tabelas para este banco.
Uso de Mais de Um Processador
Atualmente o PostgreSQL est?? otimizado para uso de v??rios processadores, refor??ando que
cada conex??o ?? gerenciada por um processo diferente.
Sistemas de Arquivos
Para sistemas BSD usa-se o tradicional UFS, que ?? robusto, r??pido e tem a vantagem em
rela????o ao PostgreSQL, de possuir os blocos de disco com um tamanho padr??o de 8KB.
Para quem utiliza Linux as sugest??es v??o para EXT3 e ReiserFS.
146
Checkpoints
O wal_files ?? o par??metro do postgresq.lconf que determina o n??mero de arquivos usados
pelo PostgreSQL para armazenar os logs de transa????o. Estes arquivos focam em pg_xlog,
na pasta de dados.
Para que apare??am as datas e horas nos arquivos de logs usa-se no postgresql.conf:
log_timestamp = true
Para reduzir a freq????ncia dos checkpoints devemos aumentar o par??metro do
postgresql.conf:
checkpoint_segments = 3 (valor default)
O PostgreSQL n??o precisa de muito ajuste. Boa parte dos par??metros ?? automaticamente
ajustada para uma performance ??tima. O cache size e sort size s??o dois par??metros que o
administrador pode controlar para ter um melhor uso da mem??ria.
Tradu????o do Tutorial ???Tuning PostgreSQL for Performance???
De Shridhar Daithankar e John Berkus
Shared Buffers
Definem um bloco de mem??ria que o PostgreSQL usar?? para lidar com requisi????es que est??o
aguardando aten????o no buffer do kernel e na CPU.
Deve ser manipulada com cuidado, pois simplesmente ampliada pode prejudicar a
performance. Esta ?? a ??rea que o PostgreSQL usa atualmente para trabalhar. Ela deve ser
suficiente para controlar a carga do servidor do SGBD, do contr??rio o PostgreSQL ir?? iniciar
empurrando dados para arquivos e isto ir?? prejudicar a performance geral. Esta ?? a principal
configura????o em termos de performance.
Seu valor deve ser configurado tendo em vista o tamanho do conjunto de bancos que se
sup??es que no m??ximo o servidor ir?? carregar e da mem??ria RAM (ter em mente que a
mem??ria RAM utilizada pelos demais aplicativos do servidor n??o estar??o dispon??veis).
Recomenda????es:
- Iniciar com 4MB (512) Workstation
- M??dio tamanho do conjunto de bancos de dados e 256 a 512MB dispon??vel de RAM:
16-32MB (2948 a 4096)
- Grande conjunto de bancos de dados e muita mem??ria RAM dispon??vel (1 a 4GB):
64 -256MB (8192 a 32768)
Obs.: At?? para um conjunto de bancos de dados (dataset) que exceda 20GB, uma
configura????o de 128MB deve ser muito, caso voc?? tenha apenas 1GB de RAM e um
agressivo sistema de cache em Sistema Linux.
Sort Memory (Mem??ria para Ordena????o)
Limite m??ximo de mem??ria que uma conex??o pode usar para executar sort (ordena????o).
Caso suas consultas usem as cl??usulas ORDER BY ou GROUP BY que ordenem grandes
conjuntos de dados, incrementar este par??metro dever?? ajudar.
Uma Recomenda????o:
Ajustar o par??metro por conex??o como e quando precisar: pouca para consultas mais
simples e muita para consultas complexas e para dumps de dados.
Effective Cache Size (Tamanho do Cache Efetivo)
Permite ao PostgreSQL fazer melhor uso da RAM dispon??vel no servidor.
Exemplo:
Caso exista 1,5GB de RAM na m??quina, shared buffers deve ser ajustado para 32MB e
147
effective cache size para 800MB.
Fsync and the WAL files (Fsync e arquivos de WAL)
Caso n??o reste nenhuma op????o, poder?? usar a prote????o do WAL e melhor performance.
Simplesmente mova seus arquivos de WAL, montando outro dispositivo ou criando um link
simb??lico para o diret??rio pg_xlog, para um disco separado ou para o conjunto dos arquivos
do seu cluster principal de arquivos de dados.
random_page_cost (custo de p??gina aleat??ria)
Configura o custo para trazer um registro aleat??rio de um banco de dados, que influencia a
escolha do planejador em usar index ou table scan.
Caso tenha um disco razoavelmente r??pido como SCSI ou RAID, pode baixar o custo para 2.
Vacuum_mem
Configura a mem??ria alocada para Vacuum. Deve acelerar permitindo que PostgreSQL copie
grandes quantidades para a mem??ria.
Entre 16-32MB ?? uma boa quantidade para muitos sistemas.
max_fsm_pages
PostgreSQL grava espa??o livre em cada uma de suas p??ginas de dados.
Caso tenha um banco que usa muitos updates e deletes, que ir?? gerar registros mortos,
devido ao sistema MVCC do PostgreSQL, ent??o expanda o FSM para cobrir todos estes
registros deads (mortos) e nunca mais precisar?? rodar vacuum full a n??o ser em feriados.
O m??nimo FSM ?? max_fsm_relations * 16.
max_fsm_relations
Diz quantas tabelas devem ser localizadas no mapa de espa??o livre.
wal_buffers
Esta configura????o decide a quantidade de buffers WAL (Write Ahead Log) que pode ter.
Para chegar a uma quantidade ??tima experimente e decida.
Um bom in??cio est?? em torno de 32 a 64 correspondendo a 256-516 KB de mem??ria.
Ativar o subprocesso do auto Vacuum
Vem desabilitado por defualt (autovacuum = off no 8.1.3). Para ativar edite o arquivo de
configura????o postgresq.conf e altere para autovacuum = on. Ir?? executar o vacuum quando
necess??rio.
Melhor ?? executar o comando vacuum juntamente com o comando analyze:
vacuumdb -U postgres -a, caso seja executado na linha de comando.
Para adquirir informa????es sobre os ??ndices (tornando a performance ainda melhor):
vacuumdb -U postgres -a -z
148
EXPLAIN
#!/usr/bin/perl
$count = 1;
$arquivosaida = "populate.sql";
@chars = ("A" .. "Z", "a" .. "z", 0 .. 9);
@numbers = (1 .. 9);
@single_chars = ("a" .. "e");
$totalrecords = 5000; # 5 milh??es
open(OUTPUT, "> $arquivosaida");
print OUTPUT "DROP TABLE index_teste;\n";
print OUTPUT "CREATE TABLE index_teste (";
print OUTPUT "codigo INT, nome VARCHAR(10), numero INT, letra CHAR(1)";
print OUTPUT ");\n";
print OUTPUT "COPY index_teste (codigo, nome, numero, letra) FROM stdin;\n";
while ($count <= $totalrecords){
$randstring = join("", @chars [map{rand @chars} ( 1 .. 8 ) ]);
$randnum = join("", @numbers [map{rand @numbers} ( 1 .. 8 ) ]);
$randletter = join("", @single_chars [map{rand @single_chars} (1)]);
print OUTPUT
#print OUTPUT "INSERT INTO index_teste
VALUES($count,'$randstring',$randnum,'$randletter');\n";
$count."\t".$randstring."\t".$randnum."\t".$randletter."\n";
$count++;
};
#print OUTPUT "\n";
#print OUTPUT "\nCREATE INDEX indexteste_codigo_index ON index_teste(codigo);\n";
#print OUTPUT "CREATE INDEX indexteste_numero_index ON index_teste(numero);\n";
#print OUTPUT "VACUUM ANALYZE index_teste;\n";
close OUTPUT;
Um bom artigo sobre performance no PostgreSQL ???PostgreSQL 8.0 Checklist de
Performance??? encontra-se na revista eletr??nica DBFree Magazine, n??mero 02.
149
16 ??? Exerc??cios
Exemplo Pr??tico
Vamos criar um banco (clientes_ex), contendo uma tabela (cliente) e um usu??rio (operador) que ter??
apenas alguns privil??gios de acesso ?? tabela cliente (INSERT, SELECT, UPDATE) e ser?? obrigado a
utilizar senha. Veja que n??o ter?? privil??gio DELETE. Ent??o adicionar alguns registros e executar
consultas dos quatro tipos: INSERT, SELECT, UPDATE e DELETE (este apenas para verificar se
realmente ele n??o tem este privil??gio).
1)
CREATE DATABASE clientes_ex WITH ENCODING 'latin1';
-- Para SGBDs que n??o estejam com esta configura????o, pelo menos este banco a usar??
Para Exibir a Codifica????o do lado do Cliente
SHOW CLIENT_ENCODING;
Para Voltar ?? Codifica????o Padr??o
RESET CLIENT_ENCODING;
Alterando Banco para suportar Datas dd/mm/yyyy
ALTER DATABASE clientes_ex SET DATESTYLE = SQL, DMY;
-- No caso este banco apenas ficar?? com esta configura????o de data
-- Para altera????o definitiva para todos os bancos alterar o script "postgresql.conf".
Exibindo o DateStyle Atual
SHOW DATESTYLE;
2)
CREATE TABLE cliente (
codigo INT PRIMARY KEY,
nome VARCHAR(40) NOT NULL,
data_nasc DATE NOT NULL,
bonus NUMERIC(12,2),
observacao TEXT
);
3)
CREATE ROLE operador WITH PASSWORD 'operador9128' VALID UNTIL '26/05/2007';
O usu??rio somente ter?? os privil??gios at?? a data determinada.
REVOKE ALL ON cliente FROM operador;
GRANT SELECT,UPDATE,INSERT ON cliente TO operador;
Dica: Caso a tabela tenha campo tipo serial tamb??m devemos dar acesso ao objeto sequence gerado:
GRANT SELECT,UPDATE,INSERT ON cliente_codigo_seq TO operador;
-- Considerando que o nome da sequ??ncia seja cliente_codigo_seq.
Para permitir ao usu??rio operador que fa??a login, use:
ALTER ROLE operador WITH LOGIN;
150
Obs.: Veja como est?? aqui o pg_hba.conf:
host all all 127.0.0.1/32 md5
4)
Fazer o login como usu??rio operador para executar as consultas abaixo:
INSERT INTO cliente (codigo, nome, data_nasc, bonus, observacao) VALUES (1, 'Jo??o Pedro',
'01/01/1967', 18.35, 'Apenas um texto de teste');
INSERT INTO cliente (codigo, nome, data_nasc, bonus, observacao) VALUES (2, 'Pedro Paulo
Rosado', '04/11/1973', 25.35, '');
INSERT INTO cliente (codigo, nome, data_nasc, bonus, observacao) VALUES (3, 'Jos?? Roberto',
'25/06/1938', 12.65, NULL);
Observe que para campos que n??o exigem NOT NULL, podemos entrar apenas '' ou NULL.
SELECT * FROM cliente;
SELECT codigo FROM cliente;
SELECT * FROM cliente WHERE codigo = 5;
SELECT * FROM cliente WHERE codigo = 5 AND nome='Jo??o de Brito Cunha';
UPDATE cliente SET nome = 'Roberval Taylor' WHERE codigo = 3;
UPDATE cliente SET nome = 'Jo??o Almeida' WHERE nome = 'Pedro Paulo';
-- Esta consulta n??o ?? eficiente, j?? que nomes podem se repetir, melhor seria pela chave
Observe ainda, que campos do tipo num??rico n??o t??m delimitador, mas os demais tem o delimitador
ap??strofo, exceto palavras-chaves e fun????es como NULL, TRUE, NOW(), etc.
DELETE FROM cliente; -- Esta apaga todos os registros da tabela
DELETE FROM cliente WHERE codigo=1;
DELETE FROM cliente WHERE codigo=2 AND nome = 'Chico Manoel';
Veja as mensaens quando o user operador tenta excluir algum registro:
clientes_ex=> DELETE FROM cliente WHERE codigo=2 AND nome = 'Chico Manoel'
ERROR: permission denied for relation cliente
Ou seja, falta privil??gio para excluir e as regras funcionaram.
Um pequeno teste de conex??o cia PHP:
<?php
$con=pg_connect('host=127.0.0.1 user=operador password=operador9128 dbname=clientes_ex');
if ($con){
echo "OK";
}else{
echo "NOK";
}
?>
151
EXERC??CIO DE UM PEQUENO CONTROLE DE ESTOQUE
Utilizaremos somente min??sculas para os nomes dos objetos (bancos, esquemas, tabelas,
campos, etc) e quando composto por duas ou mais palavras separar com sublinhado.
clientes
funcionarios
produtos
vendas
vendas_itens
bonus
comissoes
Por enquanto iremos criar apenas a tabela produtos, mais adiante criaremos as demais
tabelas.
Obs.: A tabela de produtos ir?? guardar tamb??m uma informa????o sobre a posi????o do produto
no local onde ?? estocado.
Esta posi????o conter?? abscissa (x) e ordenada (y), ou seja a dist??ncia horizontal da esquerda
e a dist??ncia vertical de baixo para cima. Exemplo simplificado da disposi????o dos produtos:
ProdA
-----------------x,y----------------x+10,y --------------x+20,y
x | |
|
| |
|
|Y |Y
|Y
| |
|
| |
|
onde x=10cm e y=5cm
Existem tipos de dados geom??tricos no PostgreSQL, para pontos, linhas, pol??gonos, c??rculos,
etc.
Iremos utilizar o ponto (point).
Vamos criar uma vers??o resumida da tabela Produtos:
CREATE TABLE produtos (codigo int, nome char(40), preco numeric(12,2));
Para excluir uma tabela:
DROP TABLE nometabela;
152
1 - Instalar o PostgreSQL (de acordo com seu sistema operacional) e realizar as
configura????es b??sicas nos arquivos pg_hba.conf e no postgresql.conf. Mude o estilo da data
para um compat??vel com o brasileiro, mude os locales para pt_BR, mude a codifica????o para
LATIN1 e permita conex??o TCP/IP para uma m??quina de IP 10.1.1.1.
Configure tamb??m a autentica????o desta m??quina para md5;
2 - Criar um banco com nome controle_estoque;
3 ??? Criar um esquema esq_estoque;
4 ??? Criar um grupo de usu??rios grupo_estoque;
5 ??? Criar dentro do esquema esq_estoque, tabelas, de acordo com as estruturas abaixo com
os devidos atributos (campos), tipos de dados, tamanhos e constraints:
clientes (cpf, nome, endereco, cidade, uf, cep, telefone, data_cadastro, data_nascimento);
funcionarios (cpf, nome, endereco, cidade, uf, cep, telefone, data_admissao,
data_nascimento);
produtos (codigo_produto, nome, unidade, quantidade, preco_unitario, estoque_minimo,
estoque_maximo); -- nome deve ser UNIQUE
vendas (codigo_venda, data_venda, cpf_cliente, cpf_funcionario);
vendas_itens (codigo_item, codigo_venda, codigo_produto, quantidade_item);
bonus (codigo_bonus, cpf_cliente, codigo_venda, bonus);
comissoes (codigo_comissao, cpf_funcionario, codigo_venda, comissao);
6 ??? Criar as chaves estrangeiras que fa??am os devidos relacionamentos entre as tabelas;
7 ??? Remover somente a chave prim??ria da tabela clientes e Adicionar novamente com nome
clientes_pk;
8 ??? Adicionar a constraint NOT NULL no campo preco_unit??rio de produtos;
9 ??? Adicionar uma constraint CHECK que exija valores maiores que zero no estoque_minimo
do produtos;
10 ??? Alterar o nome do campo nome da tabela produtos para descricao e o nome da tabela
clientes para clientes2. Renomeie novamente para clientes;
11 ??? Alterar o tipo de dados do campo quantidade de produtos para NUMERIC(12,2);
12 ??? Criar tr??s usu??rios user_cli, user_prod e user_adm, todos no grupo grupo_teste, com os
seguintes privil??gios:
- user_cli tem permiss??o de executar as consultas SELECT, UPDATE E INSERT na tabela
clientes;
- user_pro tem permiss??o de executar a consulta SELECT na tabela produtos;
- user adm pode fazer o que bem entender em todos os bancos do servidor.
153
13 ??? Criar uma view que guarde a soma dos bonus por cliente. Receber?? um cliente e
retornar?? sua soma;
14 ??? Criar uma view que guarde a soma das comiss??es por funcion??rio. Receber?? um
funcion??rio e retornar?? sua soma;
15 ??? Criar uma transa????o com o bloco:
- Venda e Atualiza????o do estoque,
- Atualiza????o do b??nus do cliente,
- Atualiza????o da comiss??o do vendedor
16 ??? Cadastrar pelo menos tr??s registros em cada tabela;
17 ??? Gerar um dump do banco e editar o script para ver seu conte??do;
18 ??? Consultar qual o produto mais caro e o mais barato;
19 ??? Qual o cliente mais antigo;
20 ??? Atualize o pre??o de um produto, adicionando R$ 3.85 ao mesmo;
21 ??? Consulte qual o cliente que n??o tem bonus e o remova da tabela;
22 ??? Crie um banco chamado cep_brasil, com uma ??nica tabela cep_tabela cuja estrutura
deve ser:
create table cep_full (cep char(8), tipo char(72), logradouro char(70),bairro char(72),
municipio char(60), uf char(2));
Importe o arquivo cep_brasil_unique.csv existente no CD ou no site:
http://ribafs.byethost2.com se????o downloads ??? PostgreSQL.
- Ent??o execute \timing,
- Fa??a uma consulta que retorne apenas o seu CEP
- E anote o tempo gasto.
23 ??? Agora adicione uma chave prim??ria na tabela. Ent??o fa??a a mesma consulta anterior e
veja a diferen??a de desempenho por conta do ??ndice adicionado;
22 ??? Execute o PgAdmin, conecte ao banco controle_estoque para verificar o banco criado,
esquemas, grupo de usu??rios e usu??rios, esquema, tabelas, fazer algumas consultas,
visualizar os dados, a estrutura das tabelas e outras atividades;
23 ??? Fa??a o mesmo com o EMS PostgreSQL Manazer;
24 ??? Conecte ao banco com o DbVisualizer para verificar suas tabelas, esquema e veja o
DER (Diagrama Entidade-Relacionamento) e salve como imagem uma c??pia do DER.
25 ??? Criar uma tabela ???site??? contendo um campo com ip do visitante, do tipo inet.
26 ??? Criar uma tabela ???geometria???, contendo campos do tipo ponto, pol??gono e c??rculo.
154
17 - Refer??ncias
Site Oficial
Site oficial ??? http://www.postgresql.org
Site da comunidade brasileira ??? http://www.postgresql.org.br
Documenta????o Oficial
Online - http://www.postgresql.org/docs/8.1/interactive/index.html (Com busca)
PDF - http://www.postgresql.org/files/documentation/pdf/8.1/postgresql-8.1-A4.pdf
Brasil - Online - http://pgdocptbr.sourceforge.net/pg80/index.html
Brasil - PDF - http://ufpr.dl.sourceforge.net/sourceforge/pgdocptbr/pgdocptbr800-pdf-1.1.zip
Brasil - PDF Tutorial -
http://www.pythonbrasil.com.br/moin.cgi/NabucodonosorCoutinho?action=AttachFile&do=get
&target=tutorial_pg.pdf.tar.gz
PostgreSQL Technical Documentation - http://techdocs.postgresql.org/
Livros (E-books gr??tis)
- Practical PostgreSQL (ingl??s)
http://www.faqs.org/docs/ppbook/book1.htm
- PostgreSQL: Introduction and Concepts (ingl??s)
http://www.postgresql.org/files/documentation/books/aw_pgsql/index.html
- PostgreSQL: Das offizielle Handbuch (alem??o)
http://www.postgresql.org/docs/books/pghandbuch.html.de
- Lista de Livros sobre o PostgreSQL
http://www.postgresql.org/docs/books/
Listas
Lista Oficial do PostgreSQL, com diversas categorias
- Lista de News (freq????ncia semanal)
http://www.postgresql.org/community/weeklynews/
Cadastro - http://www.postgresql.org/community/lists/subscribe
- Cadastro e Descadastro em Uma das V??rias Listas
http://www.postgresql.org/community/lists/subscribe
Busca nos Arquivos das Listas do PostgreSQL
http://archives.postgresql.org/index.php?adv=1
- Lista da Comunidade Brasileira
http://pgfoundry.org/mailman/listinfo/brasil-usuarios/
Lista de Discuss??o no Yahoo
http://br.groups.yahoo.com/group/postgresql-br/
Para se cadastrar acesse o site acima e fa??a o cadastro.
PostgreSQL Users Groups Site
http://pugs.postgresql.org/
155
IRC
http://www.postgresql.org/community/irc
Existe um canal brasileiro
Sites do PostgreSQL em v??rios pa??ses
http://www.postgresql.org/community/international
Empresas que utilizam PostgreSQL
http://www.postgresql.org/about/casestudies/
Featured Users (Usu??rios Caracterizados)
Est??o aqui algumas das centenas das companhias que constru??ram produtos,
solu????es, web sites e ferramentas usando o PostgreSQL
http://www.postgresql.org/about/users
Grandes Projetos do PostgreSQL
http://www.postgresql.org/community/resources
Projetos no PgFoundry
ftp://ftp2.br.postgresql.org/postgresql/projects/pgFoundry/
Projetos Gborg
ftp://ftp2.br.postgresql.org/postgresql/projects/gborg/
An??lise de Diversas Ferramentas para PostgreSQL
https://wiki.postgresql.org.br/wiki/Ferramentas
Diversos Logos do PostgreSQL para divulga????o em Sites
http://www.postgresql.org/community/propaganda
Comunicar e Exist??ncia de Bugs
http://www.postgresql.org/support/submitbug
Com formul??rio online de envio de relato de bugs.
Diversas Ferramentas para o PostgreSQL
Conversor de Script DDL para PostgreSQL
http://www.icewall.org/~hjort/conv2pg/
http://www.freedownloadscenter.com/Best/erd-postgresql.html
http://www.databaseanswers.com/modelling_tools.htm
http://top.softlandmark.com/Erd_postgresql.html
http://directory.fsf.org/autodia.html
http://www.datanamic.com/download/scripteditor.zip
http://tedia2sql.tigris.org/
http://tedia2sql.tigris.org/usingtedia2sql.html
http://www.fileboost.net/directory/development/databases_networks/cutesql/004405/review.html
http://www.fileboost.net/directory/development/databases_networks/case_studio_2_lite/013963/1/download.html
http://files.db3nf.com/download/DB3NF_Setup_1_4.exe
http://gborg.postgresql.org/project/pgxexplorer/download/download.php
http://gborg.postgresql.org/browse.php
http://gborg.postgresql.org/browse.php?83
Revistas
Revista Sobre Bancos de Dados Free (Portugu??s)
156
http://www.dbfreemagazine.com.br/index.php
Cadastre-se e fa??a o download. J?? existem oito edi????es.
SQL Magazine (comercial)
http://www.sqlmagazine.com.br/revista.asp
Cursos
- Curso de PostgreSQL da dbExpert (S??o Paulo) ??? www.dbexpert.com.br
- Curso de PostgreSQL do Evolu????o (Fortaleza-CE) ??? www.evolucao.com.br
Modelagem e Normaliza????o
- O Modelo Relacional de Dados (em cinco artigos, de J??lio Battisti )
http://www.imasters.com.br/artigo.php?cn=2419&cc=149
- Conceitos Fundamentais de Banco de Dados (de Ricardo Rezende)
http://www.sqlmagazine.com.br/Colunistas/RicardoRezende/02_ConceitosBD.asp
Outros:
- PostgreSQL no iMasters ??? http://www.imasters.com.br/secao.php?cs=35
- Lozano ??? http://www.lozano.eti.br
- Conversor de Script DDL para PostgreSQL - http://www.icewall.org/~hjort/conv2pg/
- Meu PostgreSQL n??o Conecta! - http://www.icewall.org/~hjort/pgsql/naoconecta.htm
- Jun????o entre Tabelas no Postgresql ??? http://www.imasters.com.br/artigo/2867
- Customize database queries using views in PostgreSQL - http://builder.com.com/5100-
6388_14-6032031.html
- PostgreSQL Interagindo com Banco de dados - http://www.imasters.com.br/artigo/954
??? O Tipo de Dados Serial ??? http://www.im





