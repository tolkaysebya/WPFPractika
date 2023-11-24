--Лабораторная работа №2
--1.	Вывести ФИО, специализацию и дату рождения всех академиков.
select a.FullName, a.Specialization, a.BirthDate from Academician a;
--2.	Создать вычисляемое поле «О присвоении звания», которое содержит информацию об академиках в виде: «Петров Петр Петрович получил звание в 1974».
select a.FullName + ' получил звание в' + cast(YearOfRankAssignment as nvarchar) as 'О присвоении звания' from Academician a;
--3.	Вывести ФИО академиков и вычисляемое поле «Через 5 лет после присвоения звания».
select a.FullName, 'Через 5 лет после присвоения звания' = a.YearOfRankAssignment + 5 from Academician a;
--4.	Вывести список годов присвоения званий, убрав дубликаты.
select distinct a.YearOfRankAssignment from Academician a;
--5.	Вывести список академиков, отсортированный по убыванию даты рождения.
 select * from Academician a
 order by a.BirthDate desc;
--6.	Вывести список академиков, отсортированный в обратном алфавитном порядке специализаций, по убыванию года присвоения звания, и в алфавитном порядке ФИО.
select * from Academician a
order by 
Specialization desc,
YearOfRankAssignment desc,
FullName asc;
--7.	Вывести первую строку из списка академиков, отсортированного в обратном ал-фавитном порядке ФИО.
select  top 1 * from Academician 
order by FullName desc;
--8.	Вывести фамилию академика, который раньше всех получил звание.
select top 1 * from Academician a
order by a.YearOfRankAssignment asc;
--9.	Вывести первые 10% строк из списка академиков, отсортированного в алфавитном порядке ФИО.
select top 10 percent * from Academician a
order by a.FullName asc;
--10.	Вывести из таблицы «Академики», отсортированной по возрастанию года присво-ения звания, список академиков, у которых год присвоения звания – один из первых пяти в отсортированной таблице.
select top 5 * from Academician a
order by a.YearOfRankAssignment asc;
--11.	Вывести, начиная с десятого, список академиков, отсортированный по возраста-нию даты рождения.
select * from Academician a
order by a.BirthDate asc
offset 9 rows;
--12.	Вывести девятую и десятую строку из списка академиков, отсортированного в ал-фавитном порядке ФИО.
 select * from Academician a
 order by a.FullName asc
 offset 8 rows
 fetch next 2 rows only;

 --Лабораторная работа №3
-- 1.	Вывести названия и столицы пяти наибольших стран по площади.
select top 5 c.Name, c.MainCity from Country c
Order by c.Square desc;
--2.	Вывести список африканских стран, население которых не превышает 1 млн. чел.
select * from Country c
where c.Сontinent = 'Африка' and c.Population > 1000000;
--3.	Вывести список стран, население которых больше 5 млн. чел., а площадь меньше 100	тыс. кв. км, и они расположены не в Европе.
select * from Country c
where c.Population > 5000000 and c.Square < 100000;
--4.	Вывести список стран Северной и Южной Америки, население которых больше 20	млн. чел., или стран Африки, у которых население больше 30 млн. чел.
select * from Country c
where (c.Population > 20000000 and c.Сontinent = 'Южная Америка' and c.Сontinent = 'Северная америка') or (c.Population > 30000000 and c.Сontinent = 'Африка');
--5.	Вывести список стран, население которых составляет от 10 до 100 млн. чел., а пло-щадь не больше 500 тыс. кв. км.
select * from Country c
where (c.Population between 10 and 100000000) and c.Square < 500000;
--6.	Вывести список стран, названия которых не начинаются с буквы «К».
select * from Country;
--7.	Вывести список стран, в названии которых третья буква – «а», а предпоследняя – «и».
select * from Country c
where c.Name LIKE '__а%и_';
--8.	Вывести список стран, в названии которых вторая буква – гласная. 
select * from Country c
where c.Name LIKE '_[аоуэыяёюеи]%';
--9.	Вывести список стран, названия которых начинаются с букв от «К» до «П».
select * from Country c
where c.Name LIKE '[К-П]%';
--10.	Вывести список стран, названия которых начинаются с букв от «А» до «Г», но не с буквы «Б».
select * from Country c
where c.Name like '[А-Г, ^Б]%';
--11.	Вывести список стран, столицы которых есть в базе.
select * from Country c
where c.MainCity is Not NULL;
--12.	Вывести список стран Африки, Северной и Южной Америки.
select * from Country c
where c.Continent = 'Африка' or c.Continent = 'Северная Америка' or c.Continent = 'Южная Америка';

 --Лабораторная работа №4
-- 1.	Вывести список академиков, отсортированный по количеству символов в ФИО.
select * from Academician a
order by Len(a.FullName);
--2.	Вывести список академиков, убрать лишние пробелы в ФИО.
select Trim(a.FullName) from Academician a;
--3.	Найти позиции «ов» в ФИО каждого академика. Вывести ФИО и номер позиции.
select a.FullName, charindex('ов', a.FullName) as 'Позиция_ов' from Academician a;
--4.	Вывести ФИО и последние две буквы специализации для каждого академика.
select a.FullName, right(a.Specialization, 2) from Academician a;
--5. Вывести список академиков, ФИО в формате Фамилия и Инициалы.
SELECT SUBSTRING(TRIM(FullName), 0, CHARINDEX(' ', TRIM(FullName))) + SUBSTRING(TRIM(FullName), CHARINDEX(' ', TRIM(FullName)), 2) + '.' + SUBSTRING(TRIM(FullName), CHARINDEX(' ', TRIM(FullName), -1), 2)  + '.' as 'Фамилия и инициалы' FROM Academician
--6. Вывести список специализаций в правильном и обратном виде. Убрать дубликаты.
SELECT DISTINCT Specialization, REVERSE(Specialization) FROM Academician
--7. Вывести свою фамилию в одной строке столько раз, сколько вам лет.
SELECT REPLICATE('Ашмарин ', 18) 'Моя фамилия 18 раз'
--8. Вывести абсолютное значение функций2 (2) −   (3  2) с точностью два знака
--после десятичной запятой.
SELECT ROUND(ABS(2*2-2*2*2), 2)
--9. Вывести количество дней до конца семестра.
SELECT DATEADD(DAY, 55, GETDATE()) AS КонецСеместра
--10. Вывести количество месяцев от вашего рождения.
SELECT DATEDIFF(MONTH, '20050411', '20231030')
--11. Вывести ФИО и високосность года рождения каждого академика.
SELECT FullName, 
CASE DATEDIFF(DAY, YEAR(BirthDate)+'0101', YEAR(BirthDate)+'1231')
 WHEN 366 THEN 'Високосный'
 ELSE 'Обычный'
 END AS 'Тип года'
FROM Academician
--12. Вывести список специализаций без повторений. Для каждой специализации выве-сти «длинный» или «короткий», в зависимости от количества символов
SELECT DISTINCT Specialization,
IIF(LEN(Specialization) <= 8, 'Короткий', 'Длинный') AS Type FROM Academician

 --Лабораторная работа №5
