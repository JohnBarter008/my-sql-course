--Show different types of airport
Select DISTINCT [type] FROM airports

--Show the large airports only
SELECT * FROM airports a
WHERE
a.[type] = 'large_airport'

--Restrict large airports to the EU
SELECT * FROM airports a
WHERE
a.[type] = 'large_airport'
and a.continent = 'EU'

--Restrict large airports to the EU in Britain and France
SELECT * FROM airports a
WHERE
a.[type] = 'large_airport'
and a.continent = 'EU'
and a.iso_country in ('GB','FR')

--Restrict large airports to the EU in Britain and France to four/five columns
SELECT a.name, a.latitude_deg, a.longitude_deg, a.iata_code, a.elevation_ft, a.iso_country FROM airports a
WHERE
a.[type] = 'large_airport'
and a.continent = 'EU'
and a.iso_country in ('GB','FR')

--Restrict large airports to the EU in Britain and France to four/five columns, in alphabetical name
SELECT
    a.name 
    ,a.latitude_deg 
    ,a.longitude_deg 
    ,a.iata_code 
    ,a.elevation_ft
    ,ROUND((a.elevation_ft / 3.28),1) as 'Elevation_M'
    ,a.iso_country
FROM
    airports a
WHERE
a.[type] = 'large_airport'
    AND a.continent = 'EU'
    AND a.iso_country IN ('GB','FR')
    AND a.latitude_deg BETWEEN 51 AND 54
ORDER BY 
a.name ASC --in ascending order

