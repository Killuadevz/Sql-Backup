
	-- 19
SELECT MAX(duracao_da_locacao) FROM FILME;

	-- 20
SELECT COUNT(TITULO)
FROM FILME
WHERE DURACAO_DA_LOCACAO = (SELECT MAX(DURACAO_DA_LOCACAO) FROM FILME);

	-- 21
SELECT COUNT(F.TITULO)
FROM FILME F
JOIN IDIOMA I ON F.IDIOMA_ID = IDIOMA.ID
WHERE F.DURACAO_DA_LOCACAO = (SELECT MAX(DURACAO_DA_LOCACAO) FROM FILME)
AND (I.NOME = 'JAPANESE' OR I.NOME = 'GERMAN');

	-- 22
SELECT COUNT(TITULO), CLASSIFICACAO, PRECO_DA_LOCACAO
FROM FILME
GROUP BY CLASSIFICACAO, PRECO_DA_LOCACAO;

	-- 23
SELECT MAX(F.DURACAO_DA_LOCACAO) AS MAX_DURACAO, C.NOME
FROM FILME F
JOIN FILME_CATEGORIA FA ON F.FILME_ID = FA.FILME_ID
JOIN CATEGORIA C ON C.CATEGORIA_ID = FA.CATEGORIA_ID
GROUP BY C.NOME;

	-- 24
SELECT COUNT(F.FILME_ID) AS NUM_FILMES, C.NOME FROM FILME F
JOIN FILME_CATEGORIA FA ON F.FILME_ID = FA.FILME_ID
JOIN CATEGORIA C ON C.CATEGORIA_ID = FA.CATEGORIA_ID
GROUP BY C.NOME;

	-- 25
SELECT COUNT(F.TITULO) , C.NOME
FROM FILME F, FILME_CATEGORIA FC, CATEGORIA C
WHERE F.FILME_ID = FC.FILME_ID
AND C.CATEGORIA_ID = FC.CATEGORIA_ID
AND F.CLASSIFICACAO = 'G'
GROUP BY C.CATEGORIA_ID;

	-- 26

SELECT COUNT(FC.FILME_ID = F.FILME_ID), CATEGORIA_ID, F.CLASSIFICACAO 
FROM FILME_CATEGORIA FC, FILME F 
WHERE  FC.FILME_ID = F.FILME_ID 
AND FC.FILME_ID = F.FILME_ID 
GROUP BY CATEGORIA_ID, CLASSIFICACAO
HAVING F.CLASSIFICACAO = 'G' OR F.CLASSIFICACAO = 'PG' ;

	-- 27

SELECT COUNT(F.TITULO) , C.NOME , F.CLASSIFICACAO
FROM FILME F, FILME_CATEGORIA FC, CATEGORIA C
WHERE F.FILME_ID = FC.FILME_ID
AND C.CATEGORIA_ID = FC.CATEGORIA_ID
GROUP BY C.CATEGORIA_ID , F.CLASSIFICACAO;

	-- 28
SELECT COUNT(F.TITULO), A.PRIMEIRO_NOME, A.ULTIMO_NOME
FROM FILME F, FILME_ATOR FA, ATOR A
WHERE F.FILME_ID = FA.FILME_ID
AND A.ATOR_ID = FA.ATOR_ID
GROUP BY A.ATOR_ID
ORDER BY 1 DESC;


-- 28. Qual a quantidade de filmes por Ator ordenando decrescente por quantidade?
SELECT COUNT(F.TITULO), A.PRIMEIRO_NOME, A.ULTIMO_NOME
FROM FILME F, FILME_ATOR FA, ATOR A
WHERE F.FILME_ID = FA.FILME_ID
AND A.ATOR_ID = FA.ATOR_ID
GROUP BY A.ATOR_ID
ORDER BY 1 DESC;

-- 29. Qual a quantidade de filmes por ano de lançamento ordenando por quantidade crescente?
SELECT COUNT(F.TITULO), F.ANO_DE_LANCAMENTO
FROM FILME F
GROUP BY F.ANO_DE_LANCAMENTO
ORDER BY 1 ASC;

-- 30. Listar os anos de lançamento que possuem mais de 400 filmes?
SELECT ANO_DE_LANCAMENTO, COUNT(TITULO)
FROM FILME
GROUP BY ANO_DE_LANCAMENTO
HAVING COUNT(FILME_ID) >400;


-- 32
SELECT 
    C.CIDADE, P.PAIS
FROM
    PAIS P,
    CIDADE C
WHERE
    P.PAIS_ID = C.PAIS_ID
        AND P.PAIS LIKE 'A%';

-- 33
SELECT 
    COUNT(C.CIDADE), P.PAIS
FROM
    PAIS P,
    CIDADE C
WHERE
    P.PAIS_ID = C.PAIS_ID
GROUP BY P.PAIS
ORDER BY 1 DESC;

 -- 34
SELECT 
    COUNT(C.CIDADE), P.PAIS
FROM
    PAIS P,
    CIDADE C
