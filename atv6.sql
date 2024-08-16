CREATE OR REPLACE FUNCTION total_clientes_por_dia(dia TIMESTAMP)
RETURNS INT AS $$
DECLARE
    total INT;
BEGIN
    SELECT COUNT(*)
    INTO total
    FROM customers
    WHERE registration_date >= dia::DATE 
      AND registration_date < (dia::DATE + INTERVAL '1 diia')
    RETURN total;
    
END;
$$ LANGUAGE plpgsql;

SELECT total_clientes_por_dia('16/08') AS total_clientes;


