/*
    Project : IPL Analytics Platform
    File    : Create_Database.sql
    Purpose : Creates the project database and required schemas
*/

-- Create database if it doesn't already exist
IF DB_ID('IPL_Analytics_DB') IS NULL
BEGIN
    CREATE DATABASE IPL_Analytics_DB;
END
GO

-- Switch to the database
USE IPL_Analytics_DB;
GO

-- Create staging schema
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'staging')
BEGIN
    EXEC('CREATE SCHEMA staging');
END
GO

-- Create analytics schema
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'analytics')
BEGIN
    EXEC('CREATE SCHEMA analytics');
END
GO

-- Create reference schema
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'reference')
BEGIN
    EXEC('CREATE SCHEMA reference');
END
GO