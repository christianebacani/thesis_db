DROP DATABASE IF EXISTS thesis_db;
CREATE DATABASE thesis_db;
USE thesis_db;

CREATE TABLE `users` (
   	user_id INTEGER PRIMARY KEY,
    employee_id VARCHAR(20),
    email VARCHAR(100),
    password VARCHAR(100),
    fullname VARCHAR(255),
    role ENUM('Quest Lead', 'Skills Associate'),
    department VARCHAR(255),
    job_position VARCHAR(255),
    created_at TIMESTAMP,
    UNIQUE KEY uq_users_employee_id (employee_id)
);

INSERT INTO users
VALUES
	(1, '22-00981', 'christianbacani581@gmail.com', 'anything', 'Christiane Rhely Joselle A. Bacani', 'Quest Lead', 'Data Department', 'Data Engineer', CURRENT_TIMESTAMP()),
    (2, '22-00982', 'johndoe@gmail.com', 'anything', 'John Doe', 'Skills Associate', 'Human Resource', 'HR Manager', CURRENT_TIMESTAMP()),
    (3, '22-00983', 'janedoe@gmail,com', 'anything', 'Jane Doe', 'Quest Lead', 'Sales Department', 'Sales Representative', CURRENT_TIMESTAMP());
    
CREATE TABLE `achievements` (
    achievements_id INTEGER PRIMARY KEY,
    name VARCHAR(255),
    description TEXT,
    icon TEXT,
    badge_color CHAR(7),
    xp_reward BIGINT,
    criteria_type VARCHAR(150),
    criteria_value BIGINT,
    is_active BOOLEAN,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `user_achievements` (
    user_achievements_id INTEGER PRIMARY KEY,
    employee_id VARCHAR(20),
    achievements_id INTEGER,
    earned_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY(employee_id) REFERENCES users (employee_id),
    FOREIGN KEY(achievements_id) REFERENCES achievements (achievements_id)
);

SELECT *
FROM
    user_achievements;