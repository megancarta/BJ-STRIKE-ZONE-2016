SELECT 
	Favour AS Outcome, 
	COUNT(Favour) AS TOTAL
FROM databaseball
GROUP BY 1;

/*farthest distance that hurts batters*/
SELECT 
	d.Distance AS 'Inches from Strikezone', 
	d.bluejaysPlayer AS Player, 
	d.Favour AS Outcome, 
	d.umpCall AS 'Umpire''s call', 
	d.strikeZoneCall AS 'Strikezone call', 
	d.percentSame AS 'Percentage of umps that make the same call'
FROM databaseball AS d
JOIN 2016_complete_roster AS c ON
	d.bluejaysPlayer = c.bluejaysPlayer
WHERE c.playerPosition = 'Batter' AND Favour = 'hurts'
ORDER BY Distance DESC 
LIMIT 10;

/*farthest distance that helps batters*/
SELECT 
	d.Distance AS 'Inches from Strikezone', 
	d.bluejaysPlayer AS Player, 
	d.Favour AS Outcome, 
	d.umpCall AS 'Umpire''s call', 
	d.strikeZoneCall AS 'Strikezone call', 
	d.percentSame AS 'Percentage of umps that make the same call'
FROM databaseball AS d
JOIN 2016_complete_roster AS c ON
	d.bluejaysPlayer = c.bluejaysPlayer
WHERE c.playerPosition = 'Batter' AND Favour = 'helps'
ORDER BY Distance DESC 
LIMIT 10;

/*farthest distance that hurts pitchers*/
SELECT 
	d.Distance AS 'Inches from Strikezone', 
	d.bluejaysPlayer AS Player, 
	d.Favour AS Outcome, 
	d.umpCall AS 'Umpire''s call', 
	d.strikeZoneCall AS 'Strikezone call', 
	d.percentSame AS 'Percentage of umps that make the same call'
FROM databaseball AS d
JOIN 2016_complete_roster AS c ON
	d.bluejaysPlayer = c.bluejaysPlayer
WHERE c.playerPosition = 'Pitcher' AND Favour = 'hurts'
ORDER BY Distance DESC 
LIMIT 10;

/*farthest distance that helps pitchers*/
SELECT 
	d.Distance AS 'Inches from Strikezone', 
	d.bluejaysPlayer AS Player, 
	d.Favour AS Outcome, 
	d.umpCall AS 'Umpire''s call', 
	d.strikeZoneCall AS 'Strikezone call', 
	d.percentSame AS 'Percentage of umps that make the same call'
FROM databaseball AS d
JOIN 2016_complete_roster AS c ON
	d.bluejaysPlayer = c.bluejaysPlayer
WHERE c.playerPosition = 'Pitcher' AND Favour = 'helps'
ORDER BY Distance DESC 
LIMIT 10;

/*orders by helps*/
SELECT 
		c.bluejaysPlayer AS 'Player',
		COUNT(CASE WHEN d.Favour = 'helps' THEN 1 ELSE NULL END) AS helps,
        COUNT(CASE WHEN d.Favour = 'hurts' THEN 1 ELSE NULL END) AS hurts
FROM 2016_complete_roster AS c
JOIN databaseball AS d ON
	c.bluejaysPlayer = d.bluejaysPlayer
GROUP BY 1
ORDER BY 2 DESC;

/*orders by hurts*/
SELECT 
		c.bluejaysPlayer AS 'Player',
		COUNT(CASE WHEN d.Favour = 'helps' THEN 1 ELSE NULL END) AS helps,
        COUNT(CASE WHEN d.Favour = 'hurts' THEN 1 ELSE NULL END) AS hurts
FROM 2016_complete_roster AS c
JOIN databaseball AS d ON
	c.bluejaysPlayer = d.bluejaysPlayer
GROUP BY 1
ORDER BY 3 DESC;