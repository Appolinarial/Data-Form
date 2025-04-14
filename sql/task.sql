-- 1. Создание таблицы "Контейнеры"
CREATE TABLE Контейнеры (
    ИД UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
    Номер INT,
    Тип NVARCHAR(255) NOT NULL,
    Длина DECIMAL(10, 2),
    Ширина DECIMAL(10, 2),
    Высота DECIMAL(10, 2),
    Вес DECIMAL(10, 2),
    [Пустой/не пустой] BIT,
    Дата_поступления DATETIME
);

-- 2. Создание таблицы "Операции"
CREATE TABLE Операции (
    ИД UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
    ИД_Контейнера UNIQUEIDENTIFIER,
    Дата_начала_операции DATETIME,
    Дата_окончания_операции DATETIME,
    Тип_операции NVARCHAR(255),
    ФИО_оператора NVARCHAR(255),
    Место_инспекции NVARCHAR(255),
    FOREIGN KEY (ИД_Контейнера) REFERENCES Контейнеры(ИД)
);


-- 5. Запросы -- результат в формате JSON (без функций)
SELECT
    N'{"ИД": "' + CAST(ИД AS NVARCHAR(50)) + '", ' +
    N'"Номер": ' + CAST(Номер AS NVARCHAR(10)) + ', ' +
    N'"Тип": "' + Тип + N'", ' +
    N'"Длина": ' + CAST(Длина AS NVARCHAR(20)) + ', ' +
    N'"Ширина": ' + CAST(Ширина AS NVARCHAR(20)) + ', ' +
    N'"Высота": ' + CAST(Высота AS NVARCHAR(20)) + ', ' +
    N'"Вес": ' + CAST(Вес AS NVARCHAR(20)) + ', ' +
    N'"Пустой/не пустой": ' + CAST([Пустой/не пустой] AS NVARCHAR(1)) + ', ' +
    N'"Дата_поступления": "' + CONVERT(VARCHAR, Дата_поступления, 126) + '"}'
FROM
    Контейнеры;
    
SELECT
    N'{' +
    N'"ИД": "' + CAST(o.ИД AS NVARCHAR(100)) + '",' +
    N'"ИД_Контейнера": "' + CAST(o.ИД_Контейнера AS NVARCHAR(100)) + '",' +
    N'"Дата_начала_операции": "' + ISNULL(CONVERT(VARCHAR, o.Дата_начала_операции, 126), '') + '",' +
    N'"Дата_окончания_операции": "' + ISNULL(CONVERT(VARCHAR, o.Дата_окончания_операции, 126), '') + '",' +
    N'"Тип_операции": "' + ISNULL(o.Тип_операции, '') + '",' +
    N'"ФИО_оператора": "' + ISNULL(o.ФИО_оператора, '') + '",' +
    N'"Место_инспекции": "' + ISNULL(o.Место_инспекции, '') + '"' +
    N'}' AS JsonOutput
FROM Операции AS o
JOIN Контейнеры AS c ON o.ИД_Контейнера = c.ИД
WHERE c.[Пустой/не пустой] = 0;
