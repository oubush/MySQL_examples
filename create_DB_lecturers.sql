CREATE SCHEMA PREPODAVATELI00; 	-- создаем базу данных "PREPODAVATELI00"
USE PREPODAVATELI00; 		-- выбираем базу данных "LECTURERS00" для работы с ней 

/* создадим таблицу Lecturers, которая будет содержать данные преподавателей */

CREATE TABLE Lecturers (LecturerID INTEGER AUTO_INCREMENT UNIQUE, LastName VARCHAR(15) NOT NULL, FirstName VARCHAR(15) NOT NULL, MiddleName VARCHAR(15),  BirthDate DATE, Position VARCHAR(9) NOT NULL, Course VARCHAR(255) NOT NULL, PhoneNumber CHAR(11));

/* добавим в созданную таблицу Lecturers новое поле для стажа */

ALTER TABLE Lecturers ADD ServiceLength INTEGER;


/* добавим ограничения в таблицу Lecturers */

ALTER TABLE Lecturers ADD CONSTRAINT CHK_Pos CHECK (Position IN ('Профессор', 'Доцент', 'Ассистент'));

-- альтернативный вариант
-- ALTER TABLE Lecturers ADD CONSTRAINT CHK_Pos CHECK (Position='Профессор' OR Position='Доцент' OR Position='Ассистент'); 

ALTER TABLE Lecturers ALTER Position SET DEFAULT 'Доцент';

 UNIQUE

/* данные ограничения можно было задать при создании таблицы Lecturers */

CREATE TABLE Lecturers (LecturerID INTEGER AUTO_INCREMENT UNIQUE, LastName VARCHAR(15) NOT NULL, FirstName VARCHAR(15) NOT NULL, MiddleName VARCHAR(15),  BirthDate DATE, Position VARCHAR(9) NOT NULL DEFAULT 'Доцент', CHECK (Position IN ('Профессор', 'Доцент', 'Ассистент')), Course VARCHAR(255) NOT NULL, PhoneNumber CHAR(11), ServiceLength INTEGER);




/* заполним таблицу Lecturers */

--воспользуемся тем, что в поле LecturerID установлена автонумерация
INSERT INTO Lecturers(LastName, FirstName, MiddleName, BirthDate, Position, Course, PhoneNumber, ServiceLength) VALUES('Иванов', 'Иван', 'Иванович', "1986-05-12", 'Ассистент', 'Математика', '89123943022', 4);

--воспользуемся тем, что в поле Position установлено значение по умолчанию 'Доцент'

INSERT INTO Lecturers(LastName, FirstName, MiddleName, BirthDate, Course, PhoneNumber, ServiceLength) VALUES('Петров', 'Петр', 'Петрович', "1959-04-02", 'Математика', '89189200988', 30);

INSERT INTO Lecturers(LastName, FirstName, MiddleName, BirthDate, Position, Course, PhoneNumber, ServiceLength) VALUES('Андреев', 'Андрей', 'Андреевич', "1972-01-23", 'Профессор', 'Физика', '89327539732', 22);

INSERT INTO Lecturers(LastName, FirstName, MiddleName, BirthDate, Position, Course, PhoneNumber, ServiceLength) VALUES('Васильев', 'Василий', 'Васильевич', "1983-04-01", 'Доцент', 'Физика', '89327539732', 12);

INSERT INTO Lecturers(LastName, FirstName, MiddleName, BirthDate, Position, Course, PhoneNumber, ServiceLength) VALUES('Михайлов', 'Михаил', 'Михайлович', "1971-11-08", 'Профессор', 'Информатика', '89738925451', 19);

INSERT INTO Lecturers(LastName, FirstName, MiddleName, BirthDate, Position, Course, PhoneNumber, ServiceLength) VALUES('Сергеев', 'Сергей', 'Сергеевич', "1991-02-17", 'Ассистент', 'Информатика', '89832083342', 4);


/* произведем замену данных */

--Заменим номер телефона у преподавателя с фамилией Сергеев
UPDATE Lecturers SET PhoneNumber='89229923450' WHERE LastName='Сергеев';


/* построим запросы на выборку данных с сортировкой */

--сортировка всех преподавателей по дате рождения
SELECT * FROM Lecturers ORDER BY BirthDate ASC;

--ФИО и должности преподавателей

SELECT LastName, FirstName, MiddleName, Position FROM Lecturers ORDER BY Position;

-- выбор только доцентов с сортировкой по стажу работы
SELECT * FROM Lecturers WHERE Position='Доцент' ORDER BY ServiceLength;

--выбор по фамилии с окончанием 'ев'

SELECT * FROM Lecturers WHERE LastName LIKE '%ев';

--запрос на выборку с параметром

SELECT LastName, FirstName, MiddleName, Position FROM Lecturers ORDER BY Position;

--

SELECT LastName, FirstName, MiddleName, Position FROM Lecturers WHERE LastName LIKE '%ев';

--

SELECT LastName, FirstName, MiddleName, PhoneNumber FROM Lecturers WHERE LastName LIKE '%ов';

--
SELECT Position, avg(ServiceLength) FROM Lecturers GROUP BY Position;