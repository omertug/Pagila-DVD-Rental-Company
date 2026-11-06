/*******************************************************************************
-- Proje: İleri Düzey SQL & Kurumsal Veri Mimarisi Portfolyosu
-- Departman: Mağaza Operasyon ve Kiralama
-- Analiz Adı: En Çok Kiralanan Kategoriler ve Ciro Payları
-- Açıklama: Film kategorilerinin kiralama adetlerini ve toplam ciroya katkı yüzdelerini çoklu tablo birleştirmeleriyle (JOIN) raporlar.
*******************************************************************************/

SELECT 
    cat.name AS film_kategorisi,
    COUNT(r.rental_id) AS toplam_kiralama_adedi,
    SUM(p.amount) AS toplam_ciro,
    -- Şirketin toplam cirosu içindeki payını yüzde olarak hesaplıyoruz
    ROUND(
        (SUM(p.amount) / SUM(SUM(p.amount)) OVER ()) * 100, 2
    ) AS ciro_payi_yuzde
FROM category cat
JOIN film_category fc ON cat.category_id = fc.category_id
JOIN film f ON fc.film_id = f.film_id
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
JOIN payment p ON r.rental_id = p.rental_id
GROUP BY cat.name
ORDER BY toplam_ciro DESC;
