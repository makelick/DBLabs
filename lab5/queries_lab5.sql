USE exchequer;

DROP PROCEDURE IF EXISTS create_table;
CREATE PROCEDURE create_table()
BEGIN
    DROP TABLE IF EXISTS temp_table;
    CREATE TEMPORARY TABLE temp_table AS
        SELECT *
        FROM `кошторис`
        LIMIT 15;
END;
CALL create_table();

DROP PROCEDURE IF EXISTS procedure_with_if;
CREATE PROCEDURE procedure_with_if()
BEGIN
    SELECT `кошторис id`,
           `ліміт витрат`,
           IF(`ліміт витрат` > 5000000, 'Великий бюджет',
               'Маленький бюджет')
               AS 'розмір бюджету'
    FROM `кошторис`
    ORDER BY `розмір бюджету`;
END;
CALL procedure_with_if();

DROP PROCEDURE IF EXISTS procedure_with_while;
CREATE PROCEDURE procedure_with_while()
BEGIN
    DECLARE counter INT DEFAULT 5;

    WHILE counter > 0 DO
        SELECT counter;
        SET counter = counter - 1;
    END WHILE;
END;
CALL procedure_with_while();

DROP PROCEDURE IF EXISTS procedure_with_while;
CREATE PROCEDURE procedure_with_while()
BEGIN
    DECLARE counter INT DEFAULT 5;

    WHILE counter > 0 DO
        SELECT counter;
        SET counter = counter - 1;
    END WHILE;
END;
CALL procedure_with_while();

DROP PROCEDURE IF EXISTS procedure_without_params;
CREATE PROCEDURE procedure_without_params()
BEGIN
    SELECT *
    FROM кекв;
END;
CALL procedure_without_params();

DROP PROCEDURE IF EXISTS procedure_with_params;
CREATE PROCEDURE procedure_with_params(
    IN max_sum INT
)
BEGIN
    SELECT *
    FROM кошторис
    WHERE `витрачена сума` < max_sum;
END;
CALL procedure_with_params(1000000);

DROP PROCEDURE IF EXISTS procedure_with_in_and_out;
CREATE PROCEDURE procedure_with_in_and_out(
    IN max_sum INT,
    OUT res INT
)
BEGIN
    SELECT COUNT(*)
    FROM кошторис
    WHERE `витрачена сума` < max_sum
    INTO res;
    SELECT res;
END;
CALL procedure_with_in_and_out(1000000, @res);

DROP PROCEDURE IF EXISTS update_table;
CREATE PROCEDURE update_table()
BEGIN
    UPDATE `кошторис`
    SET `витрачена сума` = `витрачена сума` + 100000
    WHERE `витрачена сума` < 1000000;
END;
CALL update_table();

DROP PROCEDURE IF EXISTS select_procedure;
CREATE PROCEDURE select_procedure()
BEGIN
    SELECT *
    FROM `кошторис`
    WHERE `витрачена сума` < 1000000;
END;
CALL select_procedure();

DROP FUNCTION IF EXISTS function_scalar;
CREATE  FUNCTION  function_scalar() RETURNS INT
READS SQL DATA
BEGIN
    DECLARE res INT;
    SELECT COUNT(*)
    FROM `кошторис`
    WHERE `витрачена сума` < 1000000
    INTO res;
    RETURN res;
END;
SELECT function_scalar();

-- Function in MySQL cannot return a table. So, I use stored procedure for this task.
DROP PROCEDURE IF EXISTS procedure_table_with_dynamic_columns;
CREATE PROCEDURE procedure_table_with_dynamic_columns(
    IN magic_number INT
)
BEGIN
    IF magic_number = 1 THEN
        SELECT `кекв id`, `витрачена сума`
        FROM `кекв`;
    ELSE
        SELECT *
        FROM `кекв`;
    END IF;
END;
CALL procedure_table_with_dynamic_columns(1);

DROP PROCEDURE IF EXISTS work_with_cursor;
CREATE PROCEDURE work_with_cursor(
)
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE name VARCHAR(255);
    DECLARE cur CURSOR FOR
        SELECT назва
        FROM `комерційний банк`;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO name;
        IF done = 1 THEN
            LEAVE read_loop;
        END IF;
        SELECT name;
    END LOOP;
END;
CALL work_with_cursor();

DROP TRIGGER IF EXISTS trigger_delete;
CREATE TRIGGER trigger_delete BEFORE DELETE ON `кошторис` FOR EACH ROW BEGIN
    IF OLD.`витрачена сума` > 1000000 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Ви не можете видалити запис, в якому витрачена сума більша за 1000000';
    END IF;
END;

DROP TRIGGER IF EXISTS trigger_update;
CREATE TRIGGER trigger_update BEFORE UPDATE ON `кошторис` FOR EACH ROW BEGIN
    IF NEW.`витрачена сума` > 1000000 THEN
        SET NEW.`витрачена сума` = 1000000;
    END IF;
END;

DROP TRIGGER IF EXISTS trigger_insert;
CREATE TRIGGER trigger_insert BEFORE INSERT ON `кошторис` FOR EACH ROW BEGIN
    IF NEW.`витрачена сума` > 1000000 THEN
        SET NEW.`витрачена сума` = 1000000;
    END IF;
END;
