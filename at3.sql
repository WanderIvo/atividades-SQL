CREATE TABLE cliente (
  id SERIAL PRIMARY key,
  nome VARCHAR(16) not NULL,
  sobrenome VARCHAR(240) not NULL,
  idade INT,
  pais VARCHAR(4)                 
);
  
CREATE TABLE pedido (
  ID SERIAL PRIMARY KEY,
  item VARCHAR(48) not NULL,
  quantidade INT NOT NULL,
  fk_id_cliente INT not NULL,
  CONSTRAINT fk_cliente FOREIGN KEY (fk_id_cliente) REFERENCES cliente(id)
);
  
INSERT INTO cliente (nome, sobrenome, idade, pais) VALUES
  ('Cintia', 'silva', 15, 'BR'),
  ('Wando', 'oliveira',30, 'MX'),
  ('Lucia', 'Juliana', 19, 'ARG'),
  ('Jenny','Gomes',25 , 'PE'),
  ('Midia', 'Lopes', 22, 'IT');
  
INSERT INTO pedido (item, quantidade, fk_id_cliente) VALUES 
  ('PlayStation', 10, 5),
  ('Xbox', 10, 11),
  ('SuperNess', 8 ,3),
  ('PC', 6, 9),
  ('Nitendo', 7, 5);
  
  
SELECT 
  c.nome AS Nome_Cliente,
  c.sobrenome AS Sobrenome_Cliente,
  p.item AS Item_Pedido,
  p.quantidade AS Quantidade
FROM 
    cliente c
JOIN 
    pedido p
ON 
    c.id = p.fk_id_cliente;
