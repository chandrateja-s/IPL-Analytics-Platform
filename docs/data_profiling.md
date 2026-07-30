# 1. Dataset Overview

## Source

The project uses a historical IPL ball-by-ball dataset covering IPL matches from 2007 to 2026.

---

## Dataset Characteristics

| Property | Value |
|----------|-------|
| File Format | CSV |
| Granularity | Ball-by-ball |
| Seasons Covered | 2007–2026 |
| Total Columns | 64 |
| Approximate Rows | 295,000 |
| Primary Business Entity | Delivery (Ball) |

---

## Column Categories

The dataset contains information related to:

- Match information
- Team information
- Player information
- Ball-by-ball events
- Batting statistics
- Bowling statistics
- Wickets
- Reviews (DRS)
- Match results
- Venue information
- Tournament information

---

## Initial Observations

- One row represents one delivery.
- Match-level information is repeated for every delivery.
- Team and player names are stored as text values.
- The dataset contains both transactional and summary attributes.
- Several lookup entities (Teams, Players, Venues, Seasons) can be normalized into separate tables.