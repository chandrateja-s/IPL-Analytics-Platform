# IPL Analytics Platform

## Project Overview
An IPL Analytics Platform built using SQL Server, Python, Power BI, and Git.

## Objectives
- Analyze IPL ball-by-ball data
- Build a normalized SQL Server database
- Perform exploratory data analysis
- Develop interactive Power BI dashboards
- Create SQL queries to answer business questions

## Tech Stack
- SQL Server
- Python
- Power BI
- Git
- GitHub

## Project Structure

```
IPL Analytics Platform
│
├── app/                 # Python source code
├── data/
│   ├── raw/             # Original datasets
│   └── processed/       # Cleaned datasets
├── database/
│   ├── schema/          # Database schema
│   ├── scripts/         # SQL queries
│   └── backups/         # Database backups
├── docs/                # Project documentation
├── powerbi/             # PowerBI files
├── screenshots/         # Images for documentation
├── README.md
└── .gitignore
```

## Database Setup

### Database
The project uses Microsoft SQL Server 2022 as the primary relational database.

**Database Name**
```
IPL_Analytics_DB
```

### Schemas

The database is organized into multiple schemas to separate different stages of data processing.

| Schema | Purpose |
|---------|---------|
| staging | Stores raw imported data before cleaning |
| analytics | Stores cleaned and transformed tables for reporting |
| reference | Stores lookup and reference tables |

### SQL Server Version

- Microsoft SQL Server 2022
- SQL Server Management Studio 2022(SSMS)

### Database Verification

The database connection was successfully tested using SSMS.

Future database objects (tables, views, stored procedures, and functions) will be created inside these schemas.

## Status

``` 
Under Development 

```
