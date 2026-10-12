-- AITrainerServer QA: шаблоны сверки данных после API-запросов
-- ВАЖНО: сначала посмотрите фактическую схему через 01_database_inspection.sql.
-- Замените <table_name>, <id_column>, <email_column> и другие плейсхолдеры
-- реальными именами. Запросы с плейсхолдерами нельзя выполнить без редактирования.

-- 1. Проверить, появилась ли запись после успешного POST / регистрации:
-- SELECT * FROM <table_name> ORDER BY <id_column> DESC LIMIT 20;

-- 2. Найти запись по идентификатору, полученному из ответа API:
-- SELECT * FROM <table_name> WHERE <id_column> = <returned_id>;

-- 3. Проверить отсутствие дублей по уникальному полю (например, email):
-- SELECT <email_column>, COUNT(*) AS duplicate_count
-- FROM <table_name>
-- GROUP BY <email_column>
-- HAVING COUNT(*) > 1;

-- 4. Сверить конкретную запись с данными из API:
-- SELECT <id_column>, <email_column>
-- FROM <table_name>
-- WHERE <id_column> = <returned_id>;

-- 5. Найти записи с пустыми обязательными значениями (если это запрещено контрактом):
-- SELECT *
-- FROM <table_name>
-- WHERE <required_column> IS NULL;

-- Практический порядок:
-- 1) отправить запрос через Postman;
-- 2) сохранить status code и JSON-ответ;
-- 3) выполнить соответствующий SELECT;
-- 4) сравнить идентификатор и значения полей API и БД;
-- 5) приложить результаты без паролей/секретов к тест-кейсу или баг-репорту.