-- 1.	Вывести минимальную площадь стран.
select Min(c.Square) from Country c;
--2.	Вывести наибольшую по населению страну в Северной и Южной Америке.
select Max(c.Population) from Country c
where c.Continent = 'Северная Америка' or c.Continent = 'Южная Америка';
--3.	Вывести среднее население стран. Результат округлить до одного знака.
select Round(Avg(c.Population),1) from Country c;
--4.	Вывести количество стран, у которых название заканчивается на «ан», кроме стран, у которых название заканчивается на «стан».
select Count(c.Id) from Country c
where c.Name like '%ан'and c.Name not like '%стан';
--5.	Вывести количество континентов, где есть страны, название которых начинается с буквы «Р».
SELECT COUNT(DISTINCT c.Continent) AS "Количество континентов"
FROM Country c
WHERE c.Name LIKE 'Р%';
--6.	Сколько раз страна с наибольшей площадью больше, чем страна с наименьшей площадью?
SELECT COUNT(*) AS "Количество раз"
FROM Country c
WHERE c.Square = (
  SELECT MAX(Square) FROM Country
) AND c.Square > (
  SELECT MIN(Square) FROM Country
);
--7.	Вывести количество стран с населением больше, чем 100 млн. чел. на каждом континенте. Результат отсортировать по количеству стран по возрастанию.
select c.Continent as 'Континент', Count(c.Name) as 'Количество стран' from Country c
group by c.Continent
order by Count(c.Name);
--8.	Вывести количество стран по количеству букв в названии. Результат отсортировать по убыванию.
 select c.Name, Len(c.Name) from Country c
order by Len(c.Name) desc;
--9.	Ожидается, что через 20 лет население мира вырастет на 10%. Вывести список континентов с прогнозируемым населением:
SELECT
c.Continent,
SUM(c.Population * 1.1) AS "Прогнозируемое население"
FROM Country c
GROUP BY c.Continent;
--10.	Вывести список континентов, где разница по площади между наибольшими и наименьшими странами не более в 10000 раз:
SELECT c.Continent
FROM Country c
GROUP BY c.Continent
HAVING (MAX(c.Square) / MIN(c.Square)) <= 10000;
--11.	Вывести среднюю длину названий Африканских стран.
select avg(len(c.Name)) from Country c
where c.Continent = 'Африка';
--12.	Вывести список континентов, у которых средняя плотность среди стран с населением более 1 млн. чел. больше, чем 30 чел. на кв. км.
SELECT c.Continent
FROM Country c
WHERE c.Population > 1000000
GROUP BY c.Continent
HAVING AVG(c.Population / c.Square) > 30;

 --Лабораторная работа №6
--1. Вывести из таблиц «Кафедра», «Специальность» и «Студент» данные о студентах, которые обучаются на данном факультете (например, «ит»).
select * from Department d JOIN Specialization s on d.Shifr = s.DepartmentShifr join Student s1 on s1.SpecializationNumber = s.Number
where d.FaculcyAbbr = 'ит'
--2. Вывести из таблиц «Кафедра», «Специальность» и «Сотрудник» данные о выпус-кающих кафедрах (факультет, шифр, название, фамилию заведующего). Выпускающей счита-ется та кафедра, на которую есть ссылки в таблице «Специальность».
select * from Department d join Specialization s on s.DepartmentShifr = d.Shifr join Employee e on e.DepartmentShifr = s.DepartmentShifr
where d.Shifr = s.DepartmentShifr
--3. Вывести в запросе для каждого сотрудника номер и фамилию его непосредствен-ного руководителя. Для заведующих кафедрами поле руководителя оставить пустым.
select e.TabNumber, e.Surname, e1.TabNumber, e1.Surname from Employee e join Employee e1 on e.Chief = e1.Chief
--4. Вывести список студентов, сдавших минимум два экзамена.
select s.RegNumber, count(e.Mark) Количество_сданных_экзаменов from Student s join Exam e on e.RegNumber = s.RegNumber
group by s.RegNumber
Having count(e.Mark) >= 2
--5. Вывести список инженеров с зарплатой, меньшей 20000 руб.
select * from Engineer e join Employee e1 on e.TabNumber = e1.TabNumber
where e1.Salary < 20000.00
--6. Вывести список студентов, сдавших экзамены в заданной аудитории.
select * from Student s join Exam e on e.RegNumber = s.RegNumber
where e.Auditorium = 'ф349'
--7. Вывести из таблиц «Студент» и «Экзамен» учетные номера и фамилии студентов, а также количество сданных экзаменов и 
-- средний балл для каждого студента только для тех студентов, у которых средний балл не меньше заданного (например, 4).
select s.RegNumber, s.Surname, count(e.Mark) 'Количество сданных экзаменов', avg(e.Mark) 'Средний балл' from Student s join Exam e on s.RegNumber = e.RegNumber
group by s.RegNumber, s.Surname
having avg(e.Mark) >= 4
--8. Вывести список заведующих кафедрами и их зарплаты, и степень.
select e.Surname, e.Salary, z.WorkExperience from Employee e join ZavDepartment z on e.TabNumber = z.TabNumber
--9. Вывести список профессоров.
select * from Employee e join Teacher t on t.TabNumber = e.TabNumber
where t.Rank = 'Профессор'
--10. Вывести название дисциплины, фамилию, должность и степень преподавателя, дату и место проведения экзаменов в 
-- хронологическом порядке в заданном интервале даты.
select d.Name, e1.Surname, e1.Post, t.Degree, e.Date, e.Auditorium from Discipline d join Exam e on e.DisciplineCode = d.Code join Teacher t on t.TabNumber = e.TabNumber 
join Employee e1 on t.TabNumber = e1.TabNumber
ORDER BY e.Date 
--11. Вывести фамилию преподавателей, принявших более трех экзаменов.
select e1.Surname, count(e.Date) количество from Teacher t join Exam e on e.TabNumber = t.TabNumber join Employee e1 on e1.TabNumber = t.TabNumber
group by e1.Surname
Having count(e.Date) > 3
--12. Вывести список студентов, не сдавших ни одного экзамена 
SELECT * from Student s left outer join Exam e on e.RegNumber = s.RegNumber
where e.RegNumber IS NULL

 --Лабораторная работа №7
--1.	Вывести объединенный результат выполнения запросов, которые выбирают страны с площадью меньше 500 кв. км и с площадью больше 5 млн. кв. км:
SELECT *
FROM Country
WHERE Square < 500
UNION
SELECT *
FROM Country
WHERE Square > 5000000;
--2.	Вывести список стран с площадью больше 1 млн. кв. км, исключить страны с насе-лением меньше 100 млн. чел.:
SELECT *
FROM Country
WHERE Square > 1000000
EXCEPT
SELECT *
FROM Country
WHERE Population < 100000000;
--3.	Вывести список стран с площадью меньше 500 кв. км и с населением меньше 100	тыс. чел.
SELECT *
FROM Country
WHERE Square < 500
INTERSECT
SELECT *
FROM Country
WHERE Population < 100000;

 --Лабораторная работа №8
