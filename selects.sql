SELECT ped.id,
ped.status,
ped.cliente_id,
prod.id,
prod.nome,
prod.tipo,
prod.preco,
prod.pts_de_lealdade        
FROM produtos_pedidos prodped   
JOIN pedidos ped ON prodped.pedido_id = ped.id
JOIN produtos prod ON prodped.produto_id = prod.id;

SELECT prodped.pedido_id AS id  
FROM produtos_pedidos prodped
WHERE prodped.produto_id = (SELECT id FROM produtos prod
WHERE prod.nome = 'Fritas');

SELECT clientes.nome AS gostam_de_fritas     
FROM clientes
JOIN pedidos ped ON ped.cliente_id = clientes.id
JOIN produtos_pedidos prodped ON ped.id = prodped.pedido_id
JOIN produtos prod ON prodped.produto_id = prod.id
WHERE prod.nome = 'Fritas';

SELECT SUM(preco) FROM produtos prod
JOIN produtos_pedidos prodped ON prodped.produto_id = prod.id
JOIN pedidos ped ON prodped.pedido_id = ped.id
JOIN clientes c ON c.id = ped.cliente_id
WHERE c.nome = 'Laura';


SELECT prod.nome, COUNT(*) FROM produtos prod  
JOIN produtos_pedidos prodped ON prodped.produto_id = prod.id
GROUP BY prod.nome;
