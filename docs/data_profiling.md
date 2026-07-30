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

---

# 2. Data Dictionary

The following table documents each column in the source dataset along with its expected SQL Server data type and purpose.

| Column | Suggested SQL Server Data Type | Nullable | Description |
|---------|-------------------------------|----------|-------------|
| match_id | INT | No | Unique match identifier |
| date | DATE | No | Match date |
| match_type | VARCHAR(30) | No | Match type |
| event_name | VARCHAR(30) | No | Tournament name |
| innings | TINYINT | No | Innings number |
| batting_team | VARCHAR(50) | No | Batting team |
| bowling_team | VARCHAR(50) | No | Bowling team |
| over | TINYINT | No | Over number |
| ball | TINYINT | No | Ball within over |
| ball_no | DECIMAl(4,1)| No | Sequential ball number |
| batter | NVARCHAR(50) | No | Batter name |
| bat_pos | TINYINT | Yes | Batting position |
| runs_batter | TINYINT | Yes | Runs scored from bat |
| balls_faced | SMALLINT | Yes | Balls faced |
| bowler | NVARCHAR(50) | No | Bowler name |
| valid_ball | BIT | No | Legal delivery indicator |
| runs_extras | TINYINT | Yes | Extra runs |
| runs_total | TINYINT | No | Total runs |
| runs_bowler | TINYINT | No | Runs charged to bowler |
| runs_not_boundary | BIT | Yes | Non-boundary runs |
| extra_type | VARCHAR(20) | Yes | Wide, No Ball, Bye, etc. |
| non_striker | NVARCHAR(50) | No | Non-striker |
| non_striker_pos | TINYINT | No | Non-striker position |
| wicket_kind | VARCHAR(40) | Yes | Dismissal type |
| player_out | NVARCHAR(50) | Yes | Dismissed player |
| fielders | NVARCHAR(255) | Yes | Fielders involved |
| runs_target | SMALLINT | Yes | Target score |
| review_batter | NVARCHAR(50) | Yes | Batter reviewed |
| team_reviewed | VARCHAR(50) | Yes | Team requesting review |
| review_decision | VARCHAR(30) | Yes | Review outcome |
| umpire | NVARCHAR(50) | Yes | Third umpire |
| umpires_call | BIT | Yes | Umpire's call indicator |
| player_of_match | NVARCHAR(50) | Yes | Player of the Match |
| match_won_by | NVARCHAR(50) | Yes | Winning team |
| win_outcome | VARCHAR(30) | Yes | Runs or wickets |
| toss_winner | VARCHAR(50) | No | Toss winner |
| toss_decision | VARCHAR(10) | No | Bat or Field |
| venue | NVARCHAR(100) | No | Stadium |
| city | NVARCHAR(50) | No | City |
| day | TINYINT | No | Day |
| month | TINYINT | No | Month |
| year | SMALLINT | No | Year |
| season | VARCHAR(20) | No | IPL season |
| gender | VARCHAR(10) | No | Gender |
| team_type | VARCHAR(20) | No | Team category |
| superover_winner | VARCHAR(50) | Yes | Super Over winner |
| result_type | VARCHAR(30) | No | Match result type |
| method | VARCHAR(20) | No | DLS or other method |
| balls_per_over | TINYINT | No | Balls per over |
| overs | TINYINT | No | Scheduled overs |
| event_match_no | SMALLINT | Yes | Match number within tournament |
| stage | VARCHAR(30) | No | League, Final, etc. |
| match_number | SMALLINT | No | Alternate match number |
| team_runs | SMALLINT | Yes | Team score |
| team_balls | SMALLINT | Yes | Balls faced by team |
| team_wicket | TINYINT | Yes | Team wickets |
| new_batter | NVARCHAR(50) | Yes | Incoming batter |
| power_surge_start | BIT | Yes | Power Surge indicator |
| batter_runs | SMALLINT | Yes | Batter cumulative runs |
| batter_balls | SMALLINT | Yes | Batter cumulative balls |
| bowler_wicket | TINYINT | Yes | Bowler cumulative wickets |
| batting_partners | NVARCHAR(100) | Yes | Partners Names|
| striker_out | BIT | Yes | Whether striker got out |
| next_batter | NVARCHAR(50) | Yes | Next batter |

## Design Notes

- Text where `NVARCHAR` are used instead of `VARCHAR` are intentionally to support unicode characters of Plyaer names and any possible future venues.
- Numeric identifiers such as `match_id` are preserved from the source dataset.
- Boolean-like fields are mapped to `BIT` where appropriate.
- Nullable columns reflect fields that are not applicable for every delivery (e.g., wickets, reviews, Super Overs).

---

# 3. Missing and Null Value Analysis

The source dataset was analyzed to identify columns containing missing or null values.

- Initial inspection reveals that missing values occur in optional event-specific columns such as wickets, reviews.
- These values are expected does not reflect the quality of data.

## Missing Value Summary

| Column | Missing Values | Approx. % | Expected? | Reason |
|---------|---------------:|----------:|-----------|--------|
| power_surge_start | 295,732 | 99.9% | Yes | Power Surge was introduced only in selected tournaments. |
| umpire | 294,742 | 99.6% | Yes | Third umpire information exists only for DRS reviews. |
| review_decision | 294,742 | 99.6% | Yes | Populated only when a review occurs. |
| team_reviewed | 294,742 | 99.6% | Yes | Populated only when a review occurs. |
| review_batter | 294,742 | 99.6% | Yes | Populated only when a review occurs. |
| method | 291,601 | 98.5% | Yes | Only used for DLS or other special result methods. |
| superover_winner | 291,580 | 98.5% | Yes | Populated only for Super Over matches. |
| result_type | 290,752 | 98.3% | Yes | Only populated for special match results (Tie, No Result, etc.). |
| fielders | 285,011 | 96.3% | Yes | Only populated when fielders participate in a dismissal. |
| next_batter | 281,569 | 95.2% | Yes | Populated only after a wicket falls. |
| new_batter | 281,569 | 95.2% | Yes | Populated only after a wicket falls. |
| player_out | 281,027 | 95.0% | Yes | Populated only when a dismissal occurs. |
| wicket_kind | 281,027 | 95.0% | Yes | Only populated for wicket deliveries. |
| extra_type | 279,505 | 94.5% | Yes | Only populated when an extra is awarded. |
| runs_target | 153,429 | 51.8% | Yes | Only applicable during the second innings while chasing. |
| win_outcome | 4,980 | 1.7% | Yes | Missing for tied, abandoned, or no-result matches. |
---

# 4. Duplicate Record Analysis

Two validation checks were performed on the source dataset.

## Validation Results

| Validation | Result |
|------------|--------|
| Exact duplicate rows | 0 |
| Duplicate records based on (`match_id`, `innings`, `over`, `ball`) | 11,075 |

---

## Findings

- No exact duplicate records were found in the dataset.
- Multiple records share the same combination of `match_id`, `innings`, `over`, and `ball`.
 
 ---

 # 5. Profiling Statistics

| Metric | Result |
|---------|--------|
| Source File | IPL Ball-by-Ball CSV |
| Total Columns | 64 |
| Approximate Rows | 296,000 |
| Exact Duplicate Rows | 0 |
| Columns with Missing Values | 15 |
| Primary Business Entity | Delivery (Ball Event) |
| Overall Data Quality | High |

