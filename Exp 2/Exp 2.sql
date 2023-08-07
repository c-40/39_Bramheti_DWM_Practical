--Slicing
Select * 
from [User]
where [type]='ADMIN';

--Roll up
SELECT u.[type], SUM(f.total_sales) AS total_sales, SUM(f.total_expense) AS total_expense
FROM fact_table f, [User] u
WHERE f.user_id = u.user_id
GROUP BY u.[type];

--Dicing:
SELECT u.*, l.*
FROM [User] u,[Location] l
WHERE u.user_id = l.location_id
    AND u.[type] = 'admin'
    AND l.state = 'CA';

--Drill-down
SELECT u.[type], l.city, t.[Quater],
       SUM(f.total_sales) AS total_sales, SUM(f.total_expense) AS total_expense
FROM fact_table f, [User] u, location l, time t
WHERE f.user_id = u.user_id AND f.Location_id = l.Location_id AND f.Time_id = t.Time_id
GROUP BY u.[type], l.city, t.[Quater];