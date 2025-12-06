-- Kode SQL yang akan Anda salin ke GitHub
WITH MonthlyDuration AS (
    SELECT
        FORMAT_TIMESTAMP('%Y-%m', start_date) AS month_start,
        SUM(duration) / 3600 AS total_duration_hours 
    FROM
        `bigquery-public-data.london_bicycles.cycle_hire`
    WHERE
        EXTRACT(YEAR FROM start_date) = 2015
    GROUP BY
        1
    ORDER BY
        month_start
)
SELECT
    month_start,
    total_duration_hours,
    LAG(total_duration_hours, 1) OVER (ORDER BY month_start) AS duration_prev_month,
    SAFE_DIVIDE(
        (total_duration_hours - LAG(total_duration_hours, 1) OVER (ORDER BY month_start)),
        LAG(total_duration_hours, 1) OVER (ORDER BY month_start)
    ) * 100 AS mom_growth_percentage
FROM
    MonthlyDuration
ORDER BY
    month_start;
