CREATE DATABASE IF NOT EXISTS FitnessWellnessApp;
USE FitnessWellnessApp;

CREATE TABLE Users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    age INT,
    gender VARCHAR(20),
    phone_number VARCHAR(20),
    registration_date DATE DEFAULT (CURRENT_DATE)
);

CREATE TABLE Trainers (
    trainer_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    specialty VARCHAR(100),
    certification VARCHAR(100),
    phone_number VARCHAR(20)
);

CREATE TABLE Subscriptions (
    subscription_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    plan_type VARCHAR(50) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE,
    status VARCHAR(30) NOT NULL,
    
    FOREIGN KEY (user_id)
        REFERENCES Users(user_id)
);

CREATE TABLE Payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    subscription_id INT NULL,
    payment_date DATE DEFAULT (CURRENT_DATE),
    amount DECIMAL(10,2) NOT NULL CHECK (amount > 0),
    payment_method VARCHAR(50) NOT NULL,
    payment_status VARCHAR(30) NOT NULL,
    transaction_id VARCHAR(100),
    payment_provider VARCHAR(50),
    card_last_four CHAR(4),

    FOREIGN KEY (user_id)
        REFERENCES Users(user_id),

    FOREIGN KEY (subscription_id)
        REFERENCES Subscriptions(subscription_id)
);

CREATE TABLE WorkoutPlans (
    workout_plan_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    trainer_id INT NOT NULL,
    plan_name VARCHAR(100) NOT NULL,
    difficulty_level VARCHAR(50),
    duration_weeks INT,
    goal VARCHAR(100),

    FOREIGN KEY (user_id)
        REFERENCES Users(user_id),

    FOREIGN KEY (trainer_id)
        REFERENCES Trainers(trainer_id)
);

CREATE TABLE Exercises (
    exercise_id INT PRIMARY KEY AUTO_INCREMENT,
    exercise_name VARCHAR(100) NOT NULL,
    description TEXT,
    target_muscle_group VARCHAR(100),
    estimated_calories_burned DECIMAL(8,2)
);

CREATE TABLE WorkoutPlanExercises (
    workout_plan_id INT NOT NULL,
    exercise_id INT NOT NULL,
    sets INT,
    reps INT,
    rest_seconds INT,

    PRIMARY KEY (workout_plan_id, exercise_id),

    FOREIGN KEY (workout_plan_id)
        REFERENCES WorkoutPlans(workout_plan_id),

    FOREIGN KEY (exercise_id)
        REFERENCES Exercises(exercise_id)
);

CREATE TABLE WorkoutSessions (
    session_id INT PRIMARY KEY AUTO_INCREMENT,
    workout_plan_id INT NOT NULL,
    session_date DATE NOT NULL,
    duration_minutes INT,
    calories_burned DECIMAL(8,2),
    completion_status VARCHAR(30),

    FOREIGN KEY (workout_plan_id)
        REFERENCES WorkoutPlans(workout_plan_id)
);

CREATE TABLE DietPlans (
    diet_plan_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    trainer_id INT NOT NULL,
    plan_name VARCHAR(100) NOT NULL,
    calorie_target INT,
    duration_days INT,

    FOREIGN KEY (user_id)
        REFERENCES Users(user_id),

    FOREIGN KEY (trainer_id)
        REFERENCES Trainers(trainer_id)
);

CREATE TABLE Meals (
    meal_id INT PRIMARY KEY AUTO_INCREMENT,
    diet_plan_id INT NOT NULL,
    meal_name VARCHAR(100) NOT NULL,
    meal_type VARCHAR(50),
    calorie_count INT,
    nutritional_description TEXT,

    FOREIGN KEY (diet_plan_id)
        REFERENCES DietPlans(diet_plan_id)
);

CREATE TABLE FitnessProgress (
    progress_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    weight DECIMAL(5,2),
    bmi DECIMAL(4,2),
    body_fat_percentage DECIMAL(5,2),
    measurement_date DATE NOT NULL,
    notes TEXT,

    FOREIGN KEY (user_id)
        REFERENCES Users(user_id)
);
