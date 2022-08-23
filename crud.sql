INSERT INTO clientes(nome, lealdade)
VALUES ('Georgia', 0);

INSERT INTO pedidos(status, cliente_id)
VALUES ('Recebido', 6);

INSERT INTO produtos_pedidos (pedido_id, produto_id)
  VALUES 
  ((SELECT id FROM pedidos ped WHERE ped.cliente_id = (SELECT id FROM clientes WHERE clientes.nome = 'Georgia')), 
  (SELECT id FROM produtos prod WHERE prod.nome = 'Big Serial')),

  ((SELECT id FROM pedidos ped WHERE ped.cliente_id = (SELECT id FROM clientes WHERE clientes.nome = 'Georgia')), 
  (SELECT id FROM produtos prod WHERE prod.nome = 'Varchapa')),

  ((SELECT id FROM pedidos ped WHERE ped.cliente_id = (SELECT id FROM clientes WHERE clientes.nome = 'Georgia')), 
  (SELECT id FROM produtos prod WHERE prod.nome = 'Fritas')),

  ((SELECT id FROM pedidos ped WHERE ped.cliente_id = (SELECT id FROM clientes WHERE clientes.nome = 'Georgia')), 
  (SELECT id FROM produtos prod WHERE prod.nome = 'Coca-Cola')),

  ((SELECT id FROM pedidos ped WHERE ped.cliente_id = (SELECT id FROM clientes WHERE clientes.nome = 'Georgia')), 
  (SELECT id FROM produtos prod WHERE prod.nome = 'Coca-Cola'));
        
SELECT * FROM clientes

JOIN pedidos ped ON ped.cliente_id = clientes.id
JOIN produtos_pedidos prodped ON prodped.pedido_id = ped.id
JOIN produtos prod ON prod.id = prodped.produto_id

WHERE clientes.nome = 'Georgia';


UPDATE clientes SET lealdade = (SELECT SUM(pts_de_lealdade) FROM clientes
JOIN pedidos ped ON ped.cliente_id = clientes.id
JOIN produtos_pedidos prodped ON prodped.pedido_id = ped.id
JOIN produtos prod ON prod.id = prodped.produto_id
WHERE clientes.nome = 'Georgia')
WHERE nome = 'Georgia';

DELETE FROM clientes WHERE clientes.nome = 'Marcelo';
