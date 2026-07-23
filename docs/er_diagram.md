# IPL Analytics Platform

# Entity Relationship Diagram

```text
                    +----------------+
                    |    Seasons     |
                    +----------------+
                    | PK SeasonID    |
                    | SeasonYear     |
                    +----------------+
                           |
                           | 1
                           |
                           | M                      
                    +----------------+
                    |    Matches     |
                    +----------------+
                    | PK MatchID     |
                    | FK SeasonID    |              +---------------+  
                    | FK VenueID     |              |  Deliveries   |             
                    | FK Team1ID     | 1          M +---------------+
                    | FK Team2ID     |--------------| PK DeliveryID |
                    | ...            |            / | FK MatchID    |
                    +----------------+           /  | FK BatterID   |
                  M /      M |     M \          /   | FK BowlerID   |
                   /         |        \        / M  | ...           |
                  /          |         \      /     +---------------+
                 /           |          \    /
                /            |           \  /
             1 /           1 |          1 \/ 1
      +---------+     +------------+   +-----------+
      | Teams   |     | Venues     |   | Players   |
      +---------+     +------------+   +-----------+
      |PK TeamID|     |PK VenueID  |   |PK PlayerID|
      |TeamName |     |VenueName   |   |PlayerName |
      +---------+     +------------+   +-----------+

                    
```