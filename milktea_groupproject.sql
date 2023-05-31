




/*create table for milktea shop*/

CREATE TABLE IF NOT EXISTS `mydb`.`Store` (
  `StoreID` INT NOT NULL,
  PRIMARY KEY (`StoreID`))
ENGINE = InnoDB




/*create table employee*/ 

CREATE TABLE IF NOT EXISTS `mydb`.`Employee` (
  `EmployeeID` INT NOT NULL,
  `FirstName` VARCHAR(25) NOT NULL,
  `LastName` VARCHAR(25) NOT NULL,
  `Store_StoreID` INT NOT NULL,
  PRIMARY KEY (`EmployeeID`, `Store_StoreID`),
  UNIQUE INDEX `Store_StoreID_UNIQUE` (`Store_StoreID` ASC) VISIBLE,
  CONSTRAINT `Store_StoreID`
    FOREIGN KEY ()
    REFERENCES `mydb`.`Store` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB



/*create table for customers making orders*/

CREATE TABLE IF NOT EXISTS `mydb`.`Order` (
  `OrderNumber` INT NOT NULL,
  `Customer_CustomerID` INT NULL,
  PRIMARY KEY (`OrderNumber`, `Customer_CustomerID`),
  UNIQUE INDEX `Customer_CustomerID_UNIQUE` (`Customer_CustomerID` ASC) VISIBLE,
  CONSTRAINT `Customer_CustomerID`
    FOREIGN KEY ()
    REFERENCES `mydb`.`Customer` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Customer_CustomerID`
    FOREIGN KEY ()
    REFERENCES `mydb`.`Employee` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB



/*create table for customer name and information*/

CREATE TABLE IF NOT EXISTS `mydb`.`Customer` (
  `CustomerID` INT NOT NULL,
  `Cust_Firstname` VARCHAR(25) NULL,
  `Cust_Lastname` VARCHAR(25) NULL,
  `Cust_Telephone` VARCHAR(15) NULL,
  PRIMARY KEY (`CustomerID`))
ENGINE = InnoDB





/*create table for order containing menu items*/

CREATE TABLE IF NOT EXISTS `mydb`.`Order has Item` (
  `MenuItem_ItemType` INT NOT NULL,
  `Order_OrderNumber` INT NOT NULL,
  PRIMARY KEY (`MenuItem_ItemType`, `Order_OrderNumber`),
  CONSTRAINT `MenuItem_ItemType`
    FOREIGN KEY ()
    REFERENCES `mydb`.`Item` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Order_OrderNumber`
    FOREIGN KEY ()
    REFERENCES `mydb`.`Order` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB






/*create table for item*/

CREATE TABLE IF NOT EXISTS `mydb`.`Item` (
  `ItemID` INT NOT NULL,
  `ItemName` VARCHAR(25) NULL,
  `Store_StoreID` INT NOT NULL,
  PRIMARY KEY (`ItemID`, `Store_StoreID`),
  UNIQUE INDEX `Store_StoreID_UNIQUE` (`Store_StoreID` ASC) VISIBLE,
  CONSTRAINT `Store_StoreID`
    FOREIGN KEY ()
    REFERENCES `mydb`.`Store` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB







