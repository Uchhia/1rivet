/****database creation****/
create database Fitness;

use Fitness;


create table Users(
userId int primary key,
username varchar(50) not null,
email varchar(70) constraint unique_email unique not null,
password varchar(20) not null,
age int check(age between 5 and 70) not null,
gender varchar(1) check( gender in ('M','F','O')) not null,
weight_kg decimal check(weight_kg>0) not null,
height_inches decimal check(height_inches>0 and height_inches<10) not null,
target_goal varchar(50)
)

INSERT INTO Users (userId, username, email, password, age, gender, weight_kg, height_inches, target_goal)
VALUES
(1, 'user11', 'user11@example.com', 'password11', 28, 'M', 75.5, 5.12, 'Build muscle'),
(2, 'user12', 'user12@example.com', 'password12', 32, 'F', 62.2, 5.5, 'Lose weight'),
(3, 'user13', 'user13@example.com', 'password13', 38, 'M', 85.0, 6.2, 'Stay fit'),
(4, 'user14', 'user14@example.com', 'password14', 42, 'F', 58.3, 5.8, 'Increase endurance'),
(5, 'user15', 'user15@example.com', 'password15', 22, 'O', 70.7, 5.6, 'Improve flexibility'),
(6, 'user16', 'user16@example.com', 'password16', 27, 'M', 80.5, 5.9, 'Build muscle'),
(7, 'user17', 'user17@example.com', 'password17', 31, 'F', 64.2, 5.6, 'Lose weight'),
(8, 'user18', 'user18@example.com', 'password18', 36, 'M', 90.0, 6.1, 'Stay fit'),
(9, 'user19', 'user19@example.com', 'password19', 40, 'F', 59.3, 5.1, 'Increase endurance'),
(10, 'user20', 'user20@example.com', 'password20', 35, 'M', 72.6, 5.11, 'General fitness');



create table Exercises(exerciseId int primary key, 
exercise_name varchar(100) not null unique,
muscle_tartgeted varchar(100),
difficulty varchar check(difficulty in ('L','M','H'))
)

INSERT INTO Exercises (exerciseId, exercise_name, muscle_tartgeted, difficulty)
VALUES
(1, 'Push-up', 'Chest, Shoulders, Triceps', 'M'),
(2, 'Pull-up', 'Back, Biceps', 'H'),
(3, 'Squat', 'Quadriceps, Glutes, Hamstrings', 'M'),
(4, 'Deadlift', 'Hamstrings, Glutes, Lower Back', 'H'),
(5, 'Bench Press', 'Chest, Shoulders, Triceps', 'M'),
(6, 'Plank', 'Core', 'L'),
(7, 'Lunges', 'Quadriceps, Hamstrings, Glutes', 'M'),
(8, 'Dumbbell Rows', 'Back, Biceps', 'M'),
(9, 'Leg Press', 'Quadriceps, Hamstrings, Glutes', 'M'),
(10, 'Bicep Curls', 'Biceps', 'L');


create table Workouts(workoutId int primary key,
workout_name varchar(100) not null,
description varchar(255),
userId int,
creation_date date,
duration time,
difficulty varchar check(difficulty in ('L','M','H')),
foreign key(userId) references Users(userID)
)


INSERT INTO Workouts (workoutId, workout_name, description, userId, creation_date, duration, difficulty)
VALUES
(1, 'Full Body Workout', 'Covers all major muscle groups', 1, '2024-03-14', '01:00:00', 'M'),
(2, 'Upper Body Strength', 'Focuses on chest, back, and arms', 2, '2024-03-14', '00:45:00', 'H'),
(3, 'Leg Day', 'Targets quadriceps, hamstrings, and glutes', 3, '2024-03-14', '00:50:00', 'M'),
(4, 'Core Blast', 'Strengthens abdominal muscles', 4, '2024-03-14', '00:30:00', 'L'),
(5, 'HIIT Cardio', 'High-intensity interval training', 5, '2024-03-14', '00:40:00', 'H'),
(6, 'Circuit Training', 'Combines strength and cardio exercises', 6, '2024-03-14', '00:55:00', 'M'),
(7, 'Yoga Flow', 'Improves flexibility and relaxation', 7, '2024-03-14', '01:10:00', 'L'),
(8, 'CrossFit WOD', 'Varied functional movements at high intensity', 8, '2024-03-14', '01:15:00', 'H'),
(9, 'Pilates Mat', 'Strengthens core muscles with controlled movements', 9, '2024-03-14', '00:50:00', 'M'),
(10, 'Swimming Workout', 'Low-impact full-body exercise in water', 10, '2024-03-14', '01:20:00', 'H');



