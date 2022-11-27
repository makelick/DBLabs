-- створення ролей та користувачів --
USE exchequer;

CREATE ROLE IF NOT EXISTS `адміністратор казначейства`, `бухгалтер бюджетної установи`;

GRANT INSERT, SELECT, DELETE ON `казначейство` TO `адміністратор казначейства`;
GRANT INSERT, SELECT, DELETE ON `казначейство-банк` TO `адміністратор казначейства`;
GRANT INSERT, SELECT, DELETE ON `бюджетна установа` TO `адміністратор казначейства`;
GRANT UPDATE ON `платіжне доручення`TO `адміністратор казначейства`;
GRANT SELECT ON * TO `адміністратор казначейства`;

GRANT INSERT, SELECT, DELETE ON `затверджений кошторис` TO `бухгалтер бюджетної установи`;
GRANT INSERT, SELECT, DELETE ON `кошторис` TO `бухгалтер бюджетної установи`;
GRANT INSERT, SELECT, DELETE ON `кекв` TO `бухгалтер бюджетної установи`;
GRANT INSERT, SELECT, DELETE ON `платіжне доручення` TO `бухгалтер бюджетної установи`;
GRANT INSERT, SELECT, DELETE ON `реквізити` TO `бухгалтер бюджетної установи`;

CREATE USER IF NOT EXISTS `Biba` IDENTIFIED BY 'qwerty123';
GRANT `бухгалтер бюджетної установи` TO `Biba`;

CREATE USER IF NOT EXISTS `Boba` IDENTIFIED BY 'qwerty321';
GRANT `адміністратор казначейства` TO `Boba`;