SELECT COUNT(*)
FROM реквізити
WHERE сума > 50000;

SELECT SUM(сума)
FROM реквізити;

SELECT UPPER(отримувач)
FROM реквізити;

SELECT LOWER(підстава)
FROM реквізити;

SELECT DATEDIFF(дата, CURDATE())
FROM реквізити;

SELECT COUNT(`кекв id`), `кошторис id`
FROM кекв
GROUP BY `кошторис id`;

SELECT COUNT(`кекв id`), `кошторис id`
FROM кекв
GROUP BY `кошторис id`
HAVING COUNT(`кекв id`) >= 2;

SELECT *
FROM кекв
HAVING `витрачена сума` = MAX(`витрачена сума`);

SELECT row_number() over(ORDER BY(номер)) num, `реквізити id`, дата
FROM реквізити
ORDER BY дата;

SELECT `кекв id`, `ліміт витрат`, `витрачена сума`
FROM кекв
ORDER BY `ліміт витрат`, `витрачена сума`;

-- частина 2 --

CREATE OR REPLACE VIEW view1 AS
    SELECT к.`кекв id`, SUM(сума) AS 'сума доручень'
    FROM `платіжне доручення` пд
    JOIN реквізити р USING(`реквізити id`)
    JOIN кекв к USING(`кекв id`)
    GROUP BY к.`кекв id`
    ORDER BY к.`кекв id`;
SELECT * FROM view1;

CREATE OR REPLACE VIEW view2 AS
    SELECT бу.`бюджетна установа id`, бу.назва AS 'назва установи', `кошторис id`, SUM(`сума доручень`)
    FROM `бюджетна установа` бу
    JOIN `затверджений кошторис` USING(`бюджетна установа id`)
    LEFT JOIN кошторис USING(`кошторис id`)
    LEFT JOIN кекв USING(`кошторис id`)
    LEFT JOIN view1 USING(`кекв id`)
    GROUP BY бу.`бюджетна установа id`;
SELECT * FROM view2;

ALTER VIEW view2 AS
    SELECT бу.`бюджетна установа id`, SUM(`сума доручень`)
    FROM `бюджетна установа` бу
    JOIN `затверджений кошторис` USING(`бюджетна установа id`)
    LEFT JOIN кошторис USING(`кошторис id`)
    LEFT JOIN кекв USING(`кошторис id`)
    LEFT JOIN view1 USING(`кекв id`)
    GROUP BY бу.`бюджетна установа id`;
SELECT * FROM view2;

SHOW CREATE VIEW view1;
SELECT *
FROM information_schema.tables
WHERE TABLE_TYPE = 'VIEW' AND TABLE_NAME LIKE 'view_';
