-- TTStatus
CREATE TABLE public."TTStatus"
(
    id              serial,
    name            varchar(255)    NOT NULL,
    PRIMARY KEY     (id)
);
INSERT INTO public."TTStatus"(name) 
VALUES  ('Открыта'), 
        ('Ожидание'), 
        ('Закрыта');

-- Users
CREATE TABLE public."Users"
(
    id              serial,
    name            varchar(255)    NOT NULL,
    PRIMARY KEY     (id)
);
INSERT INTO public."Users"(name) 
VALUES  ('Иванов Иван'),
        ('Петрова Мария'),
        ('Грачев Алексей'),
        ('Сидорова Екатерина'),
        ('Иванов Алексей');

-- TroubleTickets
CREATE TABLE public."TroubleTickets"
(
    tt_number       integer         NOT NULL 
                                    GENERATED ALWAYS AS IDENTITY
                                    ( INCREMENT 1 START 1000 ),
    user_id         integer         NOT NULL,
    work_time       timestamp       NOT NULL,
    tt_status       integer         NOT NULL DEFAULT 1,
    FOREIGN KEY     (user_id)       REFERENCES public."Users"     
                                    (id) MATCH SIMPLE   
                                    ON UPDATE NO ACTION   
                                    ON DELETE NO ACTION,
    FOREIGN KEY     (tt_status)     REFERENCES public."TTStatus"  
                                    (id) MATCH SIMPLE   
                                    ON UPDATE NO ACTION   
                                    ON DELETE NO ACTION,
    PRIMARY KEY     (tt_number)
);
INSERT INTO public."TroubleTickets"(user_id, work_time, tt_status) 
VALUES  (1,	'2020-12-01 11:05:00',	1),
        (3,	'2020-12-01 09:10:00',	3),
        (2,	'2020-12-01 13:12:00',	2),
        (4,	'2020-12-02 13:02:00',	2),
        (1,	'2020-12-02 15:36:00',	1),
        (5,	'2020-12-02 19:55:00',	2),
        (2,	'2020-12-03 10:40:00',	1),
        (1,	'2020-12-04 12:15:00',	2),
        (4,	'2020-12-05 15:15:00',	1),
        (5,	'2020-12-05 15:36:00',	3),
        (3,	'2020-12-05 18:17:00',	1),
        (1,	'2020-12-06 09:01:00',	2);