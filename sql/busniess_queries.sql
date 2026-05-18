USE FitnessWellnessApp;

-- Active subscriptions
SELECT *
FROM Subscriptions
WHERE status = 'Active';

-- Payments over $50
SELECT *
FROM Payments
WHERE amount > 50;

-- Users with workout plans
SELECT 
    u.full_name,
    wp.plan_name
FROM Users u
JOIN WorkoutPlans wp
ON u.user_id = wp.user_id;

-- Trainer workout plan count
SELECT
    t.full_name,
    COUNT(wp.workout_plan_id) AS total_plans
FROM Trainers t
LEFT JOIN WorkoutPlans wp
ON t.trainer_id = wp.trainer_id
GROUP BY t.full_name;