# IPL Analytics Platform

# Project Architecture

---

# 1. Architecture Overview

The IPL Analytics Platform follows a layered analytics architecture where raw IPL data is transformed into a structured SQL Server database and finally visualized through Power BI dashboards.

The project separates data storage, transformation, business logic, and reporting into independent layers to improve maintainability and scalability.

---

## 2. Architecture Flow

```text
                         IPL Analytics Platform

                         Raw IPL Dataset (CSV)
                                  │
                                  ▼
                             ETL Process
                                  │
                                  ▼
                      SQL Server Database (IPL_Analytics_DB)
                                  │
          ┌───────────────────────┼────────────────────────┐
          │                       │                        │
          ▼                       ▼                        ▼
   Staging Schema         Reference Schema        Analytics Schema
          │                       │                        │
          └───────────────────────┼────────────────────────┘
                                  │
                                  ▼
                     SQL Views & Analytical Queries
                                  │
                                  ▼
                         Power BI Dashboards
                                  │
                                  ▼
                           Business Insights
```

---

# 3. Architecture Layers

## 3.1 Data Layer

Responsible for storing the original IPL dataset.

**data/raw/**


Responsibilities

- Store original CSV files
- Preserve source data
- Maintain a single source of truth

---

## 3.2 Database Layer

SQL Server stores the normalized IPL database.

### Schemas

| Schema | Purpose |
|---------|----------|
| staging | Temporary imported data |
| reference | Lookup and master data |
| analytics | Final analytical tables |

Responsibilities

- Store normalized data
- Maintain relationships
- Support efficient querying

---

## 3.3 Business Logic Layer

SQL queries perform all calculations required for analytics.

Responsibilities

- Player statistics
- Team statistics
- Match analysis
- Venue analysis
- Season analysis
- KPI calculations

Artifacts

- SQL Scripts
- Views
- Stored Procedures (planned)

---

## 3.4 Reporting Layer

Power BI connects to SQL Server and presents interactive dashboards.

Responsibilities

- KPI visualization
- Interactive filtering
- Drill-down analysis
- Business reporting

---

# 4. Project Folder Organization

```text
IPL-Analytics-Platform
│
├── app/
│
├── data/
│   ├── raw/
│   └── processed/
│
├── database/
│   ├── backups/
│   ├── schema/
│   └── scripts/
│
├── docs/
│
├── powerbi/
│
├── screenshots/
│
├── .gitignore
│
└── README.md
```


---

# 5. Data Flow

1. Raw IPL CSV files are stored in the **data/raw** folder.
2. Data is imported into the **staging** schema.
3. Reference data is extracted into the **reference** schema.
4. Analytical tables are populated in the **analytics** schema.
5. SQL queries calculate KPIs and business metrics.
6. Power BI retrieves data from SQL Server.
7. Dashboards present insights to end users.

---

# 6. Technology Stack

| Layer | Technology |
|---------|------------|
| Source Data | CSV |
| Database | SQL Server 2019 Developer |
| Query Language | T-SQL |
| Documentation | Markdown |
| Version Control | Git & GitHub |
| IDE | Visual Studio Code |
| Database IDE | SQL Server Management Studio |
| Reporting | Power BI |

---

# 7. Future Enhancements

Potential future improvements include:

- Automated ETL pipeline
- Python data ingestion
- SQL Server Integration Services (SSIS)
- Azure Data Factory integration
- Cloud deployment

