-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema contact_manager
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema contact_manager
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `contact_manager` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `contact_manager` ;

-- -----------------------------------------------------
-- Table `contact_manager`.`company`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `contact_manager`.`company` (
  `CompanyID` INT NOT NULL,
  `CompanyName` VARCHAR(45) NULL DEFAULT NULL,
  `Street` VARCHAR(45) NULL DEFAULT NULL,
  `City` VARCHAR(45) NULL DEFAULT NULL,
  `State` VARCHAR(45) NULL DEFAULT NULL,
  `Zip` VARCHAR(10) NULL DEFAULT NULL,
  PRIMARY KEY (`CompanyID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `contact_manager`.`contact`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `contact_manager`.`contact` (
  `contactID` INT NOT NULL,
  `CompanyID` INT NULL DEFAULT NULL,
  `FirstName` VARCHAR(45) NULL DEFAULT NULL,
  `LastName` VARCHAR(45) NULL DEFAULT NULL,
  `Street` VARCHAR(45) NULL DEFAULT NULL,
  `City` VARCHAR(45) NULL DEFAULT NULL,
  `State` VARCHAR(45) NULL DEFAULT NULL,
  `Zip` VARCHAR(10) NULL DEFAULT NULL,
  `IsMain` TINYINT(1) NULL DEFAULT NULL,
  `Email` VARCHAR(45) NULL DEFAULT NULL,
  `Phone` VARCHAR(45) NULL DEFAULT NULL,
  `company_CompanyID` INT NOT NULL,
  PRIMARY KEY (`contactID`),
  INDEX `fk_contact_company1_idx` (`company_CompanyID` ASC) VISIBLE,
  CONSTRAINT `fk_contact_company1`
    FOREIGN KEY (`company_CompanyID`)
    REFERENCES `contact_manager`.`company` (`CompanyID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `contact_manager`.`employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `contact_manager`.`employee` (
  `EmployeeID` INT NOT NULL,
  `FirstName` VARCHAR(45) NULL DEFAULT NULL,
  `LastName` VARCHAR(45) NULL DEFAULT NULL,
  `Salary` DECIMAL(10,2) NULL DEFAULT NULL,
  `HireDate` DATE NULL DEFAULT NULL,
  `JobTitle` VARCHAR(45) NULL DEFAULT NULL,
  `Email` VARCHAR(45) NULL DEFAULT NULL,
  `Phone` VARCHAR(12) NULL DEFAULT NULL,
  PRIMARY KEY (`EmployeeID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `contact_manager`.`contactemployee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `contact_manager`.`contactemployee` (
  `ContactEmployeeID` INT NOT NULL,
  `ContactID` INT NULL DEFAULT NULL,
  `EmployeeID` INT NULL DEFAULT NULL,
  `ContactDate` DATE NULL DEFAULT NULL,
  `Descriptions` VARCHAR(100) NULL DEFAULT NULL,
  `employee_EmployeeID` INT NOT NULL,
  `contact_contactID` INT NOT NULL,
  PRIMARY KEY (`ContactEmployeeID`),
  INDEX `fk_contactemployee_employee_idx` (`employee_EmployeeID` ASC) VISIBLE,
  INDEX `fk_contactemployee_contact1_idx` (`contact_contactID` ASC) VISIBLE,
  CONSTRAINT `fk_contactemployee_employee`
    FOREIGN KEY (`employee_EmployeeID`)
    REFERENCES `contact_manager`.`employee` (`EmployeeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_contactemployee_contact1`
    FOREIGN KEY (`contact_contactID`)
    REFERENCES `contact_manager`.`contact` (`contactID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
