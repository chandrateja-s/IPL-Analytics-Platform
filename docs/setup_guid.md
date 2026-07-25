# IPL Analytics Platform

# Setup Guide

This guide explains how to set up the IPL Analytics Platform development environment.

---

# 1. Prerequisites

Before running this project, install the following software.

| Software | Version |
|-----------|---------|
| SQL Server Developer Edition | SQL Server 2019 Developer |
| SQL Server Management Studio (SSMS) | Latest |
| Visual Studio Code | Latest |
| Git | Latest |
| Power BI Desktop | Latest |
| Python | 3.11 or later (future ETL development) |

---

# 2. Clone the Repository

- Clone the GitHub repository.

- Move into the project directory.


---

# 3. Project Folder Structure

```
IPL-Analytics-Platform
│
├── app/
├── data/
│   ├── raw/
│   └── processed/
├── database/
│   ├── schema/
│   ├── scripts/
│   └── backups/
├── docs/
├── powerbi/
├── screenshots/
├── README.md
└── .gitignore
```

---

# 4. SQL Server Setup

Open SQL Server Management Studio and connect to your local SQL Server instance.

 - Create the project database.

 - Create the required schemas.

 - Verify the database has been created successfully.

---

# 5. Dataset

The original IPL dataset is **not included** in this repository because it exceeds GitHub's file size limit.

Create the following directory if it does not already exist.

```
data/raw/
```

Place the original IPL CSV dataset inside this folder.

---

# 6. Verify Installation

Confirm the following:

- SQL Server is running.
- SSMS can connect successfully.
- IPL_Analytics_DB exists.
- The three schemas have been created.
- The project folder structure is available.
- Git repository is cloned successfully.

---

The development environment is now ready for use.