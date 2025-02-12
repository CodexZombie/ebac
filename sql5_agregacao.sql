-- 1. Use o banco de dados restaurante
USE restaurante;

-- 2. Calcule a quantidade de pedidos
SELECT COUNT(id_pedido) FROM pedidos;

-- 3. Calcule a quantidade de clientes únicos que realizaram pedidos
SELECT COUNT(DISTINCT id_cliente) FROM pedidos;

-- 4. Calcule a média de preço dos produtos
SELECT ROUND(AVG(preco), 2) AS media_preco FROM produtos;

-- 5. Calcule o mínimo e máximo do preço dos produtos
SELECT MIN(preco) AS preco_minimo FROM produtos;
SELECT MAX(preco) AS preco_maximo FROM produtos;

-- 6. Selecione o nome e o preço do produto e faça um rank dos 5 produtos mais caros
SELECT nome, preco,
RANK() OVER(ORDER BY preco DESC) AS ranking_preco
FROM produtos LIMIT 5;

-- 7. Selecione a média dos preços dos produtos agrupados por categoria
SELECT categoria, ROUND(AVG(preco), 2) AS media_preco FROM produtos GROUP BY categoria;

-- 8. Selecionar o fornecedor e a quantidade de produtos que vieram daquele fornecedor da informações de produtos
SELECT fornecedor, COUNT(id_produto) AS qtd_produtos FROM info_produtos GROUP BY fornecedor;

-- 9. Selecionar os fornecedores que possuem mais de um produto cadastrado
SELECT fornecedor, COUNT(id_produto) AS qtd_produtos FROM info_produtos GROUP BY fornecedor HAVING qtd_produtos > 1;

-- 10. Selecionar os clientes que realizaram apenas 1 pedido
SELECT id_cliente, COUNT(id_pedido) AS qtd_pedidos FROM pedidos GROUP BY id_cliente HAVING qtd_pedidos = 1;