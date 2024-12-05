CREATE DATABASE project_db;
USE project_db;


USE project_db;

CREATE TABLE premium_gas_prices_canada (
    id INT AUTO_INCREMENT PRIMARY KEY,
    region VARCHAR(255),
    month VARCHAR(50),
    price FLOAT
);

USE project_db;

CREATE TABLE regular_gas_prices_canada (
    id INT AUTO_INCREMENT PRIMARY KEY,
    region VARCHAR(255),
    month VARCHAR(50),
    price FLOAT
);

SHOW DATABASES;

SHOW TABLES FROM project_db;


USE project_db;

CREATE TABLE diesel_prices_canada (
    id INT AUTO_INCREMENT PRIMARY KEY,
    region VARCHAR(255),  
    month VARCHAR(50),    
    price FLOAT           
);


