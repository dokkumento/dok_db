use dokkumento;

CREATE TABLE `users` (
  `id` INT unsigned NOT NULL AUTO_INCREMENT UNIQUE,
  `username` VARCHAR(25) NOT NULL UNIQUE,
  `password` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL UNIQUE,
  PRIMARY KEY (id)
) ENGINE=InnoDB;

CREATE TABLE `projects` (
  `id` INT unsigned NOT NULL AUTO_INCREMENT,
  `projectId` VARCHAR(20) NOT NULL UNIQUE,
  `user_id` INT unsigned,
  `admins` VARCHAR(255),
  `structure` VARCHAR(1000),
  FOREIGN KEY (`user_id`)
    REFERENCES users(`id`)
    ON DELETE CASCADE,
  PRIMARY KEY (id)
) ENGINE=InnoDB;

CREATE TABLE `documents` (
  `id` INT unsigned NOT NULL AUTO_INCREMENT,
  `projectId` VARCHAR(20) NOT NULL,
  `title` VARCHAR(255) NOT NULL,
  `path` VARCHAR(255),
  `contents` LONGTEXT, 
  FOREIGN KEY (`projectId`)
    REFERENCES projects(projectId)
    ON DELETE CASCADE,
  PRIMARY KEY (id)
) ENGINE=InnoDB;