--1.	Вывести список стран и процентное соотношение площади каждой из них к общей площади всех стран мира.
SELECT c.Name, c.Continent, c.MainCity, c.Population,
ROUND(cast(c.Population AS FLOAT) * 100 / 
(SELECT SUM(c.Population) FROM dbo.Country c), 3) 'Процентное соотношение'
FROM dbo.Country c
--2.	Вывести список стран мира, плотность населения которых больше, чем средняя плотность населения всех стран мира.
SELECT c.Name, c.MainCity, c.Square, c.Population, c.Continent FROM dbo.Country c
WHERE c.Population > (SELECT AVG(c.Population) FROM dbo.Country c)
--3.	С помощью подзапроса вывести список европейских стран, население которых меньше 5 млн. чел.
SELECT * FROM 
(SELECT *
FROM dbo.Country c WHERE c.Continent = 'Европа')A WHERE Population < 5000000
--4.	Вывести список стран и процентное соотношение их площади к суммарной пло-щади той части мира, где они находятся.
SELECT *, ROUND(CAST(Population AS FLOAT) * 100 /
(SELECT SUM(Population)
FROM dbo.Country c
WHERE
c.Continent = c1.Continent), 3) AS Процентное_соотношение
FROM
dbo.Country c1
--5.	Вывести список стран мира, площадь которых больше, чем средняя площадь стран той части света, где они находятся.
SELECT * FROM dbo.Country c
WHERE Square > (SELECT AVG(Square) FROM dbo.Country c1
WHERE c1.Continent = c.Continent)
--6.	Вывести список стран мира, которые находятся в тех частях света, средняя плот-ность населения которых превышает общемировую.
SELECT * FROM dbo.Country c
WHERE Continent IN (SELECT Continent FROM dbo.Country c
GROUP BY Continent
HAVING AVG(Population) > (SELECT AVG(Population) FROM dbo.Country c))
--7.	Вывести список южноамериканских стран, в которых живет больше людей, чем в любой африканской стране.
SELECT * FROM dbo.Country c
where Continent = 'Южная Америка'
and Population> ALL(SELECT Population FROM dbo.Country c WHERE Continent = 'Африка')
--8.	Вывести список африканских стран, в которых живет больше людей, чем хотя бы в	одной южноамериканской стране.
SELECT * FROM dbo.Country c
where Continent = 'Африка'
and Population> Any(SELECT Population FROM dbo.Country c WHERE Continent = 'Южная Америка')
--9.	Если в Африке есть хотя бы одна страна, площадь которой больше 2 млн. кв. км, вывести список всех африканских стран.
SELECT * FROM dbo.Country c
where Continent = 'Африка'
and EXISTS (SELECT Name FROM dbo.Country c where Continent = 'Африка' and Square > 2000000 )
--10.	Вывести список стран той части света, где находится страна «Фиджи».
SELECT * FROM dbo.Country c
where Continent = (SELECT Continent FROM dbo.Country c where Name = 'Фиджи')
--11.	Вывести список стран, население которых не превышает население страны «Фиджи».
SELECT * FROM dbo.Country c
where Population !> (SELECT Population FROM dbo.Country c where Name = 'Фиджи')
--12.	Вывести название страны с наибольшим населением среди стран с наименьшей площадью на каждом континенте.
SELECT * FROM dbo.Country c
where Population = (SELECT MAX(МАКС_Население) 
FROM (SELECT MIN(Square) AS МАКС_Население FROM dbo.Country c GROUP BY Continent)A)

--Лабораторная работа №9
--1.	Создать таблицу «Управление_ВашаФамилия». Определить основной ключ, иден-тификатор, значение по умолчанию
CREATE TABLE Control_Ashamrin
(
ID INT CONSTRAINT Control_AshmarinID PRIMARY KEY,
Surname NVARCHAR(40) CONSTRAINT DF_Control_Ashmarin DEFAULT 'Ашмарин'
)
--2.	Создать таблицу «Страны_ВашаФамилия». Определить основной ключ, разреше-ние / запрет на NULL, условие на вводимое значение.
CREATE TABLE Countries_Ashmarin
(
ID INT CONSTRAINT Countries_AshmarinID PRIMARY KEY,
Square INT CONSTRAINT CK_Countries_AshmarinSquare CHECK (Square > 10000) NOT NULL
)
--3.	Создать таблицу «Цветы_ВашаФамилия». Определить основной ключ, значения столбца «ID» сделать уникальными, для столбца «Класс» установить значение по умолчанию «Двудольные».
CREATE TABLE Flowers_Ashamrin
(
ID INT CONSTRAINT Flowers_AshamrinID PRIMARY KEY,
Class NVARCHAR(40) CONSTRAINT DF_Flowers_Ashamrin DEFAULT 'Двудольные'
)
--4.	Создать таблицу «Животные_ВашаФамилия». Определить основной ключ, значе-ния столбца «ID» сделать уникальными, для столбца «Отряд» установить значение по умол-чанию «Хищные».
Create Table Animal_Ashamrin
(
ID INT CONSTRAINT Animal_AshamrinID PRIMARY KEY,
Otrad NVARCHAR(40) CONSTRAINT DF_Animal_Ashamrin DEFAULT 'Хищные'
)
--Лабораторная работа №10
--1.	В таблицу «Ученики» внести новую запись для ученика школы № 18 Трошкова, оценка которого по химии неизвестна.
INSERT INTO Learner
(Surname, Specialization, School, Scores)
VALUES
('Трошков', 'Химия', 'Школа № 18', NULL)
SELECT * FROM Learner
--2.	В таблицу «Ученики» внести три строки.
INSERT INTO Learner
VALUES
('Никитин', 'Химия', 'МБОУ СОШ №2', 50),
('Петров', 'Русский язык', 'Школа №20', NULL),
('Петрова', 'Мфтематика', 'Школа №18', 90)
--3.	В таблице «Ученики» изменить данные Трошкова, школу исправить на № 21, пред-мет на математику, а оценку на 56.
UPDATE Learner
SET School = 'Школа №21', Specialization = 'Математика', Scores = 56
WHERE Surname = 'Трошков'
--4.	В таблице «Ученики» изменить данные всех учеников по химии, оценку увеличить на 10%, если она ниже 60 баллов.
UPDATE Learner
SET Scores = Scores + (Scores* 0.1)
WHERE Specialization = 'Химия' AND Scores < 60
--5.	В таблице «Ученики» удалить данные всех учеников из школы №21.
DELETE FROM Learner
WHERE School = 'Школа №21'
--6.	Создать таблицу «Гимназисты» и скопировать туда данные всех гимназистов, кроме тех, которые набрали меньше 60 баллов.
SELECT Id, Surname, Specialization, School, Scores 
INTO Licei From Learner
Where Scores >= 60

Select * From Licei
--7.	Очистить таблицу «Гимназисты».
TRUNCATE TABLE Licei
--Лабораторная работа №11
--1.	Даны числа A и B. Найти и вывести их произведение.
DECLARE @a INT, @b INT, @c INT
SET @a = 10
SET @b = 10
SET @c = @a * @b
PRINT @c
--2.	В таблице «Ученики» найти разницу между средними баллами лицеистов и гимназистов.
DECLARE @licey FLOAT, @gimn FLOAT, @diff FLOAT 
SET @licey = ( SELECT AVG(Scores) 
FROM dbo.Learner s
WHERE School = 'Лицей' )
SET @gimn = ( SELECT AVG(Scores)
FROM dbo.Learner s
WHERE School = 'Гимназия' )
SET @diff = ABS(@licey - @gimn)
PRINT @diff