WHERE
    P.PAIS_ID = C.PAIS_ID
        AND C.CIDADE LIKE 'A%'
GROUP BY P.PAIS
ORDER BY P.PAIS ASC;

-- 35

SELECT 
    P.PAIS, COUNT(C.CIDADE)
FROM
    PAIS P,
    CIDADE C
WHERE
    P.PAIS_ID = C.PAIS_ID
        AND C.CIDADE LIKE 'A%'
GROUP BY P.PAIS
HAVING COUNT(C.CIDADE) > 3;

-- 36

SELECT 
    P.PAIS, COUNT(C.CIDADE)
FROM
    PAIS P,
    CIDADE C
WHERE
    P.PAIS_ID = C.PAIS_ID
        AND (C.CIDADE LIKE 'A%' OR C.CIDADE LIKE 'R%')
GROUP BY P.PAIS
HAVING COUNT(C.CIDADE) > 3;

-- 37
SELECT 
    C.PRIMEIRO_NOME
FROM
    CLIENTE C,
    PAIS P,
    CIDADE CI,
    ENDERECO E
WHERE
    P.PAIS_ID = CI.PAIS_ID
        AND CI.CIDADE_ID = E.CIDADE_ID
        AND E.ENDERECO_ID = C.ENDERECO_ID
        AND P.PAIS = 'UNITED STATES';

-- 38
SELECT 
    COUNT(C.CLIENTE_ID)
FROM
    CLIENTE C,
    PAIS P,
    CIDADE CI,
    ENDERECO E
WHERE
    P.PAIS_ID = CI.PAIS_ID
        AND CI.CIDADE_ID = E.CIDADE_ID
        AND E.ENDERECO_ID = C.ENDERECO_ID
        AND P.PAIS = 'BRAZIL';

-- 39
SELECT 
    COUNT(C.CLIENTE_ID), P.PAIS
FROM
    CLIENTE C,
    PAIS P,
    CIDADE CI,
    ENDERECO E
WHERE
    C.ENDERECO_ID = E.ENDERECO_ID
        AND E.CIDADE_ID = CI.CIDADE_ID
        AND CI.PAIS_ID = P.PAIS_ID
GROUP BY P.PAIS;

-- 40
SELECT 
    P.PAIS, COUNT(C.CLIENTE_ID)
FROM
    CLIENTE C,
    PAIS P,
    CIDADE CI,
    ENDERECO E
WHERE
    C.ENDERECO_ID = E.ENDERECO_ID
        AND E.CIDADE_ID = CI.CIDADE_ID
        AND CI.PAIS_ID = P.PAIS_ID
GROUP BY P.PAIS
HAVING COUNT(C.CLIENTE_ID) > 10;

-- 41
SELECT 
    AVG(DURACAO_DA_LOCACAO), NOME
FROM
    IDIOMA I,
    FILME F
WHERE
    F.IDIOMA_ID = I.IDIOMA_ID
GROUP BY NOME;

-- 42
SELECT 
    COUNT(A.ATOR_ID), F.TITULO
FROM
    ATOR A,
    FILME F,
    FILME_ATOR FA,
    IDIOMA I
WHERE
    I.IDIOMA_ID = F.IDIOMA_ID
        AND F.FILME_ID = FA.FILME_ID
        AND A.ATOR_ID = FA.ATOR_ID
        AND I.NOME = 'ENGLISH'
GROUP BY F.TITULO
ORDER BY COUNT(A.ATOR_ID) DESC;

-- 43
SELECT 
    A.PRIMEIRO_NOME, A.ULTIMO_NOME
FROM
    FILME F,
    FILME_ATOR FA,
    ATOR A
WHERE
    F.FILME_ID = FA.FILME_ID
        AND A.ATOR_ID = FA.ATOR_ID
        AND F.TITULO = 'BLANKET BEVERLY';


-- 44
SELECT 
    C.NOME, COUNT(F.FILME_ID)
FROM
    CATEGORIA C,
    FILME F,
    FILME_CATEGORIA FC
WHERE
    C.CATEGORIA_ID = FC.CATEGORIA_ID
        AND F.FILME_ID = FC.FILME_ID
GROUP BY C.CATEGORIA_ID
HAVING COUNT(F.FILME_ID) > 60;

-- 45
SELECT DISTINCT
    F.TITULO, C.PRIMEIRO_NOME
FROM
    FILME F,
    INVENTARIO I,
    ALUGUEL A,
    CLIENTE C,
    ENDERECO E,
    CIDADE CI,
    PAIS P
WHERE
    F.FILME_ID = I.FILME_ID
        AND I.INVENTARIO_ID = A.INVENTARIO_ID
        AND A.CLIENTE_ID = C.CLIENTE_ID
        AND C.ENDERECO_ID = E.ENDERECO_ID
        AND E.CIDADE_ID = CI.CIDADE_ID
        AND CI.PAIS_ID = P.PAIS_ID
        AND P.PAIS = 'ARGENTINA';

