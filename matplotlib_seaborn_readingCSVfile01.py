
# data read from csv files
# 7 regions

import matplotlib.pyplot as plt
import pandas as pd
import seaborn as sns

df = pd.read_csv(
    "~/Documents/workspaces/Jupyter_u/files/x/InternetUsageV.csv",
    encoding='ISO-8859-1')
    
sns.set(rc={"font.size":12, "axes.labelsize":12, "xtick.labelsize":12,
           "ytick.labelsize":12, 'axes.labelcolor':'blue'})
grid=sns.relplot("Year", "Value", "Region/Country/Area",data=df,
                  kind="line", height=5, aspect=2)
grid.fig.suptitle("Percentage of individuals using the Internet")
#plt.savefig("InternetUsageV.png")

#----------------------------------------------------

#data selection from csv, containing data on 6 counties

import matplotlib.pyplot as plt
import pandas as pd
import seaborn as sns

df = pd.read_csv(
    "~/Documents/workspaces/Jupyter_u/files/x/netUsersV.csv",
    encoding='UTF-8')
    
sns.set(rc={"font.size":12, "axes.labelsize":12, "xtick.labelsize":12,
           "ytick.labelsize":12, 'axes.labelcolor':'green'})
grid=sns.catplot("Country Name", "2017",data=df, palette='gist_earth_r',
                   kind='bar',height=4, aspect=2)
grid.fig.suptitle("% Internet users in 2017")
grid.set_xticklabels(rotation=20)
#plt.savefig("netUsers2017.png")

#----------------------------------------------------

# data includes 3 regions

import matplotlib.pyplot as plt
import pandas as pd
import seaborn as sns
import numpy as np

df = pd.read_csv(
    "~/Documents/workspaces/Jupyter_u/files/x/InternetUsage3.csv")
    
g=sns.catplot(x="Year", y="Value", hue='Region/Country/Area',
              kind="bar",data=df, height=6, palette='gist_earth_r')
g.set_axis_labels("Year","% of Internet users")
plt.savefig("InternetUsage3.png")

#----------------------------------------------------
