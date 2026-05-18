USE FitnessWellnessApp;

INSERT INTO Users (
    full_name,
    email,
    password_hash,
    age,
    gender,
    phone_number
)
VALUES (
    'John Doe',
    'john@example.com',
    'hashed_password_here',
    22,
    'Male',
    '7045551234'
);

INSERT INTO Trainers (
    full_name,
    email,
    specialty,
    certification,
    phone_number
)
VALUES (
    'Sarah Smith',
    'sarah@example.com',
    'Strength Training',
    'NASM',
    '7045555678'
);