--3.	В таблице «Ученики» проверить на четность количество строк.
DECLARE @col_str int
set @col_str = (Select count(s.Id) from dbo.Learner s)
if (@col_str%2 = 0)
print 'четное = ' + CAST(@col_str AS VARCHAR(4))
else 
print 'нечетное = ' + CAST(@col_str AS VARCHAR(4))
--4.	Дано четырехзначное число. Вывести сумму его цифр.
DECLARE @sum INT, @var INT, @e INT, @d INT, @s INT, @t INT
SET @sum = 1234
SET @t = @sum / 1000
SET @s = (@sum / 100) % 10
SET @d = (@sum / 10) % 10
SET @e = @sum % 10
SET @var = @e + @d + @s + @t
PRINT '@var = ' + CAST(@var AS NVARCHAR(4))
--5.	Даны случайные целые числа a, b и c. Найти наименьшее из них.
DECLARE @A_5 INT = RAND() * 100, @B_5 INT = RAND() * 100, @C_5 INT = RAND() * 100
PRINT '@A_5 = ' + CAST(@A_5 AS NVARCHAR(3))
PRINT '@B_5 = ' + CAST(@B_5 AS NVARCHAR(3))
PRINT '@C_5 = ' + CAST(@C_5 AS NVARCHAR(3))
IF @A_5 > @B_5 AND @B_5 > @C_5
 PRINT 'Наименьшее @C_5 = ' + CAST(@C_5 AS NVARCHAR(3))
IF @A_5 > @B_5 AND @B_5 < @C_5
 PRINT 'Наименьшее @B_5 = ' + CAST(@B_5 AS NVARCHAR(3))
IF @A_5 < @B_5 AND @B_5 < @C_5
 PRINT 'Наименьшее @A_5 = ' + CAST(@A_5 AS NVARCHAR(3))
IF @A_5 < @B_5 AND @B_5 > @C_5 AND @A_5 > @C_5
 PRINT 'Наименьшее @C_5 = ' + CAST(@C_5 AS NVARCHAR(3))
IF @A_5 < @B_5 AND @B_5 > @C_5 AND @A_5 < @C_5
 PRINT 'Наименьшее @A_5 = ' + CAST(@A_5 AS NVARCHAR(3))
IF @A_5 < @B_5 AND @A_5 = @C_5
PRINT 'Наименьшее @B_5 = ' + CAST(@B_5 AS NVARCHAR(3))
IF @A_5 > @B_5 AND @B_5 = @C_5
PRINT 'Наименьшее @A_5 = ' + CAST(@A_5 AS NVARCHAR(3))
--6.	Дано случайное целое число a. Проверить, делится ли данное число на 11.
DECLARE @a_6 INT = RAND() * 100
IF @a_6 % 11 = 0
PRINT CAST(@a_6 AS VARCHAR(3)) + ' делится на 11'
ELSE
PRINT CAST(@a_6 AS VARCHAR(3)) + ' не делится на 11'
--7.	Дано случайное целое число N (N < 1000). Если оно является степенью числа 3, то вывести «Да», если не является – вывести «Нет».
DECLARE @A_7 INT = RAND() * 1000
WHILE @A_7 % 3 = 0
SET @A_7 = @A_7 / 3
IF @A_7 = 1
PRINT CAST(@a_7 AS VARCHAR(4)) + ' Да'
ELSE
PRINT CAST(@a_7 AS VARCHAR(4)) + ' Нет'
--8.	Даны случайные целые числа a и b. Найти наименьший общий кратный (НОК).
DECLARE @aNOK INT = RAND() * 1000, @bNOK INT = RAND() * 1000 
PRINT '@aNOK = ' + CAST(@aNOK AS VARCHAR(4)) 
PRINT '@bNOK = ' + CAST(@bNOK AS VARCHAR(4))
WHILE @aNOK != @bNOK
BEGIN
IF @aNOK > @bNOK
SET @aNOK = @aNOK - @bNOK
ELSE
SET @bNOK = @bNOK - @aNOK
END
PRINT 'НОK = ' + CAST(@aNOK AS VARCHAR(4))
--9.	Даны два целых числа A и B (A<B). Найти сумму квадратов всех целых чисел от A до B включительно.
DECLARE @aVER INT = 2, @bA INT = 5, @SuM1 INT = 0
WHILE @aVER <= @bA
BEGIN
SET @SuM1 = @SuM1 + (@aVER * @aVER)
SET @aVER = @aVER + 1
END
PRINT 'Сумма = ' + CAST(@SuM1 AS VARCHAR(5))
--10.	Найти первое натуральное число, которое при делении на 2, 3, 4, 5, и 6 дает остаток 1, но делится на 7.
DECLARE @A10 INT = 1
WHILE @A10 < 500
BEGIN
IF(@A10 % 2 = 1) AND (@A10 % 3 = 1) AND (@A10 % 4 = 1) AND (@A10 % 5 = 1) AND (@A10 % 6 = 1) AND (@A10 % 7 = 0)
PRINT @A10
SET @A10 = @A10 + 1
END
--11.	Вывести свою фамилию на экран столько раз, сколько в нем букв.
DECLARE @surname NVARCHAR(50)
SET @surname = 'Ашмарин'
DECLARE @i INT
SET @i = 1
WHILE @i <= LEN(@surname)
BEGIN
    PRINT @surname
    SET @i = @i + 1
END
--12.	Напишите код для вывода на экран с помощью цикла:

--Н

--иНи

--жиНиж

--нжиНижн

--енжиНижне

--венжиНижнев

--авенжиНижнева

--равенжиНижневар

--травенжиНижневарт

--отравенжиНижневарто

--вотравенжиНижневартов

--свотравенжиНижневартовс

--ксвотравенжиНижневартовск

DECLARE @text NVARCHAR(MAX)
SET @text = 'Нижневартовск'
DECLARE @i INT
SET @i = 1
WHILE @i <= LEN(@text)
BEGIN
    DECLARE @formattedText NVARCHAR(MAX)
    IF @i = 1
    BEGIN
        SET @formattedText = SUBSTRING(@text, 1, 1)
    END
    ELSE
    BEGIN
        SET @formattedText = REPLICATE('', LEN(@text) - @i) + REVERSE(SUBSTRING(@text, 2, @i - 1)) + SUBSTRING(@text, 1, @i)
    END    
    PRINT @formattedText
    SET @i = @i + 1
END
--Лабораторная работа №12
--1. Напишите функцию для вывода названия страны с заданной столицей, и вызовите ее.
CREATE FUNCTION Func1
(@MainCity AS VARCHAR(100))
RETURNS VARCHAR(100)
AS 
BEGIN
 DECLARE @S AS VARCHAR(100) SELECT
  @S = Name FROM
  Country WHERE
  MainCity = @MainCity RETURN @S + ' ' + @MainCity
END

SELECT dbo.Func1('Вена')
--2. Напишите функцию для перевода населения в млн. чел. и вызовите ее.
CREATE FUNCTION Func2(
@Population AS FLOAT)
RETURNS FLOAT
AS
BEGIN DECLARE @P AS FLOAT
 SET @P = ROUND(@Population / 1000000, 2) RETURN @P
END

SELECT Name, MainCity,Continent,
Square, dbo.Func2(Population) AS [Население млн.чел]
FROM Country
--3. Напишите функцию для вычисления плотности населения заданной части света и вызовите ее.
CREATE FUNCTION Func_3
(@Population AS INT,@Square AS FLOAT)
RETURNS FLOAT
AS
BEGIN
 DECLARE @P AS FLOAT SET @P = ROUND(CAST(@Population AS FLOAT) / @Square, 2)
 RETURN @P
 END

