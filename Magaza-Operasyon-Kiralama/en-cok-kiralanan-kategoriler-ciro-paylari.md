# En Çok Kiralanan Kategoriler ve Ciro Payları.sql

<img width="525" height="447" alt="image" src="https://github.com/user-attachments/assets/5dbb6738-9fed-42c3-b91d-61a0ff9a3cfc" />

### `JOIN` Yapısı
Kategoriler `film_category` ile filmler `film` doğrudan birbirine bağlı değildir; aralarında `film_category` adında bir köprü (Bridge) tablo vardır. `category` tablosundan kategori adını alıyoruz, `film_category` ve `film` üzerinden filmlere ulaşıyoruz. Filmin fiziksel olarak hangi mağazada stokta olduğunu gösteren `inventory` tablosuna, oradan müşterinin kiralama hareketini tutan `rental` tablosuna ve nihayetinde paranın ödendiği `payment` tablosuna bağlanarak zinciri tamamlıyoruz.
🔗 https://www.postgresql.org/docs/current/tutorial-join.html

### GROUP BY & SUM & COUNT
- `GROUP BY cat.name` ile tüm kategorileri grupluyoruz ki `SUM` ve `COUNT` kullanabilelim.
- `COUNT(r.rental_id)` ile her bir kategorinin kaç kez kiralandığını sayıyoruz.
- `SUM(p.amount)` ile her kategorinin kasaya bıraktığı toplam parayı (ciroyu) topluyoruz.

### `OVER ()` Pencere Fonksiyonu
`SUM(SUM(p.amount)) OVER ()` ifadesi, satırları grupladıktan sonra tüm kategorilerin toplam cirosunu hesaplayıp her satırın yanına sabit bir toplam olarak yazar. Böylece her kategori cirosunu, şirket genel cirosuna bölerek o kategorinin ciro payı yüzdesini (ciro_payi_yuzde) tertemiz bir şekilde elde ederiz.

### `ORDER BY toplam_ciro DESC` 
En çok kazandıran kategoriyi en üste dizeriz.
