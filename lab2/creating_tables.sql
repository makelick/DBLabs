DROP DATABASE exchequer;
-- створення таблиць --
CREATE DATABASE IF NOT EXISTS exchequer;

USE exchequer;

CREATE TABLE IF NOT EXISTS `реквізити` (
	`реквізити id` INT AUTO_INCREMENT,
	`дата` DATE,
    `номер` INT,
    `отримувач` VARCHAR(255),
    `підстава` VARCHAR(255),
    `сума` DOUBLE,
    PRIMARY KEY (`реквізити id`)
);

CREATE TABLE IF NOT EXISTS `платіжне доручення` (
	`доручення id` INT AUTO_INCREMENT,
    `реквізити id` INT UNIQUE,
    `кекв id` INT,
    `затверджений казначейством` CHAR(1) DEFAULT 'F',
    PRIMARY KEY (`доручення id`),
    CHECK ( `затверджений казначейством` IN ('T', 'F'))
);

CREATE TABLE IF NOT EXISTS `кекв` (
	`кекв id` INT AUTO_INCREMENT,
    `кошторис id` INT,
    `призначення` VARCHAR(255),
    `ліміт витрат` DOUBLE,
    `витрачена сума` DOUBLE,
    PRIMARY KEY (`кекв id`),
    CHECK (`витрачена сума` <= `ліміт витрат`)
);

CREATE TABLE IF NOT EXISTS `кошторис` (
	`кошторис id` INT AUTO_INCREMENT,
	`бюджетна установа id` INT,
    `рік` YEAR,
    `ліміт витрат` DOUBLE,
    `витрачена сума` DOUBLE,
    PRIMARY KEY (`кошторис id`),
    CHECK (`витрачена сума` <= `ліміт витрат`)
);

CREATE TABLE IF NOT EXISTS `затверджений кошторис` (
	`бюджетна установа id` INT UNIQUE,
	`кошторис id` INT UNIQUE,
    PRIMARY KEY (`бюджетна установа id`, `кошторис id`)
);

CREATE TABLE IF NOT EXISTS `бюджетна установа` (
	`бюджетна установа id` INT AUTO_INCREMENT,
    `казначейство id` INT,
    `назва` VARCHAR(255),
    `адреса` VARCHAR(255),
    PRIMARY KEY (`бюджетна установа id`)
); 

CREATE TABLE IF NOT EXISTS `казначейство` (
	`казначейство id` INT AUTO_INCREMENT,
    `територіальна належність` VARCHAR(255),
    PRIMARY KEY (`казначейство id`)
);


CREATE TABLE IF NOT EXISTS `казначейство-банк` (
	`казначейство id` INT,
    `банк id` INT,
    PRIMARY KEY (`казначейство id`, `банк id`)
);

CREATE TABLE IF NOT EXISTS `комерційний банк` (
	`банк id` INT AUTO_INCREMENT,
    `назва` VARCHAR(255),
    `єдрпоу` INT,
    PRIMARY KEY (`банк id`)
);