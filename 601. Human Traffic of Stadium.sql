-- Write your MySQL query statement below
SELECT *FROM Stadium as s
WHERE 
(   (SELECT people FROM Stadium as s1 WHERE s1.id=s.id-1 and s1.people>=100 ) is not null  and 
    (SELECT people FROM Stadium as s1 WHERE s1.id=s.id   and s1.people>=100 ) is not null  and 
    (SELECT people FROM Stadium as s1 WHERE s1.id=s.id+1 and s1.people>=100 ) is not null  
) 
or 

(
    (SELECT people FROM Stadium as s1 WHERE s1.id=s.id-1 and s1.people>=100 ) is not null  and 
    (SELECT people FROM Stadium as s1 WHERE s1.id=s.id   and s1.people>=100 ) is not null  and 
    (SELECT people FROM Stadium as s1 WHERE s1.id=s.id-2 and s1.people>=100 ) is not null  
)
or 

(
    (SELECT people FROM Stadium as s1 WHERE s1.id=s.id+1 and s1.people>=100 ) is not null  and 
    (SELECT people FROM Stadium as s1 WHERE s1.id=s.id   and s1.people>=100 ) is not null  and 
    (SELECT people FROM Stadium as s1 WHERE s1.id=s.id+2 and s1.people>=100 ) is not null  
)