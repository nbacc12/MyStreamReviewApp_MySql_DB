/* ------------------------------------ */
/* --- MyStream Review App Database --- */
/* ------------------------------------ */

/*--- Description of Tables:
Users -->  Stores user information
TV_series --> Stores TV series information
Like_rating --> Record of likes given by a specific user for a TV Series, 0 – dislike, 1 – Like
Review --> Record of reviews written by a specific user for a TV series
Genre --> Stores list of different genres
Streaming_service --> Stores list of Streaming platform providers
Permission --> List of roles a user may have, regular or admin
user_tvlisting --> Linking table that stores list of users with admin rights who updated/edited a TV series listing
user_permission --> Linking table that stores a list of roles assigned to a user
tvgenre_listing --> Linking table that stores a list of genres assigned to a TV series
--- */

/* ------------------- */
/* -- CREATE TABLES -- */
/* ------------------- */

-- Creates database for MyStream Review App --
CREATE DATABASE Mystreamreview_db;

USE Mystreamreview_db;

-- Creates User table --
CREATE TABLE User (
	user_id INT PRIMARY KEY AUTO_INCREMENT,
    user_name VARCHAR(50),
    encrypted_pass VARCHAR(50),
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email VARCHAR(255),
    is_admin BOOLEAN,
    is_active BOOLEAN,
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

-- Creates Permission table --
CREATE TABLE Permission (
	permit_id INT PRIMARY KEY AUTO_INCREMENT,
    pm_name VARCHAR(35),
    pm_descript VARCHAR(50),
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

-- Creates linking table for User & Permission tables --
CREATE TABLE User_Permission (
	userpermit_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    permit_id INT,
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    CONSTRAINT fk_userpermission_user_id
		FOREIGN KEY (user_id)
        REFERENCES User (user_id)
        ON UPDATE CASCADE
        ON DELETE SET NULL,
	CONSTRAINT fk_userpermission_permit_id
		FOREIGN KEY (permit_id)
        REFERENCES Permission (permit_id)
        ON UPDATE CASCADE
        ON DELETE SET NULL
);

-- Creates Genre table --
CREATE TABLE Genre (
	genre_id INT PRIMARY KEY AUTO_INCREMENT,
    genre_type VARCHAR(50),
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

-- Creates Streaming service table --
CREATE TABLE Streaming_service (
	stream_id INT PRIMARY KEY AUTO_INCREMENT,
    platform VARCHAR(50),
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

-- Creates TV Series table --
CREATE TABLE TV_series (
	tvseries_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255),
    image LONGBLOB,
    description LONGTEXT,
    release_date DATE,
    stream_id INT,
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    CONSTRAINT fk_tvseries_stream_id
		FOREIGN KEY (stream_id)
        REFERENCES Streaming_service (stream_id)
        ON UPDATE CASCADE
        ON DELETE SET NULL
);

-- Creates linking table for TV Series & Genre tables --
CREATE TABLE tvgenre_listing (
	genretv_id INT PRIMARY KEY AUTO_INCREMENT,
    tvseries_id INT,
    genre_id INT,
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    CONSTRAINT fk_tvgenrelisting_tvseries_id
		FOREIGN KEY (tvseries_id)
        REFERENCES TV_series (tvseries_id)
        ON UPDATE CASCADE
        ON DELETE SET NULL,
	CONSTRAINT fk_tvgenrelisting_genre_id
		FOREIGN KEY (genre_id)
        REFERENCES Genre (genre_id)
        ON UPDATE CASCADE
        ON DELETE SET NULL
);

-- Creates Like rating table --
CREATE TABLE Like_rating (
	like_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    tvseries_id INT,
    is_like BOOLEAN,
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    CONSTRAINT fk_likerating_user_id
		FOREIGN KEY (user_id)
        REFERENCES User (user_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
	CONSTRAINT fk_likerating_tvseries_id
		FOREIGN KEY (tvseries_id)
        REFERENCES TV_series (tvseries_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

-- Creates Review table --
CREATE TABLE Review (
	review_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    tvseries_id INT,
    content LONGTEXT,
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    CONSTRAINT fk_review_user_id
		FOREIGN KEY (user_id)
        REFERENCES User (user_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
	CONSTRAINT fk_review_tvseries_id
		FOREIGN KEY (tvseries_id)
        REFERENCES TV_series (tvseries_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

-- Creates linking table for user & tv series table --
CREATE TABLE usertv_listing (
	usertv_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    tvseries_id INT,
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    CONSTRAINT fk_usertvlisting_user_id
		FOREIGN KEY (user_id)
        REFERENCES User (user_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
	CONSTRAINT fk_usertvlisting_tvseries_id
		FOREIGN KEY (tvseries_id)
        REFERENCES TV_series (tvseries_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

/* ----------------------------- */
/* -- INSERT DATA INTO TABLES -- */
/* ----------------------------- */

-- Inserts User records into User table
INSERT INTO User (user_name, encrypted_pass, first_name, last_name, email, is_admin, is_active, created_at, updated_at)
VALUES ('superadmin', 'pass', 'John', 'Smith', 'johnsmith@yorku.ca', true, true, current_timestamp, current_timestamp);

INSERT INTO User (user_name, encrypted_pass, first_name, last_name, email, is_admin, is_active, created_at, updated_at)
VALUES ('sbrown', 'pass', 'Steve', 'Brown', 'sbrown@hotmail.com', false, true, current_timestamp, current_timestamp),
('amandapark', 'pass', 'Amanda', 'Park', 'apark32@hotmail.com', false, true, current_timestamp, current_timestamp),
('ivan212', 'pass', 'Ivan', 'Miletic', 'imiletic@hotmail.com', false, false, current_timestamp, current_timestamp),
('jsmith', 'pass', 'Jane', 'Smith', 'jsmith29@gmail.com', false, true, current_timestamp, current_timestamp),
('mben213', 'pass', 'Milton', 'Bennett', 'mben312@outlook.com', false, true, current_timestamp, current_timestamp),
('corden', 'pass', 'Cornelia', 'Denzel', 'cdenzel@yahoo.com', false, true, current_timestamp, current_timestamp);

-- Inserts genres into table
INSERT INTO Genre (genre_type, created_at, updated_at)
VALUES ('Action', current_timestamp, current_timestamp),
('Comedy', current_timestamp, current_timestamp), 
('Drama', current_timestamp, current_timestamp),
('Doc', current_timestamp, current_timestamp),
('Family', current_timestamp, current_timestamp),
('Horror', current_timestamp, current_timestamp),
('Romance', current_timestamp, current_timestamp),
('Sci-Fi', current_timestamp, current_timestamp); 

-- Inserts streaming services into table
INSERT INTO Streaming_service (platform, created_at, updated_at)
VALUES ('Amazon Prime', current_timestamp, current_timestamp),
('Disney+', current_timestamp, current_timestamp),
('Netflix', current_timestamp, current_timestamp),
('AppleTV+', current_timestamp, current_timestamp),
('MAX', current_timestamp, current_timestamp);

INSERT INTO Streaming_service (platform, created_at, updated_at)
VALUES ('Paramount+', current_timestamp, current_timestamp);

-- Inserts permissions data into permission table
INSERT INTO Permission (pm_name, pm_descript, created_at, updated_at)
VALUES ('regular', 'normal user', current_timestamp, current_timestamp),
('admin', 'administrator', current_timestamp, current_timestamp);

-- Inserts several TV series data into TV series table
INSERT INTO TV_series (title, image, description, release_date, stream_id, created_at, updated_at)
VALUES ('Stranger Things', 
'https://static.wikia.nocookie.net/strangerthings8338/images/3/3a/ST4_Poster_02.jpg/revision/latest?cb=20220714173659', 
'When a boy fades, a town finds a mystery involving covert experiments, frightening supernatural powers, and also one little girl.', 
'2016-07-15', 
3, 
CURRENT_TIMESTAMP, 
CURRENT_TIMESTAMP),
('That 90s Show', 
'https://www.comingsoon.net/wp-content/uploads/sites/3/2023/01/That-90s-show.jpg', 
'Kitty and Red Forman welcome a new generation of teenagers into their basement when their granddaughter Leia decides to spend her summer in Wisconsin.', 
'2023-01-19', 
3, 
CURRENT_TIMESTAMP, 
CURRENT_TIMESTAMP),
('The Last of Us',
'https://pbs.twimg.com/media/Fjd77vtWQAMBYVw?format=jpg&name=4096x4096',
'After a global pandemic destroys civilization, a hardened survivor takes charge of a 14-year-old girl who may be last hope of humanity.', 
'2023-01-15', 
6, 
CURRENT_TIMESTAMP, 
CURRENT_TIMESTAMP),
('National Treasure Edge of History',
'https://lumiere-a.akamaihd.net/v1/images/p_disneyplusoriginals_nationaltreasureedgeofhistory_v6_8bd01e69.jpeg',
'Jess Valenzuela, a 20-year-old Dreamer, sets off on an exploration to discover the mystery of her family history, and, with the help of her friends, seeks to recover historical lost treasure',
'2022-12-14',
2,
CURRENT_TIMESTAMP, 
CURRENT_TIMESTAMP),
('The Mandalorian',
'https://lumiere-a.akamaihd.net/v1/images/p_fyc_themandalorian_19097_de619ea9.jpeg',
'The travels of a lone bounty hunter in the outer reaches of the galaxy, far from the authority of the New Republic.',
'2019-11-12',
2,
CURRENT_TIMESTAMP, 
CURRENT_TIMESTAMP),
('The Boys',
'https://oyster.ignimgs.com/wordpress/stg.ign.com/2020/07/The-Boys-Season-2-Poster.jpg?fit=bounds&width=1280&height=720',
'A group of vigilantes set out to take down corrupt superheroes who abuse their superpowers.',
'2019-07-19',
1,
CURRENT_TIMESTAMP, 
CURRENT_TIMESTAMP),
('Ted Lasso',
'https://www.themoviedb.org/t/p/original/5fhZdwP1DVJ0FyVH6vrFdHwpXIn.jpg',
'American college football coach Ted Lasso heads to London to manage AFC Richmond, a struggling English Premier League football team.',
'2020-08-14',
4,
CURRENT_TIMESTAMP, 
CURRENT_TIMESTAMP),
("Clarkson's Farm",
'https://thingsilikedotlive.files.wordpress.com/2023/03/clarksons-farm.jpg',
'Jeremy Clarkson attempts to run a farm in the countryside.',
'2021-06-11',
1,
CURRENT_TIMESTAMP, 
CURRENT_TIMESTAMP),
("Lisey's Story",
'https://static1.tribute.ca/poster/660x980/liseys-story-apple-tv-153261.jpg',
"A widow becomes the object of a dangerous stalker, obsessed with her husband's work.",
'2021-06-04',
4,
CURRENT_TIMESTAMP, 
CURRENT_TIMESTAMP);

-- Inserts permissions for a given user into the User_Permission linking table
INSERT INTO User_Permission (user_id, permit_id, created_at, updated_at)
VALUES (1, 2, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(1, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(2, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(3, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(4, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(5, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(6, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Inserts genres for a given tv series into the tvgenre_listing linking table
INSERT INTO tvgenre_listing (tvseries_id, genre_id, created_at, updated_at)
VALUES (1, 6, current_timestamp, current_timestamp),
(1, 8, current_timestamp, current_timestamp),
(2, 2, current_timestamp, current_timestamp),
(3, 3, current_timestamp, current_timestamp),
(3, 8, current_timestamp, current_timestamp),
(4, 3, current_timestamp, current_timestamp),
(5, 5, current_timestamp, current_timestamp),
(6, 1, current_timestamp, current_timestamp),
(6, 8, current_timestamp, current_timestamp),
(7, 1, current_timestamp, current_timestamp),
(7, 3, current_timestamp, current_timestamp),
(7, 8, current_timestamp, current_timestamp),
(8, 2, current_timestamp, current_timestamp),
(9, 4, current_timestamp, current_timestamp);

-- Inserts likes/dislikes for a given tv series by a user into the Like rating table
INSERT INTO Like_rating (user_id, tvseries_id, is_like, created_at, updated_at)
VALUES (3, 1, true, current_timestamp, current_timestamp),
(3, 2, true, current_timestamp, current_timestamp),
(3, 4, false, current_timestamp, current_timestamp),
(5, 1, true, current_timestamp, current_timestamp),
(5, 6, true, current_timestamp, current_timestamp),
(6, 6, true, current_timestamp, current_timestamp),
(6, 9, true, current_timestamp, current_timestamp);

-- Inserts reviews made by a user for a given tv series into the review table
INSERT INTO Review (user_id, tvseries_id, content, created_at, updated_at)
VALUES (3, 1,
'This show is absolutely stunning and thrilling I have never seen such an amazing thriller show recently this is out of the world deserves an award.',
current_timestamp,
current_timestamp),
(5, 1,
'Love this show and it deserves an award for sure.',
current_timestamp,
current_timestamp),
(3, 4,
'I did not like this show',
current_timestamp,
current_timestamp),
(5, 6,
"Doing a fantastic job of telling the story of the Mandalorians, but less about the Mandalorian himself through 5 episodes. 
That's ok though, because Bo-Katan's character is becoming fascinating and taking that part of the show's appeal.",
current_timestamp,
current_timestamp),
(6, 9,
'Extremely well done. Beautiful cinematography, great music, lots of laughs and a great story.',
current_timestamp,
current_timestamp);

-- Inserts data about which user/admin added a TV Series into the database 
INSERT INTO usertv_listing (user_id, tvseries_id, created_at, updated_at)
VALUES (1, 1, '2024-12-29 03:07:48', '2024-12-29 03:07:48'),
(1, 2, '2024-12-29 03:07:48', '2024-12-29 03:07:48'),
(1, 3, '2024-12-29 03:07:48', '2024-12-29 03:07:48'),
(1, 4, '2024-12-29 03:07:48', '2024-12-29 03:07:48'),
(1, 5, '2024-12-29 03:07:48', '2024-12-29 03:07:48'),
(1, 6, '2024-12-29 03:07:48', '2024-12-29 03:07:48'),
(1, 7, '2024-12-29 03:07:48', '2024-12-29 03:07:48'),
(1, 8, '2024-12-29 03:07:48', '2024-12-29 03:07:48'),
(1, 9, '2024-12-29 03:07:48', '2024-12-29 03:07:48');


/* ------------------------------------------------------------------ */
/* --- SQL Scripts of User Requests to operate MyStreamReview app --- */
/* ------------------------------------------------------------------ */

/* --
Gather details for a specfic TV Series including title, image, description, release date, 
streaming platform, genres, total likes, total reviews, average likes
-- */
SET @tv_id = 1; -- Sets TV series ID

-- Displays TV Series details
SELECT tvs.title, tvs.image, tvs.description, tvs.release_date, ss.platform, 
(SELECT AVG(is_like) FROM Like_rating WHERE tvseries_id = @tv_id AND is_like = 1) AS 'Avg Likes',
(SELECT COUNT(like_id) FROM Like_rating WHERE tvseries_id = @tv_id AND is_like = 1) AS 'Total Likes',
(SELECT COUNT(review_id) FROM Review WHERE tvseries_id = @tv_id) AS 'Total Reviews' 
FROM TV_series AS tvs
JOIN Streaming_service AS ss ON tvs.stream_id = ss.stream_id
WHERE tvs.tvseries_id = @tv_id;

-- Gathers Genres for a specific TV Series
SELECT tvs.title, g.genre_type FROM TV_series AS tvs
JOIN tvgenre_listing AS tvg ON tvs.tvseries_id = tvg.tvseries_id
JOIN Genre AS g ON tvg.genre_id = g.genre_id
WHERE tvs.tvseries_id = @tv_id;


/* Provide a list of different TV Series to display on main web page */
SELECT tvs.tvseries_id, tvs.title, tvs.image,
(SELECT SUM(lr.is_like) FROM Like_rating AS lr WHERE tvs.tvseries_id = lr.tvseries_id) AS 'Total Likes',
(SELECT COUNT(review_id) FROM Review AS r WHERE tvs.tvseries_id = r.tvseries_id) AS 'Total Reviews'
FROM TV_series AS tvs;

/* Sort Series by Genre */
SELECT tvs.tvseries_id, tvs.title FROM TV_series AS tvs
JOIN tvgenre_listing AS tvg ON tvs.tvseries_id = tvg.tvseries_id
JOIN Genre As g ON tvg.genre_id = g.genre_id
WHERE g.genre_id = 1
ORDER BY tvs.title ASC;

/* Sort Series by Streaming Service */
SELECT tvs.tvseries_id, tvs.title FROM TV_series AS tvs
JOIN Streaming_service AS ss ON tvs.stream_id = ss.stream_id
WHERE ss.stream_id = 1
ORDER BY tvs.title ASC;

/* Sort by Most Popular */
SELECT tvs.tvseries_id, tvs.title, tvs.image, SUM(lr.is_like) AS 'Total Like', 
(SELECT COUNT(r.review_id) FROM Review AS r WHERE r.tvseries_id = tvs.tvseries_id) AS 'Total Review' 
FROM TV_series AS tvs
JOIN Like_rating AS lr ON tvs.tvseries_id = lr.tvseries_id
GROUP BY tvs.tvseries_id
ORDER BY AVG(lr.is_like) DESC, SUM(lr.is_like) DESC, tvs.title DESC;

/* Sort by Least Popular */
SELECT tvs.tvseries_id, tvs.title, tvs.image, SUM(lr.is_like) AS 'Total Like', 
(SELECT COUNT(r.review_id) FROM Review AS r WHERE r.tvseries_id = tvs.tvseries_id) AS 'Total Review' 
FROM TV_series AS tvs
JOIN Like_rating AS lr ON tvs.tvseries_id = lr.tvseries_id
GROUP BY tvs.tvseries_id
ORDER BY AVG(lr.is_like) ASC, SUM(lr.is_like) ASC, tvs.title DESC;

/* Sort by Recently Added */
SELECT tvs.tvseries_id, tvs.title, tvs.image, SUM(lr.is_like) AS 'Total Like', 
(SELECT COUNT(r.review_id) FROM Review AS r WHERE r.tvseries_id = tvs.tvseries_id) AS 'Total Reviews' 
FROM TV_series AS tvs
JOIN Like_rating AS lr ON tvs.tvseries_id = lr.tvseries_id
GROUP BY tvs.tvseries_id
ORDER BY tvs.created_at ASC;

/* Provide a list of reviews for a specific TV Series */
-- >> NOTE: Stranger things Reviews are found.
SELECT r.review_id, r.content, 
(SELECT lr.is_like FROM Like_rating AS lr WHERE tvs.tvseries_id = lr.tvseries_id AND u.user_id = lr.user_id) AS 'Like', 
u.user_name, r.created_at FROM TV_series AS tvs
JOIN Review AS r ON tvs.tvseries_id = r.tvseries_id
JOIN User AS u ON r.user_id = u.user_id
WHERE tvs.tvseries_id = 1;

/* Provide a list of likes or dislikes for a specific TV Series */
-- >> NOTE: Stranger things Reviews are found.
SELECT lr.like_id, lr.is_like, u.user_name FROM TV_series AS tvs
JOIN Like_rating AS lr ON tvs.tvseries_id = lr.tvseries_id
JOIN User AS u ON lr.user_id = u.user_id
WHERE tvs.tvseries_id = 1
ORDER BY lr.created_at DESC;

/* Provide a list of likes or dislikes for a specific TV Series */
SELECT tvs.tvseries_id, tvs.title, lr.is_like FROM User AS u
JOIN Like_rating AS lr ON u.user_id = lr.user_id
JOIN TV_series AS tvs ON lr.tvseries_id = tvs.tvseries_id
WHERE u.user_id = 3
ORDER BY lr.created_at DESC;

/* Provide a list of reviews created by a specific user for different TV Series */
SELECT tvs.tvseries_id, tvs.title, r.content, 
(SELECT lr.is_like FROM Like_rating AS lr WHERE tvs.tvseries_id = lr.tvseries_id AND u.user_id = lr.user_id) AS 'Likes', 
r.created_at FROM User AS u
JOIN Review AS r ON u.user_id = r.user_id
JOIN TV_series AS tvs ON r.tvseries_id = tvs.tvseries_id
WHERE u.user_id = 5
ORDER BY r.created_at DESC;

/* Provide a list of different users */
SELECT * FROM User;

/* Enable a user to act as an administrator to create, update, delete TV Series listings */
START TRANSACTION;
	INSERT INTO User_Permission (user_id, permit_id, created_at, updated_at) 
	VALUES (2, 2, current_timestamp, current_timestamp);
ROLLBACK;

/* Have administrators to enable or disable access of other users */
START TRANSACTION;
	UPDATE User SET is_active = false, updated_at = current_timestamp WHERE user_id = 2;
ROLLBACK;

/* Have administrators grant or rescind administrative rights for other users */
START TRANSACTION;
	UPDATE User SET is_admin = true, updated_at = current_timestamp WHERE user_id = 2;
ROLLBACK;

/* Allow a user to rate a tv series */
START TRANSACTION;
	INSERT INTO Like_rating (user_id, tvseries_id, is_like, created_at, updated_at)
    VALUES (2, 3, true, current_timestamp, current_timestamp);
ROLLBACK;

/* Allow a user to update their like rating */
START TRANSACTION;
	Set @like_id = (SELECT like_id FROM Like_rating WHERE user_id = 5 AND tvseries_id = 1);
    
	UPDATE Like_rating SET is_like = false, updated_at = current_timestamp
    WHERE like_id = @like_id;
ROLLBACK;

/* Allow a user to post review for a tv series */
START TRANSACTION;
	INSERT INTO Review (user_id, tvseries_id, content, created_at, updated_at)
    VALUES (6, 1, 'I liked the show.', current_timestamp, current_timestamp);
ROLLBACK;

/* Allow a user to update a previously posted review for a tv series */
START TRANSACTION;
	Set @review_id = (SELECT review_id FROM Review WHERE user_id = 3 AND tvseries_id = 4);
    
    UPDATE Review SET content = 'The treasure hunt itself was good, when the focus was on that.', updated_at = current_timestamp
    WHERE review_id = @review_id;
ROLLBACK;