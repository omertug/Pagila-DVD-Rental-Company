# 🎬 Pagila DVD Rental: Core Data Architecture & SQL Insights

![PostgreSQL](https://img.shields.io/badge/Database-PostgreSQL-336791?style=flat-square&logo=postgresql&logoColor=white)
![Domain](https://img.shields.io/badge/Domain-Retail%20%26%20DVD%20Rental-0A66C2?style=flat-square)
![Role](https://img.shields.io/badge/Role-IT%20Business%20Analyst-009688?style=flat-square)
![Standard](https://img.shields.io/badge/Standard-Relational%20DWH%20Design-orange?style=flat-square)

EN: This project models the operational data architecture of a classic DVD rental business (Pagila) on PostgreSQL. From a business analyst's perspective, it presents an end-to-end structure encompassing store operations, inventory tracking, customer analytics, and revenue accounting.

TR: Bu proje, klasik bir DVD kiralama işletmesinin (Pagila) operasyonel veri mimarisini PostgreSQL üzerinde modellemektedir. Bir İş Analisti gözüyle; mağaza operasyonları, envanter takibi, müşteri analitiği ve gelir muhasebesini kapsayan uçtan uca bir yapı sunar.

---

## 🏗️ Database Architecture & Core Entities / Veri Mimarisi ve Temel Varlıklar

EN: The Pagila database follows a normalized relational structure designed to handle multi-store inventories, film categories, staff assignments, customer rentals, and financial payments.

TR: Pagila veritabanı; çoklu mağaza envanterlerini, film kategorilerini, personel atamalarını, müşteri kiralamalarını ve finansal ödemeleri yönetmek için normalize edilmiş ilişkisel bir yapı izler.

* **`film` & `inventory`**: Film künyeleri, özellikleri ve fiziksel mağaza stok varlıkları.
* **`customer`**: Müşteri master verileri ve iletişim bilgileri.
* **`rental`**: Kiralama hareketleri, veriliş ve iade tarihleri.
* **`payment`**: Müşteri bazlı finansal tahsilat hareketleri.
* **`store` & `staff`**: Mağaza yapıları ve personel operasyon yönetimi.

---

## 📊 Business Intelligence & Analytical Queries (KPIs)
🇹🇷 İş Analitiği ve Temel Performans Göstergeleri (KPI)

EN: Below is a list of business-critical SQL metrics included in this project, designed to provide actionable insights for various departments of a retail and rental enterprise.

TR: Proje kapsamında yer alan ve perakende/kiralama işletmesinin farklı birimleri için kritik veriler sağlayan iş zekası metriklerinin listesi aşağıdadır.

🏪 Store Operations & Rental Management / Mağaza Operasyonları ve Kiralama Müdürlüğü
Monthly Rental Trends / Aylık Kiralama Trendleri:
EN: Tracking total rental volume and MoM growth analysis.
TR: Aylık toplam kiralama adedi ve büyüme analizi.
Top Rented Categories / En Çok Kiralanan Kategoriler:
EN: Identifying high-performing film genres and category revenue shares.
TR: En yüksek performans gösteren film türleri ve kategori bazlı ciro payları.
Average Rental Duration / Ortalama Film Kiralama Süresi:
EN: Monitoring the average turnaround time between rental and return dates.
TR: Kiralama tarihi ile iade tarihi arasında geçen ortalama sürelerin takibi.

📦 Inventory & Asset Management / Envanter ve Varlık Yönetimi
Inventory Utilization & Stock-Out Risk / Envanter Kullanım Oranı:
EN: Measuring active rentals versus total physical stock in stores.
TR: Mağazalardaki toplam fiziksel stok ile aktif kiralamaların kıyaslanması.
Overdue / Unreturned Films / Geciken ve İade Edilmeyen Filmler:
EN: Tracking overdue rentals that exceed standard loan periods.
TR: Standart kiralama süresini aşan ve gecikmed olan filmlerin takibi.
Replacement Cost Analysis / Yenileme Maliyeti Analizi:
EN: Portfolio value and replacement cost liability across inventory items.
TR: Envanter kalemlerinin portföy değeri ve yenileme maliyeti yükümlülüğü.

👥 Customer Insights & CRM / Müşteri Deneyimi ve CRM
Active vs. Inactive Customers / Aktif ve İnaktif Müşteri Segmentasyonu:
EN: Identifying customers who haven't rented a movie in the last 90 days (Churn Risk).
TR: Son 90 gündür film kiralamayan müşterilerin tespiti (Kayıp Riski).
Customer Lifetime Value (LTV) / Müşteri Yaşam Boyu Değeri:
EN: Ranking customers based on total rental frequency and cumulative spend.
TR: Toplam kiralama sıklığı ve kümülatif harcamalara göre müşteri sıralaması.
Store-based Customer Distribution / Mağaza Bazlı Müşteri Dağılımı:
EN: Analyzing customer density and preferences across different store locations.
TR: Farklı mağaza lokasyonlarındaki müşteri yoğunluğu ve tercihlerinin analizi.

💰 Finance & Revenue Accounting / Finans ve Muhasebe
Monthly Revenue & Cash Flow / Aylık Ciro ve Nakit Akışı:
EN: Tracking total rental payments and daily/monthly revenue trends.
TR: Toplam kiralama ödemeleri ve günlük/aylık ciro trendlerinin takibi.
Staff Performance & Revenue Share / Personel Bazlı Ciro Payı:
EN: Evaluating staff contributions to total rental transactions and revenue generation.
TR: Toplam kiralama işlemleri ve ciro yaratımına personel katkılarının değerlendirilmesi.
Payment Methods & Average Ticket / Ödeme Analizi ve Sepet Ortalaması:
EN: Transaction volumes and average spending amounts per rental ticket.
TR: Kiralama başına işlem hacimleri ve ortalama harcama tutarları.

---

## 🛠️ Tech Stack / Kullanılan Teknolojiler
* **Database:** PostgreSQL (Pagila Sample Database)
* **Modeling:** Relational Database Design (ERD)
* **Domain:** Retail, DVD Rental & Store Operations
* **Tools:** pgAdmin 4 / DBeaver, Git & GitHub
