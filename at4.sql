-- Criação das tabelas
CREATE TABLE cliente (
  id SERIAL PRIMARY KEY,
  nome VARCHAR(16) NOT NULL,
  sobrenome VARCHAR(240) NOT NULL,
  idade INT,
  pais VARCHAR(4)
);

CREATE TABLE pedido (
  id SERIAL PRIMARY KEY,
  item VARCHAR(48) NOT NULL,
  quantidade INT NOT NULL,
  fk_id_cliente INT NOT NULL,
  CONSTRAINT fk_cliente FOREIGN KEY (fk_id_cliente) REFERENCES cliente(id)
);

-- Inserir dados na tabela cliente
INSERT INTO cliente (nome, sobrenome, idade, pais) VALUES
  ('Cintia', 'Silva', 15, 'BR'),
  ('Wando', 'Oliveira', 30, 'MX'),
  ('Lucia', 'Juliana', 19, 'ARG'),
  ('Jenny', 'Gomes', 25, 'PE'),
  ('Midia', 'Lopes', 22, 'IT');

INSERT INTO pedido (item, quantidade, fk_id_cliente) VALUES 
  ('PlayStation', 10, 5),
  ('Xbox', 10, 2),
  ('SuperNess', 8, 3),
  ('PC', 6, 4),
  ('Nintendo', 7, 5);

CREATE OR REPLACE FUNCTION atualizar_quantidade_pedido()
RETURNS TRIGGER AS $$
BEGIN

  NEW.quantidade = NEW.quantidade + 10;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_atualizar_quantidade_pedido
BEFORE INSERT ON pedido
FOR EACH ROW
EXECUTE FUNCTION atualizar_quantidade_pedido();