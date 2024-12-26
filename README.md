# MyStreamReviewApp MySql Database

This project involves developing a relational database for a Review web application.  Users will be able to review and rate a tv series currently available on a streaming platform.  MySQL is the relational database management system used for this project 

## Technology Stack

- **Database:**  MySQL
- **Applications:**  MySQL Workbench, Docker

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

### Business Rules
-	A user can only provide one like or dislike but not both for the same tv series
-	A user can only provide one review for the same tv series
-	A like rating can only have the following values: 0 – dislike, 1 – Like
-	A user’s status can only have the values:  0 – Inactive, 1 – Active
-	A permission can only be a regular or admin
-	A user with admin permission can only set another user’s status to active or inactive to control their access to the app
-	A user with admin permission can only amend the permission of another user
-	A user with admin permission can only add, update, delete a TV Series & its content

### Entity Relationship Diagram

![image](https://user-images.githubusercontent.com/122691372/232227643-3f088db4-583f-4eb8-9d55-0fb1a973a0ff.png)

### EER Model - MySQL

![image](https://user-images.githubusercontent.com/122691372/232228567-6ad47729-0aaa-424d-9b6a-2523a3b9a875.png)

### Description of Tables

| Table  | Description |
| ------------- | ------------- |
| Users  | Stores user information  |
| TV_series  | Stores information of added TV series  |
| Like_rating  | Record of likes given by a specific user for a TV Series, 0 – dislike, 1 – Like  |
| Review  | Record of reviews written by a specific user for a TV series  |
| Genre	  | Stores list of genres a TV series could fall under  |
| Streaming_service  | Stores list of streaming platform providers for a TV series  |
| Permission  | List of roles a user may have, regular or admin  |
| user_tvlisting  | Linking table that stores list of users with admin rights who updated/edited a TV series listing  |
| user_permission  | Linking table that stores a list of roles assigned to a user  |
| tvgenre_listing  | Linking table that stores a list of genres assigned to a TV series  |

### Relational Model
-	User (<ins>user_id</ins>, user_name, encrypted_pass, first_name, last_name, email, is_admin, is_active, created_at, updated_at)
-	TV Series (<ins>tvseries_id</ins>, title, image, description, release_date, stream_id(fk), created_at, updated_at)
-	Genre (<ins>genre_id</ins>, genre_type, created_at, updated_at)
-	Streaming Service (<ins>stream_id</ins>, platform, created_at, updated_at)
-	Like Rating (<ins>like_id</ins>, user_id(fk), tvseries_id(fk), is_like, created_at, updated_at)
-	Review (<ins>review_id</ins>, user_id(fk), tvseries_id(fk), content, created_at, updated_at)
-	Permission (<ins>permit_id</ins>, name, description, created_at, updated_at)
-	User_TV Listing (<ins>usertv_id</ins>, user_id(fk), tvseries_id(fk), created_at, updated_at)
-	User_Permission (<ins>userpermit_id</ins>, user_id(fk), permit_id(fk), created_at, updated_at)
-	TV_Genre Listing (<ins>genretv_id</ins>, tvseries_id(fk), genre_id(fk), created_at, updated_at)
