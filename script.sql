--1.1 Faça um programa que gere um valor inteiro e o exiba.
-- números inteiros [1, 100]

DO $$

DECLARE
	n INT;
	limite_inferior INT := 1;
	limite_superior INT := 100;

BEGIN
	n := floor(random()*(limite_superior - limite_inferior +1) + limite_inferior)::int;
        RAISE NOTICE '%', n;

END;
$$


--1.2. Faça um programa que gere um valor real e o exiba.
-- números reais [1, 10]

DO $$

DECLARE
	n NUMERIC(4,2);
	limite_inferior INT := 1;
	limite_superior INT := 10;

BEGIN	
	n := random() * (limite_superior - limite_inferior) + limite_inferior ;--(limite_superior - limite_inferior+1) + limite_inferior;
	RAISE NOTICE '%', n;

END;
$$


--1.3 Faça um programa que gere um valor real no intervalo [20, 30] que representa uma
--temperatura em graus Celsius. Faça a conversão para Fahrenheit e exiba.

DO $$

DECLARE
	temperaturaC NUMERIC(4,2);
	temperaturaF NUMERIC(4,2);
	limite_inferior INT := 20;
	limite_superior INT := 30;

BEGIN
	temperaturaC := floor(random()*(limite_superior - limite_inferior + 1)+ limite_inferior);
	RAISE NOTICE 'A temperatura em Celsius é: %', temperaturaC;
	temperaturaF := (temperaturaC * 1.8) + 32;
	RAISE NOTICE 'A temperatura em Fahrenheit é %', temperaturaF;

END; 
$$


--1.4 Faça um programa que gere três valores reais a, b, e c e mostre o valor de delta: aquele
--que calculamos para chegar às potenciais raízes de uma equação do segundo grau.
-- números reais [1, 10]

DO $$

DECLARE
	limite_superior INT = 10;
	limite_inferior INT = 1;
	a NUMERIC(8,2);
	b NUMERIC(8,2);
	c NUMERIC(8,2);
	delta NUMERIC (8,2);

BEGIN

	a := floor(random()*(limite_superior - limite_inferior +1) + limite_inferior);
	b := floor(random()*(limite_superior - limite_inferior +1) + limite_inferior);
	c := floor(random()*(limite_superior - limite_inferior +1) + limite_inferior);

	IF a = 0 THEN
		RAISE NOTICE 'Não é possível calcular o delta';	

	ELSE
		delta := (b^2) - (4*a*c);
		RAISE NOTICE 'Delta é %', delta;

	END IF;
END;
$$


--1.5 Faça um programa que gere um número inteiro e mostre a raiz cúbica de seu antecessor
--e a raiz quadrada de seu sucessor.
-- números inteiros [1, 100]

DO $$

DECLARE
	n INT;
	raiz_cubica NUMERIC (8,2);
	raiz_quadrada NUMERIC (8,2);
	limite_inferior INT := 1;
	limite_superior INT := 100;

BEGIN
	n := floor(random()*(limite_superior - limite_inferior +1) + limite_inferior)::int;


	raiz_cubica := (n-1) ^ (1.0/3.0) ; 
	raiz_quadrada := (n+1) ^0.5;

	--RAISE NOTICE 'Antecessor: %, N: %, Sucessor: %', n-1, n, n+1;
        
	RAISE NOTICE 'Raiz cúbica do antecessor: %', raiz_cubica;
	RAISE NOTICE 'Raiz quadrada do sucessor: %', raiz_quadrada;

END;
$$


--1.6 Faça um programa que gere medidas reais de um terreno retangular. Gere também um
--valor real no intervalo [60, 70] que representa o preço por metro quadrado. O programa deve
--exibir o valor total do terreno.
-- números reais [1, 10]

DO $$

DECLARE
	medida_terreno NUMERIC(4,2);
	lado1 NUMERIC(4,2);
	lado2 NUMERIC(4,2);
	medida_min INT := 1;
	medida_max INT := 10;

	preco NUMERIC (10,2);
	preco_min INT := 60;
	preco_max INT := 70;

	valor_total NUMERIC(10,2);

BEGIN	
	lado1 := floor(random() *(medida_max - medida_min +1) + medida_min);
	lado2 := floor(random() *(medida_max - medida_min +1) + medida_min);

	IF lado1 = lado2 THEN --é um retângulo, não um quadrado
		RAISE NOTICE 'ops, de novo';
		lado2 := floor(random() *(medida_max - medida_min +1) + medida_min);

	ELSE
	
		medida_terreno := lado1 * lado2;
		
		preco := floor(random() *(preco_max - preco_min +1) + preco_min);
		
		valor_total := preco * medida_terreno;

		--RAISE NOTICE 'lado 1 = %, lado 2 = %, área = % --- preço gerado = R$ % ---', lado1, lado2, medida_terreno, preco;
		RAISE NOTICE 'O valor total é: R$ %', valor_total;
		
	
	END IF;
END;
$$


--1.7 Escreva um programa que gere um inteiro que representa o ano de nascimento de uma
-- pessoa no intervalo [1980, 2000] e gere um inteiro que representa o ano atual no intervalo
--[2010, 2020]. O programa deve exibir a idade da pessoa em anos. Desconsidere detalhes
-- envolvendo dias, meses, anos bissextos etc

DO $$

DECLARE
	ano_nasc_max INT := 2000;
	ano_nasc_min INT := 1980;
	ano_nasc INT;

	ano_atual_max INT := 2020;
	ano_atual_min INT := 2010; 
	ano_atual INT;

	idade INT;

BEGIN

	ano_nasc := floor(random()*(ano_nasc_max - ano_nasc_min + 1)+ano_nasc_min)::int;
	ano_atual := floor(random()*(ano_atual_max - ano_atual_min + 1)+ ano_atual_min)::int;

	idade := ano_atual - ano_nasc;
	RAISE NOTICE 'A idade dessa pessoa é % anos', idade;	

END;
$$