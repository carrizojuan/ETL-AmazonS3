-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Content`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Content` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) NOT NULL,
  `description` MEDIUMTEXT NULL,
  `date_added` DATETIME NULL,
  `release_year` INT NULL,
  `duration` INT NULL,
  `rating` VARCHAR(255) NULL,
  `platform` ENUM("Netflix", "Disney") NOT NULL,
  `type` ENUM("Movie", "TV Show") NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Genre`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Genre` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Country`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Country` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Actor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Actor` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Director`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Director` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Content_has_Genre`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Content_has_Genre` (
  `Content_id` INT NOT NULL,
  `Genre_id` INT NOT NULL,
  PRIMARY KEY (`Content_id`, `Genre_id`),
  INDEX `fk_Content_has_Genre_Genre1_idx` (`Genre_id` ASC) VISIBLE,
  INDEX `fk_Content_has_Genre_Content_idx` (`Content_id` ASC) VISIBLE,
  CONSTRAINT `fk_Content_has_Genre_Content`
    FOREIGN KEY (`Content_id`)
    REFERENCES `mydb`.`Content` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Content_has_Genre_Genre1`
    FOREIGN KEY (`Genre_id`)
    REFERENCES `mydb`.`Genre` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Content_has_Director`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Content_has_Director` (
  `Content_id` INT NOT NULL,
  `Director_id` INT NOT NULL,
  PRIMARY KEY (`Content_id`, `Director_id`),
  INDEX `fk_Content_has_Director_Director1_idx` (`Director_id` ASC) VISIBLE,
  INDEX `fk_Content_has_Director_Content1_idx` (`Content_id` ASC) VISIBLE,
  CONSTRAINT `fk_Content_has_Director_Content1`
    FOREIGN KEY (`Content_id`)
    REFERENCES `mydb`.`Content` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Content_has_Director_Director1`
    FOREIGN KEY (`Director_id`)
    REFERENCES `mydb`.`Director` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Content_has_Actor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Content_has_Actor` (
  `Content_id` INT NOT NULL,
  `Actor_id` INT NOT NULL,
  PRIMARY KEY (`Content_id`, `Actor_id`),
  INDEX `fk_Content_has_Actor_Actor1_idx` (`Actor_id` ASC) VISIBLE,
  INDEX `fk_Content_has_Actor_Content1_idx` (`Content_id` ASC) VISIBLE,
  CONSTRAINT `fk_Content_has_Actor_Content1`
    FOREIGN KEY (`Content_id`)
    REFERENCES `mydb`.`Content` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Content_has_Actor_Actor1`
    FOREIGN KEY (`Actor_id`)
    REFERENCES `mydb`.`Actor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Content_has_Country`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Content_has_Country` (
  `Content_id` INT NOT NULL,
  `Country_id` INT NOT NULL,
  PRIMARY KEY (`Content_id`, `Country_id`),
  INDEX `fk_Content_has_Country_Country1_idx` (`Country_id` ASC) VISIBLE,
  INDEX `fk_Content_has_Country_Content1_idx` (`Content_id` ASC) VISIBLE,
  CONSTRAINT `fk_Content_has_Country_Content1`
    FOREIGN KEY (`Content_id`)
    REFERENCES `mydb`.`Content` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Content_has_Country_Country1`
    FOREIGN KEY (`Country_id`)
    REFERENCES `mydb`.`Country` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
