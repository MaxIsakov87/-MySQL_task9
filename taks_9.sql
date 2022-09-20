-- В базе данных shop и sample присутствуют одни и те же таблицы, учебной базы данных. Переместите запись id = 1 из таблицы shop.users в таблицу sample.users. Используйте транзакции.

SELECT * FROM shop.users;
SELECT * FROM sample.users;
START TRANSACTION;
INSERT IGNORE INTO sample.users SELECT * FROM shop.users WHERE id = 1;
DELETE FROM shop.users WHERE id = 1;
COMMIT;

-- Создайте представление, которое выводит название name товарной позиции из таблицы products и соответствующее название каталога name из таблицы catalogs.

SELECT * FROM products;
SELECT * FROM catalogs;
CREATE OR REPLACE VIEW items AS 
  SELECT products.name AS products_name, catalogs.name AS catalogs_name 
    FROM products,catalogs 
      WHERE products.catalog_id = catalogs.id;
SELECT * FROM items;






