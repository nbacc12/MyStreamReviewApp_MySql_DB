# MyStreamReviewApp_MySql_DB

This project involves developing a MySQL database for a Review web application.  Users will be able to review and rate a tv series currently available on a streaming platform.  

## Technology Stack

MySQL
DOCKER
MySQL Workbench

## Instructions

fdfdsafsadfas

## Database Design

### Mission Statement
The purpose of the MyStream Review database is to gather & maintain information on streaming series in support of our user’s access to content and review services.

### Mission Objectives
-	Provide a list of different TV Series
-	Enable sorting of TV Series by genre, popularity, streaming services, or recent addition 
-	Provide a list of reviews for a specific TV Series
-	Provide a list of likes or dislikes for a specific TV Series
-	Provide a list of reviews created by a specific user for different TV Series
-	Provide a list of likes or dislikes made by a specific user for different TV Series
-	Provide a list of different users
-	Store login credentials from users
-	Enable a user to act as an administrator to create, update, delete TV Series listings
-	Have administrators to enable or disable access of other users
-	Have administrators grant or rescind administrative rights for other users

### Entities
-	User
-	Permission
-	TV Series 
-	Like Rating
-	Review
-	Genre
-	Streaming Service

### Relationships
- A User may complete a task on one or more TV Series; A TV Series may have a task completed by one or more Users.
- A User must have one or more Permission; A Permission must be associated with one or more User.
- A User may submit one or more Like Rating; A Like Rating must belong to one and only one User. 
- A User may submit one or more Review; A Review must belong to one and only one User.
- A TV Series may have one or more Like Rating; A Like Rating must belong to one and only one TV Series.
- A TV Series may have one or more Reviews; A Review must belong to one and only one TV Series.
- A TV Series must have one or more Genres; A Genre may belong to one or more TV Series.
- A TV Series must belong to one and only one Streaming Service; A Streaming service may have one or more TV Series. 
