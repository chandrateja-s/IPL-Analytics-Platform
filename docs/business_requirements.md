# IPL Analytics Platform

## Business Requirements

---

## 1. Project Objective

The IPL Analytics Platform is designed to transform historical IPL ball-by-ball data into meaningful business insights. The platform enables users to analyze player performance, team performance, match statistics, venue trends, and season-wise comparisons through structured SQL analysis and interactive Power BI dashboards.

The primary objective is to build an end-to-end analytics solution that demonstrates my data engineering, database design, SQL development, and business intelligence skills.

---

## 2. Target Users

The platform is intended for multiple types of users including:

- Cricket analysts
- Franchise owners and management
- Team coaches
- Talent scouts
- Sports journalists
- IPL fans
- Data analysts learning SQL and Power BI

---

## 3. Business Requirements

The platform should enable users to:

### Match Analysis

- Analyze match outcomes.
- Compare performances across different seasons.
- Analyze toss decisions and their impact on match results.


### Team Analysis

- Compare team performances.
- Calculate win percentages.
- Analyze home and away performances.
- Evaluate performance against specific opponents.

### Player Analysis

- Analyze batting statistics.
- Analyze bowling statistics.
- Compare players across seasons.
- Analyze player performance against specific teams and venues.

### Venue Analysis

- Compare venue statistics.
- Analyze average first innings and second innings scores.
- Compare venue win percentages while batting first and chasing.

---

## 4. Business Questions

The analytics platform should answer questions such as:

### Team Performance

- Which team has won the most IPL matches?
- Which team has the highest winning percentage?
- Which team performs best while chasing?
- Which team performs best while defending a total?
- Which team has the highest average score?
- Which team has the best playoff record?

### Player Performance

- Who has scored the most IPL runs?
- Who has taken the most wickets?
- Who has the highest batting strike rate?
- Who has the best bowling economy?
- Which player has won the most Player of the Match awards?

### Match Analysis

- What is the highest successful run chase?
- What is the lowest successfully defended total?
- Which matches went to a Super Over?

### Venue Analysis

- Which stadium has hosted the most matches?
- Which venue has the highest average score?
- Which venue favors batting teams?
- Which venue favors bowlers?

### Season Analysis

- Which IPL season produced the most runs?
- Which season had the highest scoring rate?
- Which season recorded the most wickets?

---

## 5. Expected Deliverables

The project will deliver:

- A normalized SQL Server database.
- ETL scripts for loading IPL data.
- SQL queries for analytical reporting.
- Stored procedures and views.
- Power BI dashboards.
- Complete project documentation.
- GitHub portfolio showcasing the complete analytics solution.

---

## 6. Success Criteria

The project will be considered successful when it:

- Successfully stores historical IPL data in a normalized SQL Server database.
- Supports efficient analytical SQL queries.
- Answers the defined business questions accurately.
- Provides interactive Power BI dashboards.
- Demonstrates real-world data analytics and business intelligence practices.

---

# 7. Key Performance Indicators (KPIs)

The following KPIs will be used to evaluate player, team, match, and venue performance.

---

## Team KPIs

| KPI | Description |
|------|-------------|
| Matches Played | Total matches played by a team. |
| Matches Won | Total matches won. |
| Win Percentage | Percentage of matches won. |
| Average Team Score | Average runs scored per innings. |
| Highest Team Score | Highest innings total. |
| Lowest Defended Score | Lowest successfully defended total. |
| Highest Successful Chase | Highest target successfully chased. |

---

## Batting KPIs

| KPI | Description |
|------|-------------|
| Runs Scored | Total career runs. |
| Balls Faced | Total balls faced. |
| Batting Average | Runs scored per dismissal. |
| Strike Rate | Runs scored per 100 balls. |
| Fours | Total boundaries (4s). |
| Sixes | Total boundaries (6s). |
| Highest Score | Highest individual score. |

---

## Bowling KPIs

| KPI | Description |
|------|-------------|
| Wickets | Total wickets taken. |
| Overs Bowled | Total overs bowled. |
| Runs Conceded | Total runs conceded. |
| Economy Rate | Runs conceded per over. |
| Bowling Average | Runs conceded per wicket. |

---

## Match KPIs

| KPI | Description |
|------|-------------|
| Toss Win Percentage | Percentage of tosses won. |
| Chase Success Rate | Percentage of successful run chases. |
| Defend Success Rate | Percentage of Successful denfended matches. |
| Super Over Matches | Total matches decided by Super Over. |

---

## Venue KPIs

| KPI | Description |
|------|-------------|
| Matches Hosted | Total matches hosted. |
| Average First Innings Score | Average first innings total. |
| Average Second Innings Score | Average second innings total. |
| Bat First Win Percentage | Win percentage when batting first. |
| Chase Win Percentage | Win percentage when chasing. |

---

## KPI Usage

These KPIs will be calculated using SQL queries and presented through interactive Power BI dashboards to answer the business questions defined in this document.