import pandas as pd

df = pd.read_csv("data/raw/IPL_data_ball_by_ball_2007_to_2026.csv")

duplicate_deliveries = df.duplicated(
    subset=["match_id", "innings", "over", "ball"]
)

print("Duplicate Deliveries:", duplicate_deliveries.sum())

print("Exact duplicate rows:", df.duplicated().sum())