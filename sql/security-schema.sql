USE FitnessWellnessApp;

CREATE TABLE Roles (
    role_id INT PRIMARY KEY AUTO_INCREMENT,
    role_name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE UserRoles (
    user_id INT NOT NULL,
    role_id INT NOT NULL,

    PRIMARY KEY (user_id, role_id),

    FOREIGN KEY (user_id)
        REFERENCES Users(user_id),

    FOREIGN KEY (role_id)
        REFERENCES Roles(role_id)
);

CREATE TABLE Admins (
    admin_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    created_date DATE DEFAULT (CURRENT_DATE)
);

CREATE TABLE TwoFactorAuth (
    two_factor_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NULL,
    trainer_id INT NULL,
    admin_id INT NULL,
    two_factor_enabled BOOLEAN DEFAULT FALSE,
    two_factor_method VARCHAR(30),
    two_factor_secret VARCHAR(255),
    phone_number VARCHAR(20),
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    last_verified TIMESTAMP NULL
);

CREATE TABLE TwoFactorBackupCodes (
    backup_code_id INT PRIMARY KEY AUTO_INCREMENT,
    two_factor_id INT NOT NULL,
    backup_code_hash VARCHAR(255) NOT NULL,
    used BOOLEAN DEFAULT FALSE,
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    used_date TIMESTAMP NULL,

    FOREIGN KEY (two_factor_id)
        REFERENCES TwoFactorAuth(two_factor_id)
);

CREATE TABLE TwoFactorAttempts (
    attempt_id INT PRIMARY KEY AUTO_INCREMENT,
    two_factor_id INT NOT NULL,
    attempt_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    success BOOLEAN DEFAULT FALSE,
    ip_address VARCHAR(45),
    device_info VARCHAR(255),

    FOREIGN KEY (two_factor_id)
        REFERENCES TwoFactorAuth(two_factor_id)
);

CREATE TABLE AuditLogs (
    audit_id INT PRIMARY KEY AUTO_INCREMENT,
    table_name VARCHAR(100) NOT NULL,
    record_id INT NOT NULL,
    action_type VARCHAR(20) NOT NULL,
    changed_by VARCHAR(100),
    change_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    old_value TEXT,
    new_value TEXT
);