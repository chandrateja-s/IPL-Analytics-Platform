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