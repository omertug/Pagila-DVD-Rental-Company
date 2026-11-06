WITH monthly_rentals AS (
    -- Adım 1: Her ay bazında toplam kiralama adetlerini buluyoruz
    SELECT 
        DATE_TRUNC('month', rental_date)::DATE AS rental_month,
        COUNT(rental_id) AS total_rentals
    FROM rental
    GROUP BY 1
),
rental_growth AS (
    -- Adım 2: LAG() fonksiyonu ile "bir önceki ayın" kiralama adetini yan sütuna getiriyoruz
    SELECT 
        rental_month,
        total_rentals,
        LAG(total_rentals, 1) OVER (ORDER BY rental_month) AS previous_month_rentals
    FROM monthly_rentals
)
-- Adım 3: Büyüme oranını (yüzdesel değişim) matematiksel olarak hesaplıyoruz
SELECT 
    TO_CHAR(rental_month, 'YYYY-MM') AS ay,
    total_rentals AS cari_ay_kiralama_adedi,
    COALESCE(previous_month_rentals, 0) AS onceki_ay_kiralama_adedi,
    -- Büyüme Formülü: ((Şimdiki - Önceki) / Önceki) * 100
    CASE 
        WHEN previous_month_rentals IS NULL OR previous_month_rentals = 0 THEN 0
        ELSE ROUND(((total_rentals - previous_month_rentals)::NUMERIC / previous_month_rentals) * 100, 2)
    END AS buyume_orani_yuzde
FROM rental_growth
ORDER BY rental_month;
