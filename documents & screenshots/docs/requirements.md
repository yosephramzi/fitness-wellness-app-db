# Database Requirements

1. Store user account information as a strong entity, including: UserID (PK, auto-increment), FullName (NOT NULL), Email (UNIQUE, NOT NULL), PasswordHash (NOT NULL), Age, Gender, PhoneNumber, and RegistrationDate (NOT NULL, defaults to current date). Passwords must be stored as hashes instead of plain text, and user emails must be unique to prevent duplicate accounts. Each user can be associated with subscriptions, workout plans, diet plans, progress records, payments, roles, and two-factor authentication settings.

2. Store trainer information as a strong entity, including: TrainerID (PK, auto-increment), FullName (NOT NULL), Email (UNIQUE, NOT NULL), Specialty, Certification, and PhoneNumber. Trainer emails must be unique to prevent duplicate trainer accounts. A trainer can be assigned to many workout plans and diet plans, but each plan belongs to only one trainer.

3. Store administrator account information, including: AdminID (PK, auto-increment), FullName (NOT NULL), Email (UNIQUE, NOT NULL), PasswordHash (NOT NULL), and CreatedDate (NOT NULL, defaults to current date). Admin accounts support system management and must store passwords as hashes.

4. Support role-based access control, including: RoleID (PK, auto-increment), RoleName (UNIQUE, NOT NULL), UserID (FK referencing Users, NOT NULL), and RoleID (FK referencing Roles, NOT NULL). Roles separate access levels for users, trainers, and administrators.

5. Store subscription information, including: SubscriptionID (PK, auto-increment), UserID (FK referencing Users, NOT NULL), PlanType (NOT NULL), StartDate (NOT NULL), EndDate, and Status (e.g., Active, Expired, Canceled, Pending, NOT NULL). Each user can have one or more subscriptions, but each subscription belongs to exactly one user. Subscription changes must be tracked in the audit log.

6. Track payments made by users, including: PaymentID (PK, auto-increment), UserID (FK referencing Users, NOT NULL), SubscriptionID (FK referencing Subscriptions, optional), PaymentDate (NOT NULL, defaults to current date), Amount (NOT NULL, must be greater than 0), PaymentMethod (e.g., Credit Card, PayPal, Apple Pay, NOT NULL), PaymentStatus (e.g., Completed, Pending, Failed, Refunded, NOT NULL), TransactionID, PaymentProvider, and CardLastFour. Payment records must not store full credit card numbers, CVV codes, or full card details. Payment updates must be tracked in the audit log.

7. Store workout plans, including: WorkoutPlanID (PK, auto-increment), UserID (FK referencing Users, NOT NULL), TrainerID (FK referencing Trainers, NOT NULL), PlanName (NOT NULL), DifficultyLevel, DurationWeeks, and Goal. Each workout plan is assigned to exactly one trainer and one user, but a trainer can manage many workout plans and a user can have many workout plans. A workout plan can contain many exercises, and the same exercise can appear in multiple plans. This many-to-many relationship is resolved by WorkoutPlanExercises.

8. Track workout sessions as an entity dependent on WorkoutPlan, including: SessionID (PK, auto-increment), WorkoutPlanID (FK referencing WorkoutPlans, NOT NULL), SessionDate (NOT NULL), DurationMinutes, CaloriesBurned, and CompletionStatus (e.g., Completed, Skipped, In Progress). Each workout session belongs to exactly one workout plan. A separate UserID is not required because the related user can be identified through WorkoutPlans.

9. Store exercise information as a strong entity, including: ExerciseID (PK, auto-increment), ExerciseName (NOT NULL), Description, TargetMuscleGroup, and EstimatedCaloriesBurned. Exercises are reusable across many workout plans. The many-to-many relationship between Exercise and WorkoutPlan is managed through the WorkoutPlanExercises junction entity.

10. Store diet plans, including: DietPlanID (PK, auto-increment), UserID (FK referencing Users, NOT NULL), TrainerID (FK referencing Trainers, NOT NULL), PlanName (NOT NULL), CalorieTarget, and DurationDays. Each diet plan belongs to exactly one user and is managed by one trainer. A diet plan can include many meals, and each meal belongs to exactly one diet plan.

11. Store meal information as an entity dependent on DietPlan, including: MealID (PK, auto-increment), DietPlanID (FK referencing DietPlans, NOT NULL), MealName (NOT NULL), MealType (e.g., Breakfast, Lunch, Dinner, Snack), CalorieCount, and NutritionalDescription. Each meal belongs to exactly one diet plan, and a diet plan can contain many meals.

12. Track user fitness progress as an entity dependent on User, including: ProgressID (PK, auto-increment), UserID (FK referencing Users, NOT NULL), Weight, BMI, BodyFatPercentage, MeasurementDate (NOT NULL), and Notes. Each progress record belongs to exactly one user, and a user can have many progress entries over time. Sensitive health data must be protected through restricted views, and updates must be tracked in the audit log.

13. Support two-factor authentication, including: TwoFactorID (PK, auto-increment), UserID, TrainerID, AdminID, TwoFactorEnabled, TwoFactorMethod, TwoFactorSecret, PhoneNumber, CreatedDate, and LastVerified. The database must also store backup code hashes and 2FA login attempts for account security monitoring.

14. Include audit logs, including: AuditID (PK, auto-increment), TableName, RecordID, ActionType, ChangedBy, ChangeDate, OldValue, and NewValue. Audit logs track changes to payments, subscriptions, fitness progress records, and two-factor authentication attempts.

15. Include integrity constraints, including primary keys, foreign keys, NOT NULL, UNIQUE, CHECK, DEFAULT, ON DELETE, and ON UPDATE rules. These constraints help protect data accuracy and prevent invalid records.