# Fitness & Wellness App Database

The Fitness & Wellness App is designed to manage user health and fitness data. The app’s system supports user account creation, personalized workout plans, tracked diet/fitness plans based on users’ desires, interaction with trainers, and making payments. The database stores and organizes data efficiently so users can access health information and the company can manage services smoothly. Security features include hashed passwords, unique emails, safer payment storage, role-based access for users/trainers/admins, restricted views for sensitive health data, two-factor authentication support, backup code hashes, login attempt tracking, and audit logs for key record changes. The database for this app must support accurate recordkeeping, strong relationships between data, and proper constraints to maintain data integrity.

## Main Entities

- Users
- Trainers
- Subscriptions
- Payments
- Workout Plans
- Workout Sessions
- Exercises
- Workout Plan Exercises
- Diet Plans
- Meals
- Fitness Progress

## Key Database Features

- Primary keys for every table
- Foreign keys to enforce relationships
- One-to-many relationships between users and subscriptions, payments, workout plans, diet plans, and progress records
- One-to-many relationships between trainers and workout/diet plans
- Many-to-many relationship between workout plans and exercises using a junction table
- Integrity constraints including NOT NULL, UNIQUE, CHECK, DEFAULT, ON DELETE, and ON UPDATE rules
- Password field designed for hashed passwords rather than plain text storage
- Payment table avoids storing full card details

## Cardinality Overview

| Relationship | Cardinality |
|---|---|
| User to Subscription | 1:M |
| User to Payment | 1:M |
| Subscription to Payment | 1:M optional |
| User to Workout Plan | 1:M |
| Trainer to Workout Plan | 1:M |
| Workout Plan to Workout Session | 1:M |
| Workout Plan to Exercise | M:N |
| User to Diet Plan | 1:M |
| Trainer to Diet Plan | 1:M |
| Diet Plan to Meal | 1:M |
| User to Fitness Progress | 1:M |

## Skills Demonstrated

- Relational database design
- Entity relationship modeling
- SQL table creation
- Primary and foreign key implementation
- Data integrity constraints
- Many-to-many relationship resolution
- Cybersecurity-aware database design
