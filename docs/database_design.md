# Database Design

## Purpose

This document describes the database design by identifying the entities and implememt normalization in the database inturn reducing redundancy

---

## Identified Entities

| Entity | Description |
|----------|-------------|
| Seasons | Stores IPL season information. |
| Teams | Stores IPL franchise details. |
| Players | Stores player information. |
| Venues | Stores stadium information. |
| Matches | Stores match-level information. |
| Deliveries | Stores ball-by-ball match events. |

---

## Design Notes

- One season contains many matches.
- One team plays many matches.
- One player participates in many deliveries.
- One venue hosts many matches.
- One match contains many deliveries.

## Entity Attributes

### 1. Seasons

| Attribute | Source | Description |
|-----------|--------|-------------|
| SeasonID | Generated | Primary key for each IPL season. |
| SeasonYear | season | IPL season year (e.g., 2024). |

---

### 2. Teams

| Attribute | Source | Description |
|-----------|--------|-------------|
| TeamID | Generated | Primary key for each team. |
| TeamName | batting_team / bowling_team | Official team name. |

---

### 3. Players

| Attribute | Source | Description |
|-----------|--------|-------------|
| PlayerID | Generated | Primary key for each player. |
| PlayerName | batter, bowler, non_striker, etc. | Player's full name. |

> **Note:** The CSV contains players in different roles (batter, bowler, non-striker, player_out, etc.). During ETL, these values will be consolidated into a single Players table.

---

### 4. Venues

| Attribute | Source | Description |
|-----------|--------|-------------|
| VenueID | Generated | Primary key for each venue. |
| VenueName | venue | Stadium name. |
| City | city | City where the venue is located. |

---

### 5. Matches

| Attribute | Source | Description |
|-----------|--------|-------------|
| MatchID | match_id | Unique match identifier from source data. |
| SeasonID | Generated | References Seasons table. |
| VenueID | Derived | References Venues table. |
| MatchDate | date | Date of the match. |
| MatchType | match_type | League, Playoff, Final, etc. |
| EventName | event_name | Tournament name. |
| Team1ID | Derived | First participating team. |
| Team2ID | Derived | Second participating team. |
| TossWinnerID | toss_winner | References Teams table. |
| TossDecision | toss_decision | Bat or Field. |
| WinnerTeamID | match_won_by | References Teams table. |
| WinOutcome | win_outcome | Won by runs, wickets, etc. |
| PlayerOfMatchID | player_of_match | References Players table. |
| SuperOverWinnerID | superover_winner | References Teams table (if applicable). |
| ResultType | result_type | Normal, Tie, No Result, etc. |
| Method | method | DLS or other result method. |
| EventMatchNo | event_match_no | Match number within the tournament. |
| Stage | stage | League, Qualifier, Eliminator, Final, etc. |

> **Note:** The CSV contains **day**, **month**, and **year** columns. These will not be stored because they can always be derived from **MatchDate**.

---

### 6. Deliveries

| Attribute | Source | Description |
|-----------|--------|-------------|
| DeliveryID | Generated | Primary key for each delivery. |
| MatchID | match_id | References Matches table. |
| Innings | innings | Innings number. |
| OverNumber | over | Over number. |
| BallInOver | ball | Ball within the over. |
| BallNo | ball_no | Sequential ball number. |
| BatterID | batter | References Players table. |
| BatterPosition | bat_pos | Batting order position. |
| BowlerID | bowler | References Players table. |
| NonStrikerID | non_striker | References Players table. |
| NonStrikerPosition | non_striker_pos | Batting position of non-striker. |
| RunsOffBat | runs_batter | Runs scored by the batter. |
| ValidBall | valid_ball | Indicates legal delivery. |
| ExtraRuns | runs_extras | Extra runs conceded. |
| TotalRuns | runs_total | Total runs from the delivery. |
| RunsConceded | runs_bowler | Runs charged to bowler. |
| RunsNotBoundary | runs_not_boundary | Runs excluding boundaries. |
| ExtraType | extra_type | Wide, No Ball, Bye, Leg Bye, etc. |
| WicketKind | wicket_kind | Type of dismissal. |
| PlayerOutID | player_out | References Players table. |
| Fielders | fielders | Fielder(s) involved in dismissal. |
| RunsTarget | runs_target | Target score at that point. |
| ReviewBatterID | review_batter | References Players table. |
| TeamReviewedID | team_reviewed | References Teams table. |
| ReviewDecision | review_decision | Decision after review. |
| UmpiresCall | umpires_call | Indicates umpire's call. |
| TeamRuns | team_runs | Team score after the delivery. |
| TeamBalls | team_balls | Balls faced by the team. |
| TeamWickets | team_wicket | Wickets lost. |
| NewBatterID | new_batter | References Players table. |
| BatterRuns | batter_runs | Batter's cumulative runs. |
| BallsFaced | balls_faced | Balls faced by batter. |
| BowlerWickets | bowler_wicket | Bowler's cumulative wickets. |
| BattingPartners | batting_partners | Partnership runs. |
| BatterOut | Batter_out | Indicates if Batter was dismissed. |
| NextBatterID | next_batter | References Players table. |

## Primary Keys

The following primary keys uniquely identify each entity within the database.

| Entity | Primary Key | Type | Reason |
|---------|-------------|------|--------|
| Seasons | SeasonID | Surrogate | Generated integer key for efficient joins and referential integrity. |
| Teams | TeamID | Surrogate | Generated integer key to uniquely identify each franchise. |
| Players | PlayerID | Surrogate | Generated integer key because player names are not reliable unique identifiers. |
| Venues | VenueID | Surrogate | Generated integer key to uniquely identify venues. |
| Matches | MatchID | Natural | Existing unique match identifier provided by the source dataset. |
| Deliveries | DeliveryID | Surrogate | Generated integer key because no single unique delivery identifier exists in the source dataset. |

## Foreign Keys

The following foreign keys define relationships between the entities.

| Child Table | Foreign Key | Parent Table | Referenced Column |
|--------------|-------------|--------------|-------------------|
| Matches | SeasonID | Seasons | SeasonID |
| Matches | VenueID | Venues | VenueID |
| Matches | Team1ID | Teams | TeamID |
| Matches | Team2ID | Teams | TeamID |
| Matches | TossWinnerID | Teams | TeamID |
| Matches | WinnerTeamID | Teams | TeamID |
| Matches | SuperOverWinnerID | Teams | TeamID |
| Matches | PlayerOfMatchID | Players | PlayerID |
| Deliveries | MatchID | Matches | MatchID |
| Deliveries | BatterID | Players | PlayerID |
| Deliveries | BowlerID | Players | PlayerID |
| Deliveries | NonStrikerID | Players | PlayerID |
| Deliveries | PlayerOutID | Players | PlayerID |
| Deliveries | ReviewBatterID | Players | PlayerID |
| Deliveries | NewBatterID | Players | PlayerID |
| Deliveries | NextBatterID | Players | PlayerID |
| Deliveries | TeamReviewedID | Teams | TeamID |

### Design Notes

- A Season can contain many Matches.
- A Venue can host many Matches.
- A Team can participate in many Matches.
- A Match contains many Deliveries.
- A Player can participate in many Deliveries in different roles.
- The `Fielders` attribute remains denormalized in Version 1 and may be refactored into a bridge table in a future version.