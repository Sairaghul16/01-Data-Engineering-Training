-- 1. CREATE DATABASE
CREATE DATABASE banking_db;
USE banking_db;


-- 2. CREATE ACCOUNTS TABLE
CREATE TABLE accounts (
    account_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    account_type VARCHAR(30),
    balance DECIMAL(10,2),
    city VARCHAR(50)
);


-- 3. INSERT SAMPLE DATA
INSERT INTO accounts VALUES
(101, 'Arun Kumar', 'Savings', 45000, 'Hyderabad'),
(102, 'Meera Shah', 'Current', 85000, 'Mumbai'),
(103, 'Ravi Reddy', 'Savings', 32000, 'Hyderabad'),
(104, 'Priya Nair', 'Savings', 67000, 'Bangalore'),
(105, 'Sameer Khan', 'Current', 120000, 'Pune'),
(106, 'Neha Gupta', 'Savings', 28000, 'Delhi'),
(107, 'Vikram Rao', 'Current', 95000, 'Hyderabad'),
(108, 'Anjali Singh', 'Savings', 54000, 'Mumbai');


-- 4. VIEW ACCOUNT DATA
SELECT *
FROM accounts;


# 5. GetAllAccounts
DELIMITER //

CREATE PROCEDURE GetAllAccounts()
BEGIN
    SELECT * FROM accounts;
END //

DELIMITER ;

CALL GetAllAccounts();

# 6.GetSavingsAccounts

DELIMITER //

CREATE PROCEDURE GetSavingsAccounts()
BEGIN
    SELECT * FROM accounts
    WHERE account_type = 'Savings';
END //

DELIMITER ;

CALL GetSavingsAccounts();

#7.GetAccountsByCity
DELIMITER //

CREATE PROCEDURE GetAccountsByCity(IN city_name VARCHAR(50))
BEGIN
    SELECT * FROM accounts
    WHERE city = city_name;
END //

DELIMITER ;

CALL GetAccountsByCity('Hyderabad');

#8.GetAccountsAboveBalance
DELIMITER //

CREATE PROCEDURE GetAccountsAboveBalance(IN amount DECIMAL(10,2))
BEGIN
    SELECT * FROM accounts
    WHERE balance > amount;
END //

DELIMITER ;

CALL GetAccountsAboveBalance(50000);

#9.Create a procedure named UpdateAccountBalance that accepts: Account ID New Balance The procedure should update the balance of that account.

  DELIMITER //

CREATE PROCEDURE UpdateAccountBalance(
    IN acc_id INT,
    IN new_balance DECIMAL(10,2)
)
BEGIN
    UPDATE accounts
    SET balance = new_balance
    WHERE account_id = acc_id;
END //

DELIMITER ;

CALL UpdateAccountBalance(101, 60000);

#10.Create a procedure named DepositAmount that accepts: Account ID Deposit Amount The amount should be added to the existing balance, not replace it.

DELIMITER //

CREATE PROCEDURE DepositAmount(
    IN acc_id INT,
    IN deposit_amount DECIMAL(10,2)
)
BEGIN
    UPDATE accounts
    SET balance = balance + deposit_amount
    WHERE account_id = acc_id;
END //

DELIMITER ;

CALL DepositAmount(101, 5000);


#11.. Create a procedure named DeleteAccount that accepts an Account ID and deletes that account.

DELIMITER //

CREATE PROCEDURE DeleteAccount(
    IN acc_id INT
)
BEGIN
    DELETE FROM accounts
    WHERE account_id = acc_id;
END //

DELIMITER ;

CALL DeleteAccount(101);
