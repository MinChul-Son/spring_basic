-- https://programmers.co.kr/learn/courses/30/lessons/59041?language=mysql
SELECT NAME, COUNT(NAME) COUNT FROM ANIMAL_INS
GROUP BY NAME
HAVING COUNT(NAME) > 1
ORDER BY NAME;


-- https://programmers.co.kr/learn/courses/30/lessons/59412?language=mysql
SELECT HOUR(DATETIME) HOUR ,COUNT(HOUR(DATETIME)) COUNT FROM ANIMAL_OUTS
GROUP BY HOUR
HAVING HOUR >= 9 AND HOUR < 20
ORDER BY HOUR;


-- https://programmers.co.kr/learn/courses/30/lessons/59413?language=mysql
with recursive time as
                   (select 0 as hour
union all
select hour+1 from time where hour<23)
select hour, count(animal_id) count
from time
    left outer join animal_outs on (hour = date_format(datetime, '%H') )
group by hour;