create table Workout_Exercises(workoutId int,
exerciseId int,
sets int,
reps int,
duration time,
foreign key(workoutId) references Workouts(workoutId),
foreign key(exerciseId) references Exercises(exerciseId),
)

INSERT INTO Workout_Exercises (workoutId, exerciseId, sets, reps, duration)
VALUES
(1, 1, 3, 12, '00:45:00'), 
(1, 3, 4, 10, '00:45:00'), 
(2, 5, 5, 8, '00:35:00'),  
(2, 2, 4, 8, '00:35:00'),  
(3, 3, 4, 12, '00:50:00'), 
(3, 7, 3, 15, '00:50:00'), 
(4, 6, 3, 15, '00:25:00'), 
(5, 5, 5, 10, '00:40:00'), 
(5, 7, 5, 15, '00:40:00'); 


--User data fetching
select * from Users;

--User data fetching
select * from Exercises;

--User data fetching
select * from Workouts;

--User data fetching
select * from Workout_Exercises;


-- 1.users in user table
select count(*)  as total_user from Users;

-- 2.exericese in user table
select count(*)  as total_exercise from Exercises;

-- 3.avergage weight for user
select avg(weight_kg) as average_weight from Users;

-- 4.exercise target back muscle
select exercise_name  from Exercises where muscle_tartgeted like'%Back%';

-- 5.user with age more 30
select username from Users where age>30;

-- 6.exercise for chest muscles
select exercise_name from Exercises where muscle_tartgeted like'%Chest%';

-- 7.all workouts with difficulity level Medium
select workout_name from Workouts where difficulty='M';

-- 8.users who have a target goal containing the word 'weight'
select username from Users where target_goal like '%weight%';

--  9.exercises with a difficulty level higher than 'L'.
select exercise_name from Exercises where difficulty>'L';

-- 10.workouts created on '2024-03-14' or a duration longer or equal to 1 hour.
select workout_name from Workouts where creation_date='2024-03-14' or duration>='01:00:00';


-- 11.users whose weight is less than or equal to 70 kg.
select username from Users where weight_kg<70;

-- 12.workouts with a creation date earlier than '2024-03-14'.
select workout_name from Workouts where creation_date<'2024-03-15';

-- 13.workouts with a duration between 45 minutes and 1 hour.
select workout_name from Workouts where duration between '00:45:00' and '01:00:00';

-- 14.exercises with a difficulty level not in ('L', 'M').
select  exercise_name from Exercises where difficulty not in ('L','M');

-- 15.users whose target goal starts with the letter 'I'.
select username from Users where target_goal like 'I%';

use Fitness;

select * from Users;

select * from Exercises;

select * from Workouts;

select * from Workout_Exercises;

-- 21. update user13 password to Mypassword
update Users set password='Mypassword' where username='user13';

--22 delete Exercise with name plank
delete Exercises where exercise_name='Plank';

--23 count how many gender are allowed in gym
select count(distinct gender) from Users;

--24 sort thr user by there age if age is siminlar than in descending order by their heigt
select * from Users order by age,height_inches desc;

--25 Add unique key constraint to Exercisee name
alter table Exercises add constraint unique_exerc unique(exercise_name);

-- 26 union username age from user and exercise name and age from excerisee table
select username,age from Users
Union
select exercise_name,exerciseId from Exercises;

--27 check if any user has null target
select * from Users where target_goal is null;

-- 28 index in User table.
create index name_index on Users (username);

--29 drop the index from user table
drop index name_index on Users;

--30 delete all the details of Excerice using turncate coomand
truncate table Exercise;

--31 alter table user add user  plan column in table 
alter table Users add [plan] varchar(10);
























