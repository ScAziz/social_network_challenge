TRUNCATE TABLE users, posts RESTART IDENTITY;

INSERT INTO users (email_address, username) 
VALUES ('bob@hotmail.co.uk', 'Big Bob');
INSERT INTO users (email_address, username) 
VALUES ('anna@gmail.com', 'anna123');

INSERT INTO posts (title, content, view_count, user_id) 
VALUES ('tuesday', 'ate a banana', '5', '1');
INSERT INTO posts (title, content, view_count, user_id) 
VALUES ('wednesday', 'walked dog', '2', '1');
INSERT INTO posts (title, content, view_count, user_id) 
VALUES ('books', 'i read a bunch of books', '10', '2');
INSERT INTO posts (title, content, view_count, user_id) 
VALUES ('films', 'i watched a bunch of films', '20', '2');