SELECT
Name,MainCity,
Continent,Population,
Square,dbo.Func_3(Population, Square) AS Плотность
FROM Country
WHERE Continent = 'Европа'
ORDER BY Плотность DESC
--4. Напишите функцию для поиска страны, третьей по населению и вызовите ее.
Create function Func_4()
Returns VARCHAR(100)
AS BEGIN 
 DECLARE @P AS VARCHAR(100) DECLARE @M1 AS FLOAT
 DECLARE @M2 AS FLOAT DECLARE @M3 AS FLOAT
 SELECT 
  @M1 = MAX(Population) FROM 
  Country

 Select   @M2 = Max(Population)
 From Country
 Where Population < @M1
 Select   @M3 = Max(Population)
 From Country Where Population < @M2
 SELECT @P = Name
 FROM Country WHERE Population = @M3
 Return @p
END

Select dbo.Func_4() AS [3 по населению страна]
--5. Напишите функцию для поиска страны с максимальным населением в заданной ча-сти света и вызовите ее. Если часть света не указана, выбрать Азию.
CREATE function Func_5
(@Cont AS VARCHAR(100) = 'Азия')
returns varchar(100)as
begin
declare @p as varchar(100)
declare @m as float
select @m = max(Population)from Country
where Continent = @Cont
select @p = Name
From Country
where Continent = @Cont and Population = @m 
return @p
end

select dbo.Func_5('Европа')
select dbo.Func_5(DEFAULT)
--6. Напишите функцию для замены букв в заданном слове от третьей до предпослед-ней на “тест” и примените ее для столицы страны.
create function func_6
(@a as varchar(100)
)returns varchar(100)
as 
begin
return LEFT(@A, 2) + replicate('Тест', LEN(@a)-2) + RIGHT(@a,1)
end

select dbo.func_6(MainCity) from Country
--7. Напишите функцию, которая возвращает количество стран, не содержащих в назва-нии заданную букву.
Create function func_7
(@c as char(1)
)returns int
as
begin
declare @k as int
select @k = Count(*) from Country
where charindex(@c, Name) = 0
return @K
end

select dbo.func_7('г')
--8. Напишите функцию для возврата списка стран с площадью меньше заданного числа и вызовите ее.
Create function func_8
( @n as int)returns table
as
return (select Name, MainCity, Square, Population, Continent from Country where Square < @N)

select * from dbo.func_8(25600)
--9. Напишите функцию для возврата списка стран с населением в интервале заданных значений и вызовите ее.
create function func_9
( @a as float, @b as float)
returns table
as return (select Name, MainCity, Square, Population, Continent from Country 
where Population between @a and @b )

select * from dbo.func_9(100000, 10000000)
--10. Напишите функцию для возврата таблицы с названием континента и суммарным населением и вызовите ее.
create function func_10()
returns @countSpr 
table (name varchar(100), spread float)
as begin
insert @countSpr select Continent, sum(Population) from Country
group by Continent
return
end

select * from dbo.func_10()
--11. Напишите функцию IsPalindrom(P) целого типа, возвращающую 1, если целый па-раметр P (P > 0) является палиндромом, и 0 в противном случае.
CREATE FUNCTION dbo.IsPalindrom (@n AS INT)
RETURNS INT
AS
BEGIN
    DECLARE @temp AS INT
    SET @temp = @n
    DECLARE @rev AS INT
    SET @rev = 0
    DECLARE @dig AS INT
    DECLARE @result AS INT
    WHILE (@n > 0)
    BEGIN
        SET @dig = @n % 10
        SET @rev = @rev * 10 + @dig
        SET @n = @n / 10
    END
    IF (@temp = @rev)
        SET @result = 1
    ELSE
        SET @result = 0
    RETURN @result
END
SELECT dbo.IsPalindrom(121)

--Лабораторная работа №13
--1.	Создайте представление, содержащее список африканских стран, население которых больше 10 млн. чел., а площадь больше 500 тыс. кв. км, и используйте его.
 Create View View_1
 As
 Select c.* from dbo.Country c
 Where c.Population > 10000000 and c.Square > 500000 and c.Continent = 'Африка'
--2.	Создайте представление, содержащее список континентов, среднюю площадь стран, которые находятся на нем, среднюю плотность населения, и используйте его.
Create view View_2 (Continent, Square, Population)
as
Select c.Continent 'Континент', avg(c.Square) 'Площадь',avg(c.Population/ c.Square) 'Плотность' from dbo.Country c
Group by c.Continent
--3.	Создайте представление, содержащее фамилии преподавателей, их должность, зва-ние, степень, место работы, количество их экзаменов, и используйте его.
Create view View_3
AS
Select e.Surname, e.Post, t.Rank, t.Degree, e.DepartmentShifr, count(emp.Id) 'Количество экзаменов'  from dbo.Teacher t Join dbo.Employee e ON t.TabNumber = e.TabNumber
JOIN dbo.Exam emp ON t.TabNumber = emp.TabNumber 
JOIN dbo.Department d ON e.DepartmentShifr = d.Shifr
GROUP BY  e.Surname, e.Post, t.Rank, t.Degree, e.DepartmentShifr
--4.	Создайте табличную переменную, содержащую три столбца («Номер месяца», «Название месяца», «Количество дней»), заполните ее для текущего года, и используйте ее.
DECLARE @View_4 TABLE
(
    [Номер месяца] INT,
    [Название месяца] NVARCHAR(MAX),
    [Количество дней] INT
)
DECLARE @Date DATE = DATEADD(YEAR, DATEDIFF(YEAR, 0, GETDATE()), 0) -- Начало текущего года
DECLARE @Year INT = YEAR(GETDATE()) -- Текущий год
WHILE @Year = YEAR(@Date)
BEGIN
    DECLARE @MonthName NVARCHAR(MAX) = FORMAT(@Date, 'MMMM', 'ru-RU')
    DECLARE @MonthNumber INT = MONTH(@Date)
    DECLARE @DaysInMonth INT = DAY(EOMONTH(@Date))
    INSERT INTO @View_4 ([Номер месяца], [Название месяца], [Количество дней])
    VALUES (@MonthNumber, @MonthName, @DaysInMonth)
    SET @Date = DATEADD(MONTH, 1, @Date) 
END
SELECT * FROM @View_4
--5.	Создайте табличную переменную, содержащую список стран, площадь которых в 100	раз меньше, чем средняя площадь стран на континенте, где они находятся, и используйте ее.
DECLARE @View_5 TABLE
(
Nazvanie NVARCHAR(MAX),
Square FLOAT,
Continent NVARCHAR(MAX)
)
INSERT INTO @View_5
SELECT Name, Square, Continent FROM dbo.Country
WHERE Square * 100 < (SELECT AVG(Square) FROM dbo.Country c)
SELECT Nazvanie, Square, Continent FROM @View_5 
--6.	Создайте локальную временную таблицу, имеющую три столбца («Номер недели», «Количество экзаменов», «Количество студентов»), заполните и используйте ее.
SELECT
DATEPART(WEEK, Date) AS [Номер недели], 
COUNT(DISTINCT e.DisciplineCode) AS [Количество экзаменов], 
COUNT(DISTINCT e.RegNumber) AS [Количество студентов]
INTO View_6
FROM dbo.Exam e
GROUP BY DATEPART(WEEK, Date)

