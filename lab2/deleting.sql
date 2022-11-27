-- видалення --
USE exchequer;

DROP TABLE `комерційний банк`;
ALTER TABLE `платіжне доручення` DROP COLUMN `затверджений казначейством`;
ALTER TABLE `кошторис` DROP CONSTRAINT test;