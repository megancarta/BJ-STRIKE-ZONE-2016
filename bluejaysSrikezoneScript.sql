SELECT Favour, COUNT(Favour) 
FROM databaseball
GROUP BY 1;

/*SELECT Favour, ROUND(AVG(percentSame), 2) AS percent_of_umpires_that_would_make_same_call
FROM databaseball
GROUP BY 1;*/

SELECT databaseball.Distance, databaseball.bluejaysPlayer, databaseball.Favour, databaseball.umpCall, databaseball.strikeZoneCall, databaseball.percentSame
FROM databaseball
JOIN 2016_complete_roster ON
	databaseball.bluejaysPlayer = 2016_complete_roster.bluejaysPlayer
WHERE 2016_complete_roster.playerPosition = 'Batter' AND Favour = 'hurts'
ORDER BY Distance DESC 
LIMIT 25;

SELECT databaseball.Distance, databaseball.bluejaysPlayer, databaseball.Favour, databaseball.umpCall, databaseball.strikeZoneCall, databaseball.percentSame
FROM databaseball
JOIN 2016_complete_roster ON
	databaseball.bluejaysPlayer = 2016_complete_roster.bluejaysPlayer
WHERE 2016_complete_roster.playerPosition = 'Batter' AND Favour = 'helps'
ORDER BY Distance DESC 
LIMIT 25;

SELECT databaseball.Distance, databaseball.bluejaysPlayer, databaseball.Favour, databaseball.umpCall, databaseball.strikeZoneCall, databaseball.percentSame
FROM databaseball
JOIN 2016_complete_roster ON
	databaseball.bluejaysPlayer = 2016_complete_roster.bluejaysPlayer
WHERE 2016_complete_roster.playerPosition = 'Pitcher' AND Favour = 'hurts'
ORDER BY Distance DESC 
LIMIT 25;

SELECT databaseball.Distance, databaseball.bluejaysPlayer, databaseball.Favour, databaseball.umpCall, databaseball.strikeZoneCall, databaseball.percentSame
FROM databaseball
JOIN 2016_complete_roster ON
	databaseball.bluejaysPlayer = 2016_complete_roster.bluejaysPlayer
WHERE 2016_complete_roster.playerPosition = 'Pitcher' AND Favour = 'helps'
ORDER BY Distance DESC 
LIMIT 25;

SELECT 
		2016_complete_roster.bluejaysPlayer AS 'Player',
		COUNT(CASE WHEN databaseball.Favour = 'helps' THEN 1 ELSE NULL END) AS helps,
        COUNT(CASE WHEN databaseball.Favour = 'hurts' THEN 1 ELSE NULL END) AS hurts
FROM 2016_complete_roster
JOIN databaseball ON
	2016_complete_roster.bluejaysPlayer = databaseball.bluejaysPlayer
GROUP BY 1;