SELECT * FROM View_6
--7.	Создайте глобальную временную таблицу, содержащую название континентов, наибольшую и наименьшую площадь стран на них, заполните и используйте ее.
CREATE TABLE View_7
(
Continent VARCHAR(50),
Square FLOAT,
Square1 FLOAT
)
INSERT INTO View_7
(Continent, Square, Square1)
SELECT Continent,
MAX(Square) AS [Наибольшая площадь],
MIN(Square) AS [Наименьшая площадь]
FROM dbo.Country c
group by Continent
SELECT * FROM View_7
select * from dbo.Country
order by Square desc
--8.	С помощью обобщенных табличных выражений напишите запрос для вывода списка сотрудников, чьи зарплаты меньше, чем средняя зарплата по факультету, их зарплаты и назва-ние факультета.
WITH СЗК AS
(SELECT d.Name AS Кафедра, d.Shifr, AVG(Salary) AS [Средняя зарплата по кафедре]
FROM dbo.Employee emp
INNER JOIN dbo.Department d ON d.Shifr = emp.DepartmentShifr
GROUP BY d.Name, d.Shifr)
SELECT emp.Surname, emp.Salary, a.Кафедра, a.[Средняя зарплата по кафедре]
FROM dbo.Employee emp
INNER JOIN СЗК a ON a.Shifr = emp.DepartmentShifr
WHERE emp.Salary < a.[Средняя зарплата по кафедре]
select * from dbo.Employee emp
--9.	Напишите команды для удаления всех созданных вами представлений.
DROP VIEW dbo.View_1

 DROP VIEW dbo.View_2

 DROP VIEW dbo.View_3 

--Лабораторная работа №14
--1.	Создайте курсор, содержащий отсортированные по баллам фамилии и баллы уче-ников, откройте его, выведите первую строку, закройте и освободите курсор.
DECLARE myCursor CURSOR FOR
SELECT Surname, Scores
FROM Learner
ORDER BY Scores DESC;
OPEN myCursor;
DECLARE @Surname NVARCHAR(MAX);
DECLARE @Scores INT;
FETCH NEXT FROM myCursor INTO @Surname, @Scores;
PRINT 'Фамилия: ' + @Surname + ', Баллы: ' + CAST(@Scores AS NVARCHAR(MAX));
CLOSE myCursor;
DEALLOCATE myCursor;
--2.	Создайте курсор с прокруткой, содержащий список учеников, откройте его, выве-дите пятую, предыдущую, с конца четвертую, следующую, первую строку, закройте и освобо-дите курсор.
DECLARE myScrollCursor CURSOR SCROLL FOR
SELECT Surname, Scores
FROM Learner
ORDER BY Surname;
OPEN myScrollCursor;
DECLARE @Surname NVARCHAR(MAX);
DECLARE @Scores INT;
FETCH ABSOLUTE 5 FROM myScrollCursor INTO @Surname, @Scores;
PRINT 'Пятая строка: Фамилия: ' + @Surname + ', Баллы: ' + CAST(@Scores AS NVARCHAR(MAX));
FETCH PRIOR FROM myScrollCursor INTO @Surname, @Scores;
PRINT 'Предыдущая строка: Фамилия: ' + @Surname + ', Баллы: ' + CAST(@Scores AS NVARCHAR(MAX));
FETCH RELATIVE -4 FROM myScrollCursor INTO @Surname, @Scores;
PRINT 'Четвертая с конца строка: Фамилия: ' + @Surname + ', Баллы: ' + CAST(@Scores AS NVARCHAR(MAX));
FETCH NEXT FROM myScrollCursor INTO @Surname, @Scores;
PRINT 'Следующая строка: Фамилия: ' + @Surname + ', Баллы: ' + CAST(@Scores AS NVARCHAR(MAX));
FETCH FIRST FROM myScrollCursor INTO @Surname, @Scores;
PRINT 'Первая строка: Фамилия: ' + @Surname + ', Баллы: ' + CAST(@Scores AS NVARCHAR(MAX));
CLOSE myScrollCursor;
DEALLOCATE myScrollCursor;
--3.	Создайте курсор с прокруткой, содержащий список учеников, откройте его, выве-дите последнюю, шесть позиций назад находящуюся, четыре позиций вперед находящуюся строку, закройте и освободите курсор.
DECLARE myScrollCursor CURSOR SCROLL FOR
SELECT Surname, Scores
FROM Learner
ORDER BY Surname;
OPEN myScrollCursor;
DECLARE @Surname NVARCHAR(MAX);
DECLARE @Scores INT;
FETCH LAST FROM myScrollCursor INTO @Surname, @Scores;
PRINT 'Последняя строка: Фамилия: ' + @Surname + ', Баллы: ' + CAST(@Scores AS NVARCHAR(MAX));
FETCH RELATIVE -6 FROM myScrollCursor INTO @Surname, @Scores;
PRINT 'Строка, находящаяся на шесть позиций назад: Фамилия: ' + @Surname + ', Баллы: ' + CAST(@Scores AS NVARCHAR(MAX));
FETCH RELATIVE 4 FROM myScrollCursor INTO @Surname, @Scores;
PRINT 'Строка, находящаяся на четыре позиции вперед: Фамилия: ' + @Surname + ', Баллы: ' + CAST(@Scores AS NVARCHAR(MAX));
CLOSE myScrollCursor;
DEALLOCATE myScrollCursor;
--4.	С помощью курсора, вычислите сумму баллов у учеников с наибольшим и наименьшим баллом.
-- Объявляем курсор для наибольшего балла
DECLARE @MaxScore INT;
DECLARE @MinScore INT;
DECLARE myCursor CURSOR FOR
SELECT MAX(Scores) AS MaxScore, MIN(Scores) AS MinScore
FROM Learner;
OPEN myCursor;
FETCH NEXT FROM myCursor INTO @MaxScore, @MinScore;
DECLARE @SumMaxScore INT;
DECLARE @SumMinScore INT;
SET @SumMaxScore = 0;
SET @SumMinScore = 0;
DECLARE @StudentScore INT;
DECLARE maxScoreCursor CURSOR FOR
SELECT Scores
FROM Learner
WHERE Scores = @MaxScore;
OPEN maxScoreCursor;
FETCH NEXT FROM maxScoreCursor INTO @StudentScore;
WHILE @@FETCH_STATUS = 0
BEGIN
    SET @SumMaxScore = @SumMaxScore + @StudentScore;
    FETCH NEXT FROM maxScoreCursor INTO @StudentScore;
END;
CLOSE maxScoreCursor;
DEALLOCATE maxScoreCursor;
DECLARE minScoreCursor CURSOR FOR
SELECT Scores
FROM Learner
WHERE Scores = @MinScore;
OPEN minScoreCursor;
FETCH NEXT FROM minScoreCursor INTO @StudentScore;
WHILE @@FETCH_STATUS = 0
BEGIN
    SET @SumMinScore = @SumMinScore + @StudentScore;
    FETCH NEXT FROM minScoreCursor INTO @StudentScore;
