-- a
SELECT          tt_number               AS "номер заявки", 
                public."Users".name     AS "имя пользователя", 
                work_time               AS "время отработки", 
                public."TTStatus".name  AS "название статуса"
FROM            public."TroubleTickets"
INNER JOIN      public."Users"    ON user_id   = public."Users".id
INNER JOIN      public."TTStatus" ON tt_status = public."TTStatus".id
WHERE           work_time > '2020-12-02 12:00:00'
ORDER BY        work_time ASC

-- b
SELECT          tt_number               AS "номер заявки", 
                public."Users".name     AS "имя пользователя", 
                work_time               AS "время отработки", 
                public."TTStatus".name  AS "название статуса"
FROM            public."TroubleTickets"
INNER JOIN      public."Users"    ON user_id   = public."Users".id
INNER JOIN      public."TTStatus" ON tt_status = public."TTStatus".id
WHERE           public."Users".name = 'Петрова Мария' AND public."TTStatus".name = 'Ожидание'
ORDER BY        work_time ASC

-- с
SELECT          tt_number               AS "номер заявки", 
                public."Users".name     AS "имя пользователя", 
                work_time               AS "время отработки", 
                public."TTStatus".name  AS "название статуса"
FROM            public."TroubleTickets"
INNER JOIN      public."Users"          ON user_id   = public."Users".id 
INNER JOIN      public."TTStatus"       ON tt_status = public."TTStatus".id
WHERE           public."Users".name     LIKE 'Иванов%' AND public."TTStatus".name = 'Ожидание'
ORDER BY        work_time DESC

-- d
SELECT          to_char(work_time, 'DD-MM-YYYY')    AS "дата",
                public."TTStatus".name              AS "название статуса", 
                COUNT (*)                           AS "количество заявок"
FROM            public."TroubleTickets", public."TTStatus"
WHERE           work_time BETWEEN '2020-12-02' AND '2020-12-04'
GROUP BY        to_char(work_time, 'DD-MM-YYYY'), public."TTStatus".name
HAVING          name = 'Ожидание' OR name = 'Открыта'
ORDER BY        to_char(work_time, 'DD-MM-YYYY') DESC

-- e
SELECT          public."Users".name     AS "имя пользователя", 
                COUNT (*)               AS "открытых заявок"
FROM            public."TroubleTickets"
INNER JOIN      public."Users"    ON user_id   = public."Users".id
INNER JOIN      public."TTStatus" ON tt_status = public."TTStatus".id
WHERE           public."TTStatus".name = 'Открыта'
GROUP BY        public."Users".name
ORDER BY        public."Users".name ASC