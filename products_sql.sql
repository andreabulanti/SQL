-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema epicode_products
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema epicode_products
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `epicode_products` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `epicode_products` ;

-- -----------------------------------------------------
-- Table `epicode_products`.`clienti`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `epicode_products`.`clienti` (
  `IDCliente` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(50) NULL DEFAULT NULL,
  `Email` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`IDCliente`))
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `epicode_products`.`ordini_m`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `epicode_products`.`ordini_m` (
  `IDOrdine` INT NOT NULL AUTO_INCREMENT,
  `NomeOrdine` CHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`IDOrdine`))
ENGINE = InnoDB
AUTO_INCREMENT = 12
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `epicode_products`.`prodotti`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `epicode_products`.`prodotti` (
  `IDProdotto` INT NOT NULL AUTO_INCREMENT,
  `NomeProdotto` VARCHAR(100) NULL DEFAULT NULL,
  `Prezzo` DOUBLE NULL DEFAULT NULL,
  PRIMARY KEY (`IDProdotto`))
ENGINE = InnoDB
AUTO_INCREMENT = 14
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `epicode_products`.`ordini_d`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `epicode_products`.`ordini_d` (
  `IDOrdine` INT NOT NULL,
  `IDCliente` INT NOT NULL,
  `IDProdotto` INT NOT NULL,
  `Quantita` INT NULL DEFAULT NULL,
  PRIMARY KEY (`IDOrdine`, `IDCliente`, `IDProdotto`),
  INDEX `IDCliente` (`IDCliente` ASC) VISIBLE,
  INDEX `IDProdotto` (`IDProdotto` ASC) VISIBLE,
  CONSTRAINT `ordini_d_ibfk_1`
    FOREIGN KEY (`IDOrdine`)
    REFERENCES `epicode_products`.`ordini_m` (`IDOrdine`),
  CONSTRAINT `ordini_d_ibfk_2`
    FOREIGN KEY (`IDCliente`)
    REFERENCES `epicode_products`.`clienti` (`IDCliente`),
  CONSTRAINT `ordini_d_ibfk_3`
    FOREIGN KEY (`IDProdotto`)
    REFERENCES `epicode_products`.`prodotti` (`IDProdotto`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