END;
CLOSE minScoreCursor;
DEALLOCATE minScoreCursor;
PRINT 'Сумма баллов у учеников с наибольшим баллом: ' + CAST(@SumMaxScore AS NVARCHAR(MAX));
PRINT 'Сумма баллов у учеников с наименьшим баллом: ' + CAST(@SumMinScore AS NVARCHAR(MAX));
CLOSE myCursor;
DEALLOCATE myCursor;
--5.	С помощью курсора, сгенерируйте строку вида «Ученики <список фамилий и названий предметов, разделенных запятыми> участвовали в олимпиаде».
-- Объявляем курсор для выборки фамилий и предметов учеников
DECLARE myCursor CURSOR FOR
SELECT Surname, Specialization
FROM Learner;
OPEN myCursor;
DECLARE @SurnameName NVARCHAR(MAX);
DECLARE @Surname NVARCHAR(MAX);
DECLARE @Specialization NVARCHAR(MAX);
SET @SurnameName = 'Ученики ';
DECLARE @AddData BIT;
SET @AddData = 0;
FETCH NEXT FROM myCursor INTO @Surname, @Specialization;
WHILE @@FETCH_STATUS = 0
BEGIN
    IF @AddData = 1
        SET @SurnameName = @SurnameName + ', ';
    SET @SurnameName = @SurnameName + @Surname + ' (' + @Specialization + ')';
    SET @AddData = 1;
    FETCH NEXT FROM myCursor INTO @Surname, @Specialization;
END;
CLOSE myCursor;
DEALLOCATE myCursor;
SET @SurnameName = @SurnameName + ' участвовали в олимпиаде';
PRINT @SurnameName;
--6.	Создайте курсор, содержащий список учеников, с его помощью выведите учеников с нечетной позицией.
DECLARE myCursor CURSOR FOR
SELECT Surname
FROM Learner;
OPEN myCursor;
DECLARE @Surname NVARCHAR(MAX);
DECLARE @Position INT;
SET @Position = 1;
FETCH NEXT FROM myCursor INTO @Surname;
WHILE @@FETCH_STATUS = 0
BEGIN
    IF @Position % 2 = 1
    BEGIN
        PRINT 'Ученик с нечетной позицией: ' + @Surname;
    END
    SET @Position = @Position + 1;
    FETCH NEXT FROM myCursor INTO @Surname;
END;
CLOSE myCursor;
DEALLOCATE myCursor;
--7.	Создайте курсор, содержащий отсортированный по убыванию баллов список уче-ников, откройте его, для каждого ученика выведите фамилию, предмет, школу, баллы и про-центное соотношение баллов с предыдущим учеником.
DECLARE myCursor CURSOR FOR
SELECT Surname, Specialization, School, Scores
FROM Learner
ORDER BY Scores DESC;
OPEN myCursor;
DECLARE @Surname NVARCHAR(MAX);
DECLARE @Specialization NVARCHAR(MAX);
DECLARE @School NVARCHAR(MAX);
DECLARE @Scores INT;
DECLARE @LastScores INT;
DECLARE @Procent DECIMAL(5,2);
SET @Surname = '';
SET @Specialization = '';
SET @School = '';
SET @Scores = 0;
SET @LastScores = 0;
FETCH NEXT FROM myCursor INTO @Surname, @Specialization, @School, @Scores;
WHILE @@FETCH_STATUS = 0
BEGIN
    IF @LastScores = 0
        SET @Procent = 0;
    ELSE
        SET @Procent = (CAST(@Scores AS DECIMAL(5,2)) / CAST(@LastScores AS DECIMAL(5,2))) * 100;
    PRINT 'Фамилия: ' + @Surname;
    PRINT 'Предмет: ' + @Specialization;
    PRINT 'Школа: ' + @School;
    PRINT 'Баллы: ' + CAST(@Scores AS NVARCHAR(MAX));
    PRINT 'Процентное соотношение с предыдущим учеником: ' + CAST(@Procent AS NVARCHAR(MAX)) + '%';
    PRINT '---------------------------------------';
    SET @LastScores = @Scores;
    FETCH NEXT FROM myCursor INTO @Surname, @Specialization, @School, @Scores;
END;
CLOSE myCursor;
DEALLOCATE myCursor;

--Лабораторная работа №15
--1. Вывести список учеников и разницу между баллами ученика и максимальным баллом в каждой строке.
 SELECT s.Surname, s.Scores, s.Scores - MAX(s.Scores) OVER() AS Разница FROM dbo.Learner s
--2. Вывести список учеников и процентное соотношение к среднему баллу в каждой строке.
SELECT s.Surname, s.Scores, s.Scores * 100 / AVG(s.Scores) OVER() AS Процент  FROM dbo.Learner s
--3. Вывести список учеников и минимальный балл в школе в каждой строке.
SELECT s.Surname, MIN(s.Scores) OVER(PARTITION BY s.School) AS Мин_балл  FROM dbo.Learner s
--4. Вывести список учеников и суммарный балл в школе в каждой строке, отсортировать по школам в оконной функции.
SELECT s.Surname, SUM(s.Scores) OVER(PARTITION BY s.School ORDER BY s.School) AS сумм_балл FROM dbo.Learner s
--5. Вывести список учеников и номер строки при сортировке по фамилиям в обратном алфавитном порядке.
SELECT ROW_NUMBER() OVER (ORDER BY s.Surname DESC) AS Номер_строки, s.Surname
FROM dbo.Learner s
ORDER BY s.Surname DESC
 --6. Вывести список учеников, номер строки внутри школы и количество учеников в школе при сортировке по баллам по убыванию.
 SELECT  ROW_NUMBER() OVER (PARTITION BY s.School ORDER BY s.Scores DESC),
s.Surname,  COUNT(*) OVER (PARTITION BY s.School)
FROM  dbo.Learner s
ORDER BY  s.Scores DESC
--7. Вывести список учеников и ранг по баллам.
SELECT s.Surname,  s.Scores,RANK() OVER (ORDER BY s.Ball DESC) AS ранг
FROM dbo.Learner s
--8. Вывести список учеников и сжатый ранг по баллам. Результат отсортировать по фамилии в алфавитном порядке.
SELECT  s.Surname, s.Scores,  DENSE_RANK() OVER (ORDER BY s.Scores DESC) AS сжатый_ранг
FROM  dbo.Learner s
ORDER BY  s.Surname ASC
--9.Вывести список учеников, распределенных по пяти группам по фамилии.
SELECT
NTILE(5) OVER(ORDER BY s.Surname) AS Группа,s.Surname,s.Specialization,s.School,s.Scores
FROM
dbo.Learner s
--10.Вывести список учеников, распределенных по трем группам по баллам внутри школы.
SELECT
NTILE(3) OVER(ORDER BY s.Scores) AS Группа ,s.Surname,s.Specialization,s.School,s.Scores
FROM
dbo.Learner s
WHERE s.School = 'Лицей'
--11. Вывести список учеников и разницу с баллами ученика, находящегося выше на три позиции при сортировке по возрастанию баллов.
SELECT  s.Surname,
  s.Scores,  s.Scores - LAG(s.Scores, 3) OVER (ORDER BY s.Scores ASC) AS Разница
FROM   dbo.Learner s
ORDER BY  s.Scores ASC
--12.Вывести список учеников и разницу с баллами следующего ученика при сорти-ровке по убыванию баллов, значение по умолчанию использовать 0.
SELECT s.Surname AS ученик, COALESCE(s.Scores - s1.Scores, 0) AS разница_с_следующим_учеником
FROM dbo.Learner s
LEFT JOIN dbo.Learner s1 ON s.ID = s1.ID + 1
ORDER BY s.Scores DESC;

