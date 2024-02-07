-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema videogamestoredb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema videogamestoredb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `videogamestoredb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `videogamestoredb` ;

-- -----------------------------------------------------
-- Table `videogamestoredb`.`impiegato`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `videogamestoredb`.`impiegato` (
  `CodiceFiscale` VARCHAR(16) NOT NULL,
  `Nome` VARCHAR(50) NULL DEFAULT NULL,
  `TitoloStudio` VARCHAR(50) NULL DEFAULT NULL,
  `Recapito` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`CodiceFiscale`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `videogamestoredb`.`store`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `videogamestoredb`.`store` (
  `CodiceStore` INT NOT NULL,
  `IndirizzoFisico` VARCHAR(50) NULL DEFAULT NULL,
  `NumeroTelefono` VARCHAR(15) NULL DEFAULT NULL,
  PRIMARY KEY (`CodiceStore`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `videogamestoredb`.`servizio_impiegato`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `videogamestoredb`.`servizio_impiegato` (
  `IDServizio` INT NOT NULL AUTO_INCREMENT,
  `CodiceFiscale` VARCHAR(16) NULL DEFAULT NULL,
  `CodiceStore` INT NULL DEFAULT NULL,
  `DataInizio` DATE NOT NULL,
  `DataFine` DATE NULL DEFAULT NULL,
  `Carica` VARCHAR(30) NULL DEFAULT NULL,
  PRIMARY KEY (`IDServizio`),
  INDEX `CodiceFiscale` (`CodiceFiscale` ASC) VISIBLE,
  INDEX `CodiceStore` (`CodiceStore` ASC) VISIBLE,
  CONSTRAINT `servizio_impiegato_ibfk_1`
    FOREIGN KEY (`CodiceFiscale`)
    REFERENCES `videogamestoredb`.`impiegato` (`CodiceFiscale`),
  CONSTRAINT `servizio_impiegato_ibfk_2`
    FOREIGN KEY (`CodiceStore`)
    REFERENCES `videogamestoredb`.`store` (`CodiceStore`))
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `videogamestoredb`.`videogioco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `videogamestoredb`.`videogioco` (
  `IDVideogioco` INT NOT NULL AUTO_INCREMENT,
  `Titolo` VARCHAR(50) NULL DEFAULT NULL,
  `Sviluppatore` VARCHAR(30) NULL DEFAULT NULL,
  `AnnoDistribuzione` YEAR NULL DEFAULT NULL,
  `CostoAcquisto` FLOAT NULL DEFAULT NULL,
  `Genere` VARCHAR(30) NULL DEFAULT NULL,
  `RemakeDi` TINYINT NULL DEFAULT NULL,
  PRIMARY KEY (`IDVideogioco`))
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `videogamestoredb`.`videogiochi_venduti`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `videogamestoredb`.`videogiochi_venduti` (
  `IDTransaction` INT NOT NULL,
  `IDVideogioco` INT NULL DEFAULT NULL,
  `CodiceStore` INT NULL DEFAULT NULL,
  `QuantitaVenduta` INT NULL DEFAULT NULL,
  PRIMARY KEY (`IDTransaction`),
  INDEX `IDVideogioco` (`IDVideogioco` ASC) VISIBLE,
  INDEX `CodiceStore` (`CodiceStore` ASC) VISIBLE,
  CONSTRAINT `videogiochi_venduti_ibfk_1`
    FOREIGN KEY (`IDVideogioco`)
    REFERENCES `videogamestoredb`.`videogioco` (`IDVideogioco`),
  CONSTRAINT `videogiochi_venduti_ibfk_2`
    FOREIGN KEY (`CodiceStore`)
    REFERENCES `videogamestoredb`.`store` (`CodiceStore`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
