CREATE OR REPLACE PROCEDURE relatorio_diario_compras()
LANGUAGE plpgsql
AS $$
BEGIN
    RAISE NOTICE 'Relatório Diário de Compras:';
    FOR compra_rec IN
        SELECT data_compra, SUM(quantidade) AS total_quantidade
        FROM compras
        GROUP BY data_compra
        ORDER BY data_compra
    LOOP
        RAISE NOTICE 'Data: %, Quantidade Total: %', compra_rec.data_compra, compra_rec.total_quantidade;
    END LOOP;
END;
$$;