--Лабораторная работа №16
--1. Напишите запрос, который выводит максимальный балл учеников по школам, по каждому предмету по каждой школе и промежуточные итоги. 
SELECT MAX(s.Scores) 'Максимальный балл', s.School, s.Specialization FROM dbo.Learner s 
GROUP BY s.Specialization, s.School WITH ROLLUP
--2. Напишите запрос, который выводит минимальный балл учеников по школам и по предметам, и промежуточные итоги. 
SELECT s.Specialization, 
s.School,MIN(s.Scores) AS мин_балл 
FROM dbo.Learner s 
GROUP BY s.Specialization, s.School WITH CUBE 
--3. Напишите запрос, который выводит средний балл учеников по школам и по предметам. 
SELECT s.Specialization,s.School,AVG(s.Scores) AS средний_балл 
FROM dbo.Learner s 
GROUP BY GROUPING SETS(s.Specialization, s.School) 
--4. Напишите запрос, который выводит количество учеников по каждой школе по предметам и промежуточные итоги. NULL значения заменить на соответствующий текст. 
SELECT COALESCE(s.Specialization, 'ИТОГО') AS Предмет,COALESCE(s.School, 'Итого') AS Школа, 
COUNT(s.Surname) AS Количество
FROM dbo.Learner s 
GROUP BY ROLLUP(s.Specialization, s.School) 
--5. Напишите запрос, который выводит суммарный балл учеников по школам и по пред-метам, и промежуточные итоги. В итоговых строках NULL значения заменить на соответству-ющий текст в зависимости от группировки. 
SELECT 
IIF(GROUPING(s.Specialization)=1, 'ИТОГО', s.Specialization) AS Предмет, 
IIF(GROUPING(s.School)=1, 'Итого', s.School) AS Школа , 
COUNT(s.Surname) AS Количество
FROM dbo.Learner s 
GROUP BY CUBE(s.Specialization,s.School)
--6. Напишите запрос, который выводит максимальный балл учеников по школам и по предметам. В итоговых строках NULL значения заменить на соответствующий текст в зави-симости от уровней группировки. 
SELECT CASE GROUPING_ID(s.Specialization, s.School) 
WHEN 1 THEN 'Итого по предметам' 
WHEN 3 THEN 'Итого' 
ELSE ''END AS Итого ,
ISNULL(s.Specialization, '') AS Предмет,ISNULL(s.School, '') AS Школа ,MAX(s.Scores) AS Количество
FROM dbo.Learner s
GROUP BY ROLLUP(s.Specialization, s.School) 
--7. Напишите запрос, который выводит средний балл учеников по школам в столбцы. 
SELECT s.School, AVG(s.Scores) AS Average_Score
FROM dbo.Learner s 
GROUP BY s.School
--8. Напишите запрос, который выводит средний балл учеников по школам в столбцы и по предметам в строки. 
SELECT s.Specialization, AVG(CASE WHEN s.School = 'Гимназия' THEN s.Scores END) AS 'Гимназия', 
AVG(CASE WHEN s.School = 'Лицей' THEN s.Scores END) AS 'Лицей'FROM dbo.Learner s
GROUP BY s.Specialization;
--9. Напишите запрос, который выводит названия предметов, фамилии учеников и школы в один столбец. 
 SELECT CONCAT(s.Specialization, ', ', s.Surname, ', ', s.School) AS Info
 FROM dbo.Learner s

  --Лабораторная работа №17
 --1.	Создайте и запустите динамический SQL-запрос, выбирающий первые N строк из заданной таблицы.
DECLARE @DSQL VARCHAR(100)
DECLARE @TN VARCHAR(50)
SET @TN = 'Ученики'
SET @DSQL = 'SELECT top 3 * from dbo.Learner s' + @TN
EXECUTE (@DSQL)
--2.	Создайте и запустите динамический SQL-запрос, выбирающий все страны из таб-лицы «Страны», последняя буква названия которых расположена в заданном диапазоне.
DECLARE @L1 CHAR(1)
DECLARE @L2 CHAR(1)
SET @L1 = 'а'
SET @L2 = 'д'
EXECUTE ('SELECT c.* FROM dbo.Country c WHERE c.Name  LIKE ''%[' + @L1 + '-' + @L2 +']''')
--3.	Создайте временную таблицу #Temp и добавьте к ней название столбцов таблицы «Страны». Создайте курсор, который, построчно читая таблицу #Temp, выбирает каждый раз соответствующий столбец из таблицы «Страны».
CREATE TABLE #Temp (
  Name VARCHAR(255),
  MainCity VARCHAR(255),
  Square FLOAT,
  Population BIGINT,
  Continent VARCHAR(255)
);
INSERT INTO #Temp (Name, MainCity, Square, Population, Continent)
SELECT Name, MainCity, Square, Population, Continent
FROM Country;
DECLARE cursor_countries1 CURSOR FOR 
SELECT Name, MainCity, Square, Population, Continent
FROM #Temp;
DECLARE @Name VARCHAR(255),
        @Capital VARCHAR(255),
        @Square FLOAT,
        @Population BIGINT,
        @Continent VARCHAR(255);
OPEN cursor_countries1;
FETCH NEXT FROM cursor_countries1 INTO @Name, @Capital, @Square, @Population, @Continent;
WHILE @@FETCH_STATUS = 0
BEGIN
PRINT @Name;
FETCH NEXT FROM cursor_countries1 INTO @Name, @Capital, @Square, @Population, @Continent;
END
CLOSE cursor_countries1;
DEALLOCATE cursor_countries1;
DROP TABLE #Temp;
--4.	Создайте процедуру, которая принимает как параметр список столбцов, название таблицы и выбирает заданные столбцы из заданной таблицы.
CREATE PROCEDURE SelectColumnsFromTable(
    @columns VARCHAR(MAX),
    @tableName VARCHAR(100)
)
AS
BEGIN
    DECLARE @sqlQuery NVARCHAR(MAX)
    SET @sqlQuery = 'SELECT ' + @columns + ' FROM ' + @tableName  
    EXEC sp_executesql @sqlQuery
END
EXEC SelectColumnsFromTable 'Name, MainCity, Square', 'Countrу'
--5.	Создайте процедуру, принимающую как параметр список столбцов, название таб-лицы, название проверяемого столбца, знак сравнения, значение проверки и выбирающую за-данные столбцы из заданной таблицы в заданных условиях.
CREATE PROCEDURE SelectProcedur
    @Columns NVARCHAR(MAX),
    @TableName NVARCHAR(MAX),
    @CheckColumn NVARCHAR(MAX),
    @ComparisonOperator NVARCHAR(2),
    @ComparisonValue INT
AS
BEGIN
    DECLARE @SQL NVARCHAR(MAX)
    SET @SQL = 'SELECT ' + @Columns + ' FROM ' + @TableName + ' WHERE ' + @CheckColumn + ' ' + @ComparisonOperator + ' ' + CAST(@ComparisonValue AS NVARCHAR(MAX)) 
    EXEC sp_executesql @SQL
END
EXEC SelectProcedur 'Name, MainCity, Square', 'Countrу', 'Population', '>', 100000
--6.	Выберите список европейских стран из таблицы «Страны» и экспортируйте в RAW формате XML.
Select c.* from dbo.Country c
Where c.Continent = 'Европа'
For XML RAW
--7.	Выберите список стран с населением больше 100 млн. чел. из таблицы «Страны» и экспортируйте в PATH формате XML.
Select c.* from dbo.Country c
Where c.Population > 100000000
For XML PATH
--8.	Выберите список учеников из школы «Лицей» из таблицы «Ученики» и экспорти-руйте в PATH формате JSON
Select s.* from dbo.Learner s
Where s.School = 'Лицей'
FOR JSON PATH


