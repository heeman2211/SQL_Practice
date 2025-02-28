/*
Query the two cities in STATION with the shortest and longest CITY names, as well as their respective lengths (i.e.: number of characters in the name). If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically.
The STATION table is described as follows:


Field		TYPE
ID			number
city		VARCHAR2
STATE		VARCHAR2
Lat_n		number
Long_w		number
where LAT_N is the northern latitude and LONG_W is the western longitude.

Sample Input

For example, CITY has four entries: DEF, ABC, PQRS and WXY.

Sample Output

ABC		3
PQRS	4

Explanation

When ordered alphabetically, the CITY names are listed as ABC, DEF, PQRS, and WXY, with lengths  and . The longest name is PQRS, but there are  options for shortest named city. Choose ABC, because it comes first alphabetically.

Note
You can write two separate queries to get the desired output. It need not be a single query.
*/
SELECT CITY, LENGTH(CITY) AS X FROM STATION
GROUP BY CITY
HAVING X IN (SELECT MIN(LENGTH(CITY)) FROM STATION)
ORDER BY CITY LIMIT 1;
SELECT CITY, LENGTH(CITY) AS Y FROM STATION
GROUP BY CITY
HAVING Y IN (SELECT MAX(LENGTH(CITY)) FROM STATION);