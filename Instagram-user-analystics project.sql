SELECT * FROM users;

select * from photos;

-- 1.Find the 5 oldest users of the instagram from the database 
SELECT username,created_at from users order by created_at desc limit 5;

-- 2. Find the users who have never posted a single photo on Instagram
 SELECT * from photos,users;
 SELECT * from users u left join  photos p on p.user_id = u.id where p.image_url is null order by u.username;

-- 3. Identify the winner of the contest and provide their details to the team
SELECT * FROM likes,photos,users;

SELECT likes.photo_id,users.username,count(likes.user_id) as likes 
from likes inner join photos on likes.photo_id = photo_id
inner join users on photos.user_id = users.id group by 
likes.photo_id,users.username order by likes desc;

-- 4 Identify and suggest top 5 most commonly used hastags on the platform
SELECT * FROM photo_tags,tags;
SELECT t.tag_name,count(p.photo_id) as ht  from photo_tags p join tags t on t.id = p.tag_id group by t.tag_name order by ht desc limit 5;

-- 5. What day of the week do most users register on ? Provide insights on when to schedule an ad campaign 

SELECT * from users;
SELECT date_format((created_at), '%W') as day, count(username) from users group by 1  order by 2 desc;




 
 
 
 