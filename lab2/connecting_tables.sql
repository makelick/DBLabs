-- встановлення зв'язків --
USE exchequer;

ALTER TABLE `платіжне доручення`
	ADD FOREIGN KEY (`реквізити id`) REFERENCES `реквізити`(`реквізити id`)
    ON UPDATE CASCADE
    ON DELETE RESTRICT,
	ADD FOREIGN KEY (`кекв id`) REFERENCES `кекв`(`кекв id`)
    ON UPDATE CASCADE
    ON DELETE CASCADE;

ALTER TABLE `кекв`
	ADD FOREIGN KEY (`кошторис id`) REFERENCES `кошторис`(`кошторис id`)
    ON UPDATE CASCADE
    ON DELETE CASCADE;

ALTER TABLE `затверджений кошторис`
	ADD FOREIGN KEY (`бюджетна установа id`) REFERENCES `бюджетна установа`(`бюджетна установа id`)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
    ADD FOREIGN KEY (`кошторис id`) REFERENCES `кошторис`(`кошторис id`)
    ON UPDATE CASCADE
    ON DELETE CASCADE;

ALTER TABLE `кошторис`
	ADD FOREIGN KEY (`бюджетна установа id`) REFERENCES `бюджетна установа`(`бюджетна установа id`)
    ON UPDATE CASCADE
    ON DELETE CASCADE;

ALTER TABLE `бюджетна установа`
	ADD FOREIGN KEY (`казначейство id`) REFERENCES `казначейство`(`казначейство id`)
    ON UPDATE CASCADE
    ON DELETE RESTRICT;

ALTER TABLE `казначейство-банк`
    ADD FOREIGN KEY (`казначейство id`) REFERENCES `казначейство`(`казначейство id`)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
    ADD FOREIGN KEY (`банк id`) REFERENCES `комерційний банк`(`банк id`)
    ON UPDATE CASCADE
    ON DELETE CASCADE;
