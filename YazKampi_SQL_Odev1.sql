﻿CREATE TABLE books(
book_id INT PRIMARY KEY IDENTITY,
title VARCHAR(100) NOT NULL,
author VARCHAR(100) NOT NULL,
genre VARCHAR(100),
price DECIMAL(10,2) NOT NULL CHECK(price>=0),
stock INT NOT NULL CHECK(stock>=0),
published_year INT NOT NULL CHECK(published_year BETWEEN 1800 AND 2025),
added_at DATE NOT NULL DEFAULT (GETDATE())
);

USE LibraryManagementDb;
GO

INSERT INTO books(title,author,genre,price,stock,published_year,added_at) 
VALUES('Kayıp Zamanın İzinde','M.Proust','roman',129.90,25,1913,'2025-08-20');

INSERT INTO books(title,author,genre,price,stock,published_year,added_at) 
VALUES('Simyacı','P.Coelho','roman',89.50,40,1988,'2025-08-21');

INSERT INTO books(title,author,genre,price,stock,published_year,added_at) 
VALUES('Sapiens','Y.N.Harari','tariih',159.00,18,2011,'2025-08-25');

UPDATE books
SET genre = 'tarih'
WHERE title = 'Sapiens';

INSERT INTO books(title,author,genre,price,stock,published_year,added_at) 
VALUES('İnce Memed','Y.Kemal','roman',99.90,12,1955,'2025-08-22');

INSERT INTO books (title, author, genre, price, stock, published_year, added_at)
VALUES
('Körlük', 'J. Saramago', 'roman', 119.00, 7, 1995, '2025-08-28'),
('Dune', 'F. Herbert', 'bilim', 149.00, 30, 1965, '2025-09-01'),
('Hayvan Çiftliği', 'G. Orwell', 'roman', 79.90, 55, 1945, '2025-08-23'),
('1984', 'G. Orwell', 'roman', 99.00, 35, 1949, '2025-08-24'),
('Nutuk', 'M. K. Atatürk', 'tarih', 139.00, 20, 1927, '2025-08-27'),
('Küçük Prens', 'A. de Saint-Exupéry', 'çocuk', 69.90, 80, 1943, '2025-08-26'),
('Başlangıç', 'D. Brown', 'roman', 109.00, 22, 2017, '2025-09-02'),
('Atomik Alışkanlıklar', 'J. Clear', 'kişisel gelişim', 129.00, 28, 2018, '2025-09-03'),
('Zamanın Kısa Tarihi', 'S. Hawking', 'bilim', 119.50, 16, 1988, '2025-08-29'),
('Şeker Portakalı', 'J. M. de Vasconcelos', 'roman', 84.90, 45, 1968, '2025-08-30'),
('Bir İdam Mahkûmunun Son Günü', 'V. Hugo', 'roman', 74.90, 26, 1829, '2025-08-31');

--Tüm kitapların title, author, price alanlarını fiyatı artan şekilde sıralayarak listeleyin.
SELECT title, author, price FROM books ORDER BY price ASC;

--Türü 'roman' olan kitapları A→Z title sırasıyla gösterin.
SELECT title,genre FROM books WHERE genre='roman' ORDER BY title ASC;

--Fiyatı 80 ile 120 (dahil) arasındaki kitapları listeleyin (BETWEEN).
SELECT title,price FROM books WHERE price BETWEEN 80 AND 120;

--Stok adedi 20’den az olan kitapları bulun (title, stock_qty).
SELECT title,stock AS stock_qty FROM books WHERE stock<20;

--title içinde 'zaman' geçen kitapları LIKE ile filtreleyin (büyük/küçük harf durumunu not edin).
SELECT title FROM books WHERE title LIKE '%zaman%';


--genre değeri 'roman' veya 'bilim' olanları IN ile listeleyin.
SELECT title, genre FROM books WHERE genre IN ('roman','bilim');

--published_year değeri 2000 ve sonrası olan kitapları, en yeni yıldan eskiye doğru sıralayın.
SELECT title, published_year FROM books WHERE published_year >= 2000 ORDER BY published_year DESC;

--Son 10 gün içinde eklenen kitapları bulun (added_at tarihine göre).
SELECT * FROM books WHERE added_at>=DATEADD(DAY,-10,'2025-09-10');
--ALTERNATİF OLARAK
SELECT * FROM books WHERE added_at>=DATEADD(DAY,-10,GETDATE());

--En pahalı 5 kitabı price azalan sırada listeleyin (LIMIT 5).
SELECT TOP 5 title, price FROM books ORDER BY price DESC;

--Stok adedi 30 ile 60 arasında olan kitapları price artan şekilde sıralayın.
SELECT title, stock, price FROM books WHERE stock BETWEEN 30 AND 60 ORDER BY price ASC;