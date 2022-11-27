-- внесення даних --
USE exchequer;

LOAD DATA
INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\bank.csv'
INTO TABLE `комерційний банк`
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';

LOAD DATA
INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\kasnacheistvo.csv'
INTO TABLE `казначейство`
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';

LOAD DATA
INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\kasnacheistvo-bank.csv'
INTO TABLE `казначейство-банк`
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';

LOAD DATA
INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\budg_ustanova.csv'
INTO TABLE `бюджетна установа`
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';

LOAD DATA
INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\koshtoris.csv'
INTO TABLE `кошторис`
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';

LOAD DATA
INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\zatv_koshtoris.csv'
INTO TABLE `затверджений кошторис`
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';

LOAD DATA
INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\kekw.csv'
INTO TABLE `кекв`
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';

LOAD DATA
INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\rekvizit.csv'
INTO TABLE `реквізити`
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';

LOAD DATA
INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\doruchennya.csv'
INTO TABLE `платіжне доручення`
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';