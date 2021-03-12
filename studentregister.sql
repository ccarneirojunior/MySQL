SELECT * FROM studentregister.student;

select lastname, group_concat(firstname) from student group by lastname;

select *from student inner join grade on student.idstudent=grade.idstudent;

select idstudent, firstname, lastname, grade

select student.idstudent, firstname,lastname,grade
from student inner join grade on student.idstudent=grade.idstudent;

# show the average grades per student
select student.idstudent,firstname,lastname,avg(grade)
from student inner join grade on student.idstudent=grade.idstudent
group by student.idstudent;

# show the grades of a determined student
select student.idstudent,firstname,lastname, group_concat(grade)
from student inner join grade on student.idstudent=grade.idstudent
group by student.idstudent;


#what means inner?
insert into student(firstname, lastname) values('Daniel', 'Hope');

# shows  the students with no grade (assigned as null), both under are the same
select student.idstudent,firstname,lastname, group_concat(grade)
from student left join grade on student.idstudent=grade.idstudent
group by student.idstudent;

select student.idstudent,firstname,lastname, group_concat(grade)
from grade right join student on student.idstudent=grade.idstudent
group by student.idstudent;

#what courses the student has passed
#show student names and courses names
select firstname, lastname, name
from student inner join grade on student.idstudent=grade.idstudent
inner join course on grade.idcourse=course.idcourse;

select firstname, lastname, group_concat(name)
from student inner join grade on student.idstudent=grade.idstudent
inner join course on grade.idcourse=course.idcourse
group by student.idstudent;

select name, group_concat(firstname,lastname)
from student inner join grade on student.idstudent=grade.idstudent
inner join course on grade.idcourse=course.idcourse
group by name;

#show the name of students who have passed the course databases

select student.idstudent, firstname, lastname
from student inner join grade on student.idstudent=grade.idstudent
inner join course on grade.idcourse=course.idcourse
where name='databases';

#subquery
#show the grades of ann jones
select grade 
from grade inner join student on grade.idstudent=student.idstudent
where lastname="Jones" and firstname="Ann";

select grade from grade where idstudent=(
select idstudent from student where lastname="Jones" and firstname="Ann");

select firstname, lastname from student where idstudent IN
(select idstudent from grade where idcourse=
(select idcourse from course where name="databases"));

#how mane courses did the student pass 
select student.idstudent, firstname, lastname, count(grade)
from student left join grade on student.idstudent=grade.idstudent
group by student.idstudent;

#show the total at the end 
select student.idstudent, firstname, lastname, count(grade)
from student left join grade on student.idstudent=grade.idstudent
group by student.idstudent
union
select"", "TOTAL", "", count(grade) from grade;

#the grades of database course (Showing the grades of one course)
select grade
from grade inner join course on grade.idcourse=course.idcourse
where name="databases"; 

#show how many grades are 1 or 2
select grade, "1-2" from grade where grade>=1 and grade<=2
union 
select grade, "3-4" from grade where grade>=3 and grade<=4
union 
select grade, "5" from grade where grade=5;
