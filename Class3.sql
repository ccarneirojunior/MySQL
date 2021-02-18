SELECT * FROM studentregister.grade;
# what is the average of grades
select avg(grade) from grade; 
# only two decimals 
select round(avg(grade),2) from grade;
#Change the heading 
select round(avg(grade),2) as "Average of Grades" from grade;
#Returning the minimum and maximum
select min(grade), max(grade), avg(grade) from grade;
#show the frequencies of the grades, how many students get grade 1,2,3,4
select grade, count(grade) as "Grade Frequency"  from grade group by grade;
select grade, count(grade) as "Grade Frequency"  from grade group by grade order by grade;