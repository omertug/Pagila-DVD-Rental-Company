# Aylık Kiralama Trendleri.sql

<img width="606" height="176" alt="image" src="https://github.com/user-attachments/assets/29b63fa1-1274-4b5b-a0db-2cd4706af166" />

### `DATE_TRUNC('month', rental_date)` 
Örneğin 2026-05-14 14:30:00 gibi detaylı bir tarih bilgisini alıp 2026-05-01 00:00:00 haline getirir. Böylece aynı ay içinde yapılan binlerce kiralama tek bir "Mayıs 2026" çatısı altında toplanır.

🚀 **TIMESTAMP WITH TIME ZONE** veri tipi 2005-05-26 21:06:14+03 örnek açıklaması:
- 2005: Yıl (Year) kısmıdır.
- 05: Ay (Month) kısmıdır (Mayıs ayı).
- 26: Gün (Day) kısmıdır (Ayın 26'sı).
- 21: Saat (Hour) kısmıdır (24'lük saat dilimine göre akşam 21:00 / 09:00).
- 06: Dakika (Minute) kısmıdır.
- 14: Saniye (Second) kısmıdır.
- +03: Zaman Dilimi (Time Zone Offset) bilgisidir. UTC'ye (koordinatlı evrensel saate) göre +3 saat ilerde olduğumuzu (örneğin Türkiye saat dilimini) ifade eder.

### `LAG(total_rentals, 1) OVER (ORDER BY rental_month)`
Sihirli kısım burası :smile: `ORDER BY rental_month` ile ayları kronolojik olarak sıralıyoruz. LAG(..., 1) ise imleci 1 satır yukarı (bir önceki aya) kaydırıp o ayın kiralama adetini bugünkü satırın yanına kolon olarak yazıyor.

### `COALESCE(...)`
İlk ayımızın bir önceki ayı olmadığı ya da hiç kiralama olmayan bir ay için LAG fonksiyonu NULL (boş) döner. COALESCE fonksiyonu bu boş değerleri 0 ile değiştirerek matematiksel hesaplama hatasının (Division by zero) önüne geçer.

### `ROUND(..., 2)`
Çıkan ondalıklı büyüme oranını (örneğin 12.3456...) virgülden sonra 2 basamağa yuvarlar (%12.35 gibi)
