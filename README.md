# BJ-STRIKE-ZONE-2016
```
CONTRIBUTIONS:
Megan Carta for SQL and Data Analysis
Ben Catalan for Python Scripting
```

Database and analysis of umpire strike zone calls that help or hurt the Blue Jays 


We wanted to see if MLB umpires truly hated Canada. 
We found an automated twitter account, @BlueJaysUmp, that tweets every time an umpire makes a strike zone call that is opposite of what it should be.  Using the data from the tweets, we could analyze the  general effect of the umpires' calls on the Blue Jays.



RESULTS
--------
We found that for the 2016 MLB regular season and post season, the umpire calls helped the Blue Jays a total of () times and hurt the Blue Jays a total of () times.


The player who had the most calls against him was () with () calls that hurt him, while the player who had the most calls in their favour was () with () calls that helped him.
We also queried a table showing the total amount of calls that hurt and helped each individual player.


The farthest distance from the strike zone that the umpire miscalled was () inches.
We also queried tables showing the farthest distances from the strike zone specifically for batters or pitchers.


In general, we found that the umpires' calls actually helped the Blue Jays more over the span of the season.
However, what we could do in the future to further improve our project would be to include the count into our data as the timing of the umpire's miscalls would have a different impact depending on the situation.



PROCESS
--------
- Using python we pulled all of @BlueJaysUmp's tweets
- We then parsed the tweets into variables
- Put variables into a readable csv file
- In MySQL, we created two tables.  One was a complete list of all of the Blue Jays players for the 2016 including their position.  The other table we populated using the csv file.
- Then, we constructed our queries in order to analyze the data.



REQUIRED DEPENDENCIES
--------
- MySQL 3.0 workbench
