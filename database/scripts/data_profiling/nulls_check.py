import pandas as pd

df = pd.read_csv("data/raw/IPL_data_ball_by_ball_2007_to_2026.csv")

null_counts = df.isna().sum()

print(null_counts[null_counts > 0].sort_values(ascending=False))