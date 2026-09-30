
SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS EV_Organizer;
DROP TABLE IF EXISTS EV_Service;
DROP TABLE IF EXISTS EV_Extra;

SET FOREIGN_KEY_CHECKS = 1;


CREATE TABLE EV_Service (
    EV_Service_id   INT NOT NULL,
    EV_Service_name VARCHAR(100) NOT NULL,
    PRIMARY KEY (EV_Service_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE EV_Extra (
    EV_Extra_id   INT NOT NULL,
    EV_Extra_name VARCHAR(100) NOT NULL,
    PRIMARY KEY (EV_Extra_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



CREATE TABLE EV_Organizer (
    EV_O_id          INT NOT NULL,
    EV_O_name        VARCHAR(50)  NOT NULL,
    EV_O_description VARCHAR(200),
    EV_O_service     INT NOT NULL,      
    EV_O_extra       INT NOT NULL,      
    EV_O_price_main  INT,             
    EV_O_price_extra INT,              
    PRIMARY KEY (EV_O_id),
    INDEX (EV_O_name),
    FOREIGN KEY (EV_O_service) REFERENCES EV_Service (EV_Service_id),
    FOREIGN KEY (EV_O_extra)   REFERENCES EV_Extra (EV_Extra_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ---------- Данные ----------

INSERT INTO EV_Service (EV_Service_id, EV_Service_name) VALUES
(1, 'Часовая игровая анимация'),
(2, 'Шоу мыльных пузырей'),
(3, 'Часовая игровая программа'),
(4, 'Массовые программы для детей до подросткового возраста'),
(5, 'Шоу-программа с использованием химических реагентов'),
(6, 'Квест с призами'),
(7, 'Часовая анимация'),
(8, 'Поздравление с подарками и танцами'),
(9, 'Пенная вечеринка');

INSERT INTO EV_Extra (EV_Extra_id, EV_Extra_name) VALUES
(1, 'Шоу мыльных пузырей'),
(2, 'ШДМ'),
(3, 'Огонь и дым'),
(4, 'Бумажное шоу'),
(5, 'Ростовая кукла'),
(6, 'Приготовление мороженого с помощью жидкого азота'),
(7, 'Мастер-класс'),
(8, 'Продление программы');

INSERT INTO EV_Organizer
(EV_O_id, EV_O_name, EV_O_description, EV_O_service, EV_O_extra, EV_O_price_main, EV_O_price_extra) VALUES
(1,  'Анимашки',         'Организация костюмированных представлений',        1, 1,  9000, 6000),
(2,  'Звездочки',        'Организация выездных праздников',                  1, 2,  8500,    0),
(3,  'Волшебный пузырь', 'Шоу мыльных пузырей',                              2, 3,  8000,    0),
(4,  'Сказка',           'Организация праздников в парках развлечений',      3, 4,  7000, 4000),
(5,  'Праздник Плюс',    'Организация выездных праздников',                  3, 1,  8500, 1500),
(6,  'ШоуШоу',           'Организация массовых и студийных праздников',      4, 5, 20000, 6500),
(7,  'ЭКСМО',            'Химическое шоу',                                   5, 6, 12000, 4500),
(8,  'Мир праздника',    'Квесты для школьников и их родителей',             6, 7,  2000,  500),
(9,  'Конфетти!!',       'Все виды праздников',                              7, 1,  9000, 6000),
(10, 'ПраздникТут',      'Поздравления ростовыми фигурами',                  8, 8,  6000, 6000),
(11, 'Джунгли парк',     'Игровые программы на площадке с аттракционами',    1, 7,  6500, 1500),
(12, 'ПенаПУШКА',        'Пенные вечеринки на природе и в студии',           9, 5, 12000, 4000);



SELECT * FROM EV_Service;
SELECT * FROM EV_Extra;
SELECT * FROM EV_Organizer;


SELECT o.EV_O_id                AS 'Номер',
       o.EV_O_name              AS 'Организатор',
       o.EV_O_description       AS 'Описание',
       s.EV_Service_name        AS 'Оказываемая услуга',
       e.EV_Extra_name          AS 'Дополнительная услуга',
       o.EV_O_price_main        AS 'Цена основной услуги',
       o.EV_O_price_extra       AS 'Цена дополнительной услуги'
FROM EV_Organizer AS o
INNER JOIN EV_Service AS s ON s.EV_Service_id = o.EV_O_service
INNER JOIN EV_Extra   AS e ON e.EV_Extra_id   = o.EV_O_extra;
