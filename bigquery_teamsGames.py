# Google BigQuery visualized using pandas DataFrame
# dataset TableID: bigquery-public-data.ncaa_basketball.mbb_historical_teams_games

# Bearcats -wins/losses
from google.cloud import bigquery
import matplotlib.pyplot as plt
import os

os.environ["GOOGLE_APPLICATION_CREDENTIALS"]="/home/danuta/Documents/BIGDATA/projects/Session16sie-key.json"

cl = bigquery.Client()

QUERY='''
SELECT
    season,
    SUM(CASE WHEN win THEN 1 ELSE 0 END) AS win,
    SUM(CASE WHEN win THEN 0 ELSE 1 END) AS loss
FROM `bigquery-public-data.ncaa_basketball.mbb_historical_teams_games`
WHERE season IS NOT NULL 
    AND name LIKE 'Bearcats'
GROUP BY season
ORDER BY season ASC
'''

bc = cl.query(QUERY).to_dataframe()
bc[0:20]
bc.plot(x='season',figsize=[16,6], linewidth=3)
#plt.savefig('gbq_teamsGames.png')

#---------------------------------
