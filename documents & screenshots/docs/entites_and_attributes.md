# Entities and Attributes

## 1. Users
- UserID (PK, auto-increment)
- FullName (NOT NULL)
- Email (UNIQUE, NOT NULL)
- PasswordHash (NOT NULL)
- Age
- Gender
- PhoneNumber
- RegistrationDate (NOT NULL, default current date)

## 2. Trainers
- TrainerID (PK, auto-increment)
- FullName (NOT NULL)
- Email (UNIQUE, NOT NULL)
- Specialty
- Certification
- PhoneNumber

## 3. Admins
- AdminID (PK, auto-increment)
- FullName (NOT NULL)
- Email (UNIQUE, NOT NULL)
- PasswordHash (NOT NULL)
- CreatedDate (NOT NULL, default current date)

## 4. Roles
- RoleID (PK, auto-increment)
- RoleName (UNIQUE, NOT NULL)

## 5. UserRoles
- UserID (PK/FK referencing Users)
- RoleID (PK/FK referencing Roles)

## 6. Subscriptions
- SubscriptionID (PK, auto-increment)
- UserID (FK referencing Users, NOT NULL)
- PlanType (NOT NULL)
- StartDate (NOT NULL)
- EndDate
- Status (NOT NULL)

## 7. Payments
- PaymentID (PK, auto-increment)
- UserID (FK referencing Users, NOT NULL)
- SubscriptionID (FK referencing Subscriptions, optional)
- PaymentDate (NOT NULL, default current date)
- Amount (NOT NULL, must be greater than 0)
- PaymentMethod (NOT NULL)
- PaymentStatus (NOT NULL)
- TransactionID
- PaymentProvider
- CardLastFour

## 8. WorkoutPlans
- WorkoutPlanID (PK, auto-increment)
- UserID (FK referencing Users, NOT NULL)
- TrainerID (FK referencing Trainers, NOT NULL)
- PlanName (NOT NULL)
- DifficultyLevel
- DurationWeeks
- Goal

## 9. WorkoutSessions
- SessionID (PK, auto-increment)
- WorkoutPlanID (FK referencing WorkoutPlans, NOT NULL)
- SessionDate (NOT NULL)
- DurationMinutes
- CaloriesBurned
- CompletionStatus

## 10. Exercises
- ExerciseID (PK, auto-increment)
- ExerciseName (NOT NULL)
- Description
- TargetMuscleGroup
- EstimatedCaloriesBurned

## 11. WorkoutPlanExercises
- WorkoutPlanID (PK/FK referencing WorkoutPlans)
- ExerciseID (PK/FK referencing Exercises)
- Sets
- Reps
- RestSeconds

## 12. DietPlans
- DietPlanID (PK, auto-increment)
- UserID (FK referencing Users, NOT NULL)
- TrainerID (FK referencing Trainers, NOT NULL)
- PlanName (NOT NULL)
- CalorieTarget
- DurationDays

## 13. Meals
- MealID (PK, auto-increment)
- DietPlanID (FK referencing DietPlans, NOT NULL)
- MealName (NOT NULL)
- MealType
- CalorieCount
- NutritionalDescription

## 14. FitnessProgress
- ProgressID (PK, auto-increment)
- UserID (FK referencing Users, NOT NULL)
- Weight
- BMI
- BodyFatPercentage
- MeasurementDate (NOT NULL)
- Notes

## 15. TwoFactorAuth
- TwoFactorID (PK, auto-increment)
- UserID (FK referencing Users, optional)
- TrainerID (FK referencing Trainers, optional)
- AdminID (FK referencing Admins, optional)
- TwoFactorEnabled (NOT NULL, default false)
- TwoFactorMethod
- TwoFactorSecret
- PhoneNumber
- CreatedDate (NOT NULL, default current timestamp)
- LastVerified

## 16. TwoFactorBackupCodes
- BackupCodeID (PK, auto-increment)
- TwoFactorID (FK referencing TwoFactorAuth, NOT NULL)
- BackupCodeHash (NOT NULL)
- Used (NOT NULL, default false)
- CreatedDate (NOT NULL, default current timestamp)
- UsedDate

## 17. TwoFactorAttempts
- AttemptID (PK, auto-increment)
- TwoFactorID (FK referencing TwoFactorAuth, NOT NULL)
- AttemptTime (NOT NULL, default current timestamp)
- Success (NOT NULL, default false)
- IPAddress
- DeviceInfo

## 18. AuditLogs
- AuditID (PK, auto-increment)
- TableName (NOT NULL)
- RecordID (NOT NULL)
- ActionType (NOT NULL)
- ChangedBy
- ChangeDate (NOT NULL, default current timestamp)
- OldValue
- NewValue