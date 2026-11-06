/*******************************************************************************
-- Proje: İleri Düzey SQL & Kurumsal Veri Mimarisi Portfolyosu
-- Departman: Mağaza Operasyon ve Kiralama
-- Analiz Adı: Aylık Kiralama Trendleri ve Büyüme Analizi (MoM)
-- Açıklama: Bu sorgu, aylık toplam kiralama hacimlerini ve bir önceki aya göre yüzde değişim (büyüme) oranlarını CTE ve LAG fonksiyonu kullanarak raporlar.
*******************************************************************************/

WITH aylik_kiralamalar AS (
    -- Tarihi ay bazına yuvarlayıp, o ay yapılan toplam kiralama adedini buluyoruz
    SELECT 
        DATE_TRUNC('month', rental_date)::DATE AS kiralama_ayi,
        COUNT(rental_id) AS toplam_kiralama_adedi
    FROM rental
    GROUP BY 1
),
kiralama_buyume AS (
    -- LAG fonksiyonu ile bir önceki ayın kiralama adetini yan sütuna çekiyoruz
    SELECT 
        kiralama_ayi,
        toplam_kiralama_adedi,
        LAG(toplam_kiralama_adedi, 1) OVER (ORDER BY kiralama_ayi) AS onceki_ay_kiralama_adedi
    FROM aylik_kiralamalar
)
-- Çıktı kolonlarını tamamen Türkçe isimlendirerek büyüme oranını hesaplıyoruz
SELECT 
    TO_CHAR(kiralama_ayi, 'YYYY-MM') AS yil_ay,
    toplam_kiralama_adedi AS cari_ay_kiralama,
    COALESCE(onceki_ay_kiralama_adedi, 0) AS onceki_ay_kiralama,
    CASE 
        WHEN onceki_ay_kiralama_adedi IS NULL OR onceki_ay_kiralama_adedi = 0 THEN 0
        ELSE ROUND(((toplam_kiralama_adedi - onceki_ay_kiralama_adedi)::NUMERIC / onceki_ay_kiralama_adedi) * 100, 2)
    END AS aylik_buyume_yuzdesi
FROM kiralama_buyume
ORDER BY kiralama_ayi;
