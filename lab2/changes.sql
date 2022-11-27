-- зміни в структурі --
USE exchequer;

ALTER TABLE `бюджетна установа` ADD `кількість працівників` INT;
ALTER TABLE `казначейство` RENAME `підрозділ казначейства`;
ALTER TABLE `кошторис` ALTER `рік` SET DEFAULT 2022;
ALTER TABLE `реквізити` MODIFY COLUMN `дата` DATE NULL;
ALTER TABLE `кошторис` ADD CONSTRAINT test CHECK (`ліміт витрат`> 1000.0);