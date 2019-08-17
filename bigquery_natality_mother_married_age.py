# Google BigQuery visualized using pandas DataFrame
# dataset TableID: bigquery-public-data:samples.natality

#mother's age and marital status at childbirth
from google.cloud import bigquery
import matplotlib.pyplot as plt
import os

os.environ["GOOGLE_APPLICATION_CREDENTIALS"]="/home/danuta/Documents/BIGDATA/projects/Session16sie-key.json"

cl = bigquery.Client()

QUERY='''
SELECT
    mother_age,
    SUM(CASE WHEN mother_married THEN 1 ELSE 0 END) AS married,
    SUM(CASE WHEN mother_married THEN 0 ELSE 1 END) AS not_marr
FROM `bigquery-public-data.samples.natality`
WHERE mother_age IS NOT NULL
GROUP BY mother_age
ORDER BY mother_age ASC
'''
qjob = cl.query(QUERY)
marr_age = qjob.to_dataframe()
marr_status_age = marr_age[0:45]
marr_status_age.plot(x='mother_age',figsize=[16,6], linewidth=5)
#plt.savefig('gbq_momsAgeMarit.png')

#------------------------------------

# mother's marital status vs age visualized in a bar chart
from google.cloud import bigquery
import matplotlib.pyplot as plt
import seaborn as sns
import os

os.environ["GOOGLE_APPLICATION_CREDENTIALS"]="/home/danuta/Documents/BIGDATA/projects/Session16sie-key.json"

cl = bigquery.Client()

QUERY='''
SELECT
    mother_age,COUNT(1) as count,mother_married
    --SUM(CASE WHEN mother_married THEN 1 ELSE 0 END) AS married,
    --SUM(CASE WHEN mother_married THEN 0 ELSE 1 END) AS not_married
FROM `bigquery-public-data.samples.natality`
WHERE mother_age IS NOT NULL
GROUP BY mother_age,mother_married
ORDER BY mother_age ASC
'''
qjob = cl.query(QUERY)
mar_age = qjob.to_dataframe()
mar_status_age = mar_age[12:50]

sns.catplot(x='mother_age', y='count', hue="mother_married", kind='bar',
           data=mar_status_age, height=6, aspect=10/5)
#plt.savefig('gbq_momsMaritStatus.png')

# ------------------------------------

