-- 创建数据库cook
CREATE DATABASE cook;
-- 进入cook
USE cook;
-- 创建食谱表cook_food
CREATE TABLE cook_food(
    fid INT PRIMARY KEY AUTO_INCREMENT,
    food_name VARCHAR(32),  
    foods VARCHAR(200),  
    steps VARCHAR(500),  
    details VARCHAR(100), 
    food_type INT ,
    img_url VARCHAR(50)
)ENGINE InnoDB CHARSET utf8 COMMENT '食谱表';
-- 创建视频表cook_food
CREATE TABLE food_movie(
    mid INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(50),
    zuoze VARCHAR(30),
    date_time VARCHAR(15),
    movie_img VARCHAR(20),
    movie_url VARCHAR(20)
)ENGINE InnoDB CHARSET utf8 COMMENT '视频表';
-- 点赞记录表cook_zan
CREATE TABLE cook_zan(
    id INT PRIMARY KEY AUTO_INCREMENT,
    uid INT,
    fid INT
)ENGINE InnoDB CHARSET utf8 COMMENT '点赞记录表';
-- 视频评论表cook_comment
CREATE TABLE cook_comment(
    cid INT PRIMARY KEY AUTO_INCREMENT,
    uid INT,
    fid INT,
    content VARCHAR(200),
    time VARCHAR(20),
    nickname VARCHAR(10)
)ENGINE InnoDB CHARSET utf8 COMMENT '视频评论表';