-- 46
SELECT 
    COUNT(F.TITULO) AS Quantidade, C.PRIMEIRO_NOME
FROM
    FILME F,
    INVENTARIO I,
    ALUGUEL A,
    CLIENTE C,
    ENDERECO E,
    CIDADE CI,
    PAIS P
WHERE
    F.FILME_ID = I.FILME_ID
        AND I.INVENTARIO_ID = A.INVENTARIO_ID
        AND A.CLIENTE_ID = C.CLIENTE_ID
        AND C.ENDERECO_ID = E.ENDERECO_ID
        AND E.CIDADE_ID = CI.CIDADE_ID
        AND CI.PAIS_ID = P.PAIS_ID
        AND P.PAIS = 'Chile'
GROUP BY C.PRIMEIRO_NOME;

-- 47
SELECT 
    FUN.PRIMEIRO_NOME, COUNT(F.TITULO)
FROM
    FILME F,
    INVENTARIO I,
    ALUGUEL A,
    FUNCIONARIO FUN
WHERE
    F.FILME_ID = I.FILME_ID
        AND I.INVENTARIO_ID = A.INVENTARIO_ID
        AND A.FUNCIONARIO_ID = FUN.FUNCIONARIO_ID
GROUP BY FUN.PRIMEIRO_NOME;

-- 48

SELECT 
    COUNT(F.TITULO), C.NOME
FROM
    FILME F,
    INVENTARIO I,
    ALUGUEL A,
    FUNCIONARIO FUN,
    CATEGORIA C,
    FILME_CATEGORIA FC
WHERE
    F.FILME_ID = I.FILME_ID
        AND I.INVENTARIO_ID = A.INVENTARIO_ID
        AND A.FUNCIONARIO_ID = FUN.FUNCIONARIO_ID
        AND C.CATEGORIA_ID = FC.CATEGORIA_ID
        AND F.FILME_ID = FC.FILME_ID
GROUP BY C.CATEGORIA_ID;


-- 49

SELECT 
    TITULO, PRECO_DA_LOCACAO
FROM
    FILME
WHERE
    PRECO_DA_LOCACAO > (SELECT 
            AVG(PRECO_DA_LOCACAO)
        FROM
            FILME);

-- 50

SELECT 
    SUM(F.DURACAO_DO_FILME), C.NOME
FROM
    FILME F,
    FILME_CATEGORIA FC,
    CATEGORIA C
WHERE
    F.FILME_ID = FC.FILME_ID
        AND C.CATEGORIA_ID = FC.CATEGORIA_ID
GROUP BY C.CATEGORIA_ID;

-- 51
SELECT 
    YEAR(DATA_DE_ALUGUEL) AS ANO,
    MONTH(DATA_DE_ALUGUEL) AS MES,
    COUNT(*) AS TOTAL_TITULOS
FROM
    ALUGUEL
GROUP BY YEAR(DATA_DE_ALUGUEL) , MONTH(DATA_DE_ALUGUEL)
ORDER BY ANO , MES
LIMIT 0 , 1000;

-- 52

SELECT 
    SUM(PAG.VALOR) AS TOTAL_VALOR, F.CLASSIFICACAO
FROM
    FILME F,
    INVENTARIO I,
    ALUGUEL A,
    PAGAMENTO PAG
WHERE
    F.FILME_ID = I.FILME_ID
        AND I.INVENTARIO_ID = A.INVENTARIO_ID
        AND A.ID = PAG.ALGUEL_ID
        AND YEAR(A.DATA_DE_ALUGUEL) = 2006
GROUP BY F.CLASSIFICACAO
LIMIT 0 , 1000;



-- 53
SELECT 
    MONTH(A.DATA_DE_ALUGUEL) AS Mes,
    YEAR(A.DATA_DE_ALUGUEL) AS Ano,
    AVG(PAG.VALOR) AS Media_Valor
FROM
    FILME F,
    INVENTARIO I,
    ALUGUEL A,
    PAGAMENTO PAG
WHERE
    F.FILME_ID = I.FILME_ID
        AND I.INVENTARIO_ID = A.INVENTARIO_ID
        AND A.ALUGUEL_ID = PAG.ALUGUEL_ID
        AND YEAR(A.DATA_DE_ALUGUEL) = 2005
GROUP BY YEAR(A.DATA_DE_ALUGUEL) , MONTH(A.DATA_DE_ALUGUEL);


-- 54
SELECT 
    C.PRIMEIRO_NOME, SUM(PAG.VALOR)
FROM
    FILME F,
    INVENTARIO I,
    ALUGUEL A,
    PAGAMENTO PAG,
    CLIENTE C
WHERE
    F.FILME_ID = I.FILME_ID
        AND I.INVENTARIO_ID = A.INVENTARIO_ID
        AND A.ALUGUEL_ID = PAG.ALUGUEL_ID
        AND PAG.CLIENTE_ID = C.CLIENTE_ID
        AND YEAR(A.DATA_DE_ALUGUEL) = 2006
GROUP BY 1;