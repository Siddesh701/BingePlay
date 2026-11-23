CREATE DATABASE BingePlays;
SHOW DATABASES;
USE BingePlays;
CREATE TABLE users (
    user_id VARCHAR(10) PRIMARY KEY,
    Name VARCHAR(100),
    signup_date DATE,
    city VARCHAR(50),
    age_group VARCHAR(10),
    referral_source VARCHAR(30)
);

CREATE TABLE subscriptions (
    subscription_id VARCHAR(15) PRIMARY KEY,
    user_id VARCHAR(10),
    Plan VARCHAR(20),
    start_date DATE,
    end_date DATE NULL,
    status VARCHAR(20),
    monthly_price_inr INT,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);


use BingePlays;
show tables;

CREATE TABLE shows (
    show_id VARCHAR(10) PRIMARY KEY,
    title VARCHAR(200),
    category VARCHAR(30),
    language VARCHAR(30),
    release_year INT,
    imdb_rating DECIMAL(3,1),
    is_original TINYINT,
    min_plan VARCHAR(20)
);

CREATE TABLE watch_sessions (
    session_id INT PRIMARY KEY,
    user_id VARCHAR(10) NULL,
    show_id VARCHAR(10),
    session_date DATE,
    watch_minutes INT,
    device_type VARCHAR(30),
    completed TINYINT,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (show_id) REFERENCES shows(show_id)
);

SHOW TABLES;

CREATE TABLE ratings (
    rating_id INT PRIMARY KEY,
    user_id VARCHAR(10),
    show_id VARCHAR(10),
    stars TINYINT,
    rated_date DATE,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (show_id) REFERENCES shows(show_id)
);

SHOW TABLES;


SELECT 'users' AS tbl, COUNT(3000) AS total FROM users
UNION ALL
SELECT 'subscriptions', COUNT(4497) FROM subscriptions
UNION ALL
SELECT 'shows', COUNT(100) FROM shows
UNION ALL
SELECT 'watch_sessions', COUNT(100351) FROM watch_sessions
UNION ALL
SELECT 'ratings', COUNT(5000) FROM ratings;