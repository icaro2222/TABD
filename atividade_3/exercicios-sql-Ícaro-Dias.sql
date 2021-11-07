


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

insert into produtos4 ( cod_prod, nome, preco) values(1, 'sabão', 4.00),
															(2, 'sabão', 2.03),
															(3, 'arroz', 5.30),
															(4, 'feijão', 4.60),
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

insert into produtos5 ( cod_prod, nome, preco) values(1, 'sabão', 4.00),
															(2, 'sabão', 2.03),
															(3, 'arroz', 5.30),
															(4, 'feijão', 4.60),
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

insert into produtos6 ( cod_prod, nome, preco) values(1, 'sabão', 4.00),
															(2, 'sabão', 2.03),
															(3, 'arroz', 5.30),
															(4, 'feijão', 4.60),
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

insert into produtos7 ( cod_prod, nome, preco) values(1, 'sabão', 4.00),
															(2, 'sabão', 2.03),
															(3, 'arroz', 5.30),
															(4, 'feijão', 4.60),
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

insert into produtos8 ( cod_prod, nome, preco) values(1, 'sabão', 4.00),
															(2, 'sabão', 2.03),
															(3, 'arroz', 5.30),
															(4, 'feijão', 4.60),
															(5, 'carne', 22.80),
															(6, 'peixe', 12.50),
															(7, 'chinelo', 15.20),
															(8, 'talco', 3.80);


CREATE TABLE produtos9 (
cod_prod integer PRIMARY KEY,
nome text,
preco numeric
);

insert into produtos9 ( cod_prod, nome, preco) values(1, 'sabão', 4.00),
															(2, 'sabão', 2.03),
															(3, 'arroz', 5.30),
															(4, 'feijão', 4.60),
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

insert into produtos10 ( cod_prod, nome, preco) values(1, 'sabão', 4.00),
															(2, 'sabão', 2.03),
															(3, 'arroz', 5.30),
															(4, 'feijão', 4.60),
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
INSERT INTO pessoa (codigo, cor_favorita) values (1, 'amarela');-- Erro, amarelo não consta


------- HERANÇA ----------

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


---------- Criar as Tabelas que servirão de Base -------------

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


---------- Criar as Tabelas que servirão de Base -------------

CREATE VIEW minha_view AS
SELECT cidade, temp_min, temp_max, prcp, data, localizacao
FROM clima, cidades
WHERE cidade = nome;
SELECT * FROM minha_visao;


---------- 26 27 -------------

---------- Criar um índice ------------

CREATE INDEX pessoa_cor ON pessoa (cor_favorita);

DROP INDEX pessoa_cor;


--------- Criar um índice Único:  -------------

CREATE UNIQUE INDEX pessoa_cod ON pessoa (codigo);

CREATE INDEX client_id ON client (clientid, clientname);


--------- select com index  -------------

SET SCHEMA 'revisao-icaro-dias';

SELECT clientname FROM client WHERE clientid = 12 AND clientname = 'João';

SELECT * FROM pessoa ORDER BY cor_favorita;

Successfully run. Total query runtime: 857 msec.
1 rows affected.

Successfully run. Total query runtime: 560 msec.
1 rows affected.


------- Criando índices de tipos diferentes: ---------

CREATE INDEX pedidos_cod ON pedidos USING BTREE (cod_pedido);

-- tipo: BTREE, RTREE, HASH, GIST --


---------- 36 43 -------------

SELECT siape AS “Matricula dó Servidor” FROM pessoal;

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


---------- CLÁUSULA WHERE   -------------

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
INSERT INTO clientes (codigo, nome) VALUES (1, “Ribamar FS”);


------- Forma Abreviada: -----------

INSERT INTO clientes VALUES (1, “Ribamar FS”);


----------  Inserindo com SubConsulta ---------

INSERT INTO clientes (codigo, nome, idade) VALUES
(SELECT fnome, fidade FROM funcionarios WHERE cli = 'S');

SELECT firstname, lastname, city, state INTO newfriend FROM friend;


---------------- UPDATE ----------------

UPDATE clientes SET idade = idade + 1; -- Todos os registros de clientes serão atualizados
UPDATE pedidos SET quant = quant + 3
WHERE cliente IN (SELECT codigo FROM clientes WHERE idade > 18);


----------- DELETE ----------

DELETE FROM pedidos; -- Cuidado, excluirá todos os registros da tabela pedidos

DELETE FROM pedidos WHERE (codigo IS NULL);


----------- Junções de Tabelas ou Consultas ----------

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

select descricao, (select max(preco) from produtos where produto_no=1) as "maior preço" from
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
INSERT INTO frutas VALUES (DEFAULT, 'maçã');	


-----------  CREATE TABLE TEMPORARY-----------

CREATE TEMPORARY TABLE alimentos (id SERIAL PRIMARY KEY, nome TEXT);

-----------  INSERT NA TABLE TEMPORARY-----------	

INSERT INTO alimentos VALUES (DEFAULT, 'maçã');
INSERT INTO alimentos VALUES (DEFAULT, 'espinafre');

SELECT nome, CASE WHEN EXISTS (SELECT nome FROM frutas WHERE nome=a.nome)
THEN 'sim'
ELSE 'não'
END AS fruta
FROM alimentos a;


------------   IN   -------------

SELECT nome, CASE WHEN nome IN (SELECT nome FROM frutas)
THEN 'sim'
ELSE 'não'
END AS fruta
FROM alimentos;


------------   NOT IN , ANY/SOME  -------------

SELECT nome, CASE WHEN nome = ANY (SELECT nome FROM frutas)
THEN 'sim'
ELSE 'não'
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
WHEN nota < 3 THEN 'E'-- Aqui podemos utilizar expressões
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
WHEN nota < 3 THEN 'E'-- Aqui podemos utilizar expressões
WHEN nota < 5 THEN 'D'
WHEN nota < 7 THEN 'C'
WHEN nota < 9 THEN 'B'
ELSE 'A'
END
ORDER BY conceito;

--------------- SELECT VIEW -----------

SELECT * FROM nota_mmm;

--------------- SELECT ÚNICA LINHA   -----------

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


--------- SELECT MÉDIA, MAIOR E MENOR NOTA --------

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







