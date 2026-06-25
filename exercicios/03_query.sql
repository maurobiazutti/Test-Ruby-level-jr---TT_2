-- 3 - Considere um sistema onde cada Usuário possui os atributos nome (String), idade 
-- (Inteiro) e profissão (String). Faça uma query que retorne o nome de todos os usuários com 
-- idade maior ou igual à 18 anos e cuja profissão seja programador ou desenvolvedor

SELECT nome 
FROM usuarios 
WHERE idade >= 18 
  AND (profissao = 'programador' OR profissao = 'desenvolvedor');