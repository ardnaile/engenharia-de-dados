-- script gera tabela tempo

SET LANGUAGE PORTUGUESE;

WITH Calendario AS (
    SELECT 
        DATEADD(DAY, number, '2024-01-01') AS Data
    FROM 
        master..spt_values
    WHERE 
        type = 'P' 
        AND number BETWEEN 0 AND DATEDIFF(DAY, '2024-01-01', '2024-12-31') -- Altere para o intervalo desejado
),
Ano AS (
    SELECT DISTINCT
        YEAR(Data) AS Ano
    FROM 
        Calendario
),
Mes AS (
    SELECT DISTINCT
        MONTH(Data) AS Mes,
        DATENAME(MONTH, Data) AS NomeMes
    FROM 
        Calendario
),
Dia AS (
    SELECT DISTINCT
        DAY(Data) AS Dia,
        DATENAME(WEEKDAY, Data) AS NomeDiaSemana,
        DATEPART(WEEKDAY, Data) AS NumeroDiaSemana
    FROM 
        Calendario
)
SELECT 
    ROW_NUMBER() over(order by Data) as #seq,
    CONVERT(DATE, c.Data) AS Data,
    YEAR(c.Data) AS Ano,
    m.Mes,
    m.NomeMes,
    d.Dia,
    d.NomeDiaSemana,
    d.NumeroDiaSemana
FROM 
    Calendario c
JOIN 
    Ano a ON YEAR(c.Data) = a.Ano
JOIN 
    Mes m ON MONTH(c.Data) = m.Mes
JOIN 
    Dia d ON DAY(c.Data) = d.Dia
ORDER BY 
    c.Data;