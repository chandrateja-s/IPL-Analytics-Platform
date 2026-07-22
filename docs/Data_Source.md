# Data Source Documentation

## Project

**IPL Analytics Platform**

---

# Dataset Overview

This project uses a ball-by-ball dataset containing detailed information for every delivery bowled in Indian Premier League (IPL) matches from **2007 to 2026**.

---

# Dataset Source

**Source:**
 - Kaggle - https://www.kaggle.com/datasets/tankharsh07/ipl-complete-match-dataset-20082026?select=IPL_data_ball_by_ball%28Original%29.csv

**Download Date:**
22 July 2026

---

# Dataset Information

| Property | Value |
|----------|-------|
| Dataset Name | IPL Ball-by-Ball Dataset |
| File Name | ipl_ball_by_ball_2007_to_2026.csv |
| File Format | CSV |
| Seasons Covered | 2007 – 2026 |
| Competition | Indian Premier League (IPL) |
| Total Rows | 295,733 |
| Total Columns | 64 |

---

# Data Granularity

Each row in the dataset represents **one delivery (ball)** bowled during an IPL match.

The dataset includes information related to:

- Match details
- Delivery Details
- Batting team
- Bowling team
- Batter
- Bowler
- Non-striker
- Runs scored
- Extras
- Wickets
- Fielders
- Player dismissals
- Innings information
- Match venue and season details

---

# Purpose of the Dataset

The dataset will be used to:

- Design a normalized SQL Server database.
- Build an ETL pipeline for data cleaning and transformation.
- Perform SQL-based statistical analysis.
- Develop Power BI dashboards.
- Build a locally hosted IPL Analytics application.
- Demonstrate SQL, Python, Power BI, SSIS, Azure Data Factory, and software development skills through a real-world analytics project.

---

# Data Quality Verification

The following validation checks were performed during project setup.

| Check | Status |
|--------|--------|
| Dataset successfully opened | ✅ Completed |
| File format verified | ✅ CSV |
| Total rows verified | ✅ 286,000 |
| Total columns verified | ✅ 65 |
| Seasons verified | ✅ 2007–2026 |
| Mandatory fields reviewed | ✅ Completed |
| Dataset organized in project folder | ✅ Completed |

---

# Project Folder Location

The original dataset is stored in:

- D:\Case studies\IPL Analytics Platform\data\raw

The original dataset will remain **unchanged** throughout the project.

Any cleaned or transformed versions of the dataset will be stored in:

- D:\Case studies\IPL Analytics Platform\data\processed

---

# Future Processing

The dataset will undergo the following stages during the project:

1. Data Profiling
2. Data Cleaning
3. Missing Value Analysis
4. Duplicate Detection
5. SQL Server Data Import
6. Database Normalization
7. SQL Analytics
8. Power BI Dashboard Development
9. Python Data Analysis
10. Application Development

---

# Version History

| Version | Date | Description |
|----------|------------|-------------|
| 1.0 | 22 July 2026 | Initial dataset documentation created. |