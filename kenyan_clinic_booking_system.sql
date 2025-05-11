
-- Kenyan Clinic Booking System SQL Script

-- Drop tables if they already exist (to avoid errors on re-import)
DROP TABLE IF EXISTS prescriptions;
DROP TABLE IF EXISTS medical_records;
DROP TABLE IF EXISTS payments;
DROP TABLE IF EXISTS appointments;
DROP TABLE IF EXISTS doctors;
DROP TABLE IF EXISTS patients;
DROP TABLE IF EXISTS departments;

-- Create departments table
CREATE TABLE departments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    description TEXT
);

-- Create doctors table
CREATE TABLE doctors (
    id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    phone VARCHAR(20) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    department_id INT NOT NULL,
    FOREIGN KEY (department_id) REFERENCES departments(id)
);

-- Create patients table
CREATE TABLE patients (
    id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    date_of_birth DATE NOT NULL,
    gender ENUM('Male', 'Female', 'Other') NOT NULL,
    phone VARCHAR(20) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    address VARCHAR(255)
);

-- Create appointments table
CREATE TABLE appointments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    appointment_date DATETIME NOT NULL,
    reason TEXT,
    status ENUM('Scheduled', 'Completed', 'Cancelled') DEFAULT 'Scheduled',
    FOREIGN KEY (patient_id) REFERENCES patients(id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(id)
);

-- Create medical_records table
CREATE TABLE medical_records (
    id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    visit_date DATE NOT NULL,
    diagnosis TEXT,
    notes TEXT,
    FOREIGN KEY (patient_id) REFERENCES patients(id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(id)
);

-- Create prescriptions table
CREATE TABLE prescriptions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    record_id INT NOT NULL,
    medicine_name VARCHAR(100) NOT NULL,
    dosage VARCHAR(50),
    duration VARCHAR(50),
    FOREIGN KEY (record_id) REFERENCES medical_records(id)
);

-- Create payments table
CREATE TABLE payments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    appointment_id INT NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    payment_date DATE NOT NULL,
    payment_method ENUM('Cash', 'MPesa', 'Insurance', 'Card') NOT NULL,
    FOREIGN KEY (appointment_id) REFERENCES appointments(id)
);

-- Insert sample departments
INSERT INTO departments (name, description) VALUES
('General Medicine', 'General outpatient services'),
('Pediatrics', 'Healthcare for children'),
('Gynecology', 'Women's health'),
('Dentistry', 'Dental care');

-- Insert sample doctors
INSERT INTO doctors (full_name, phone, email, department_id) VALUES
('Dr. John Kamau', '0712345678', 'j.kamau@clinic.co.ke', 1),
('Dr. Christine Atieno', '0723456789', 'c.atieno@clinic.co.ke', 2),
('Dr. Wangari Maathai', '0734567890', 'w.maathai@clinic.co.ke', 3),
('Dr. David Ochieng', '0745678901', 'd.ochieng@clinic.co.ke', 4);

-- Insert sample patients
INSERT INTO patients (full_name, date_of_birth, gender, phone, email, address) VALUES
('Lupita Nyong'o', '1983-03-01', 'Female', '0791234567', 'l.nyongo@gmail.com', 'Kisumu'),
('Eliud Kipchoge', '1984-11-05', 'Male', '0782345678', 'e.kipchoge@gmail.com', 'Eldoret'),
('Ngugi wa Thiong'o', '1938-01-05', 'Male', '0773456789', 'n.thiongo@gmail.com', 'Limuru'),
('Tabitha Karanja', '1970-06-20', 'Female', '0764567890', 't.karanja@gmail.com', 'Nakuru');

-- Insert sample appointments
INSERT INTO appointments (patient_id, doctor_id, appointment_date, reason, status) VALUES
(1, 1, '2025-05-10 10:00:00', 'General checkup', 'Scheduled'),
(2, 2, '2025-05-11 09:30:00', 'Child vaccination', 'Completed'),
(3, 3, '2025-05-12 14:00:00', 'Routine check', 'Scheduled'),
(4, 4, '2025-05-13 11:00:00', 'Toothache', 'Scheduled');

-- Insert sample medical records
INSERT INTO medical_records (patient_id, doctor_id, visit_date, diagnosis, notes) VALUES
(2, 2, '2025-05-11', 'Measles', 'Prescribed rest and fluids'),
(3, 3, '2025-05-12', 'Hypertension', 'Monitor blood pressure'),
(1, 1, '2025-05-10', 'Mild fever', 'Paracetamol prescribed');

-- Insert sample prescriptions
INSERT INTO prescriptions (record_id, medicine_name, dosage, duration) VALUES
(1, 'Panadol', '500mg', '5 days'),
(2, 'Amlodipine', '5mg', '30 days'),
(3, 'Paracetamol', '500mg', '3 days');

-- Insert sample payments
INSERT INTO payments (appointment_id, amount, payment_date, payment_method) VALUES
(1, 1500.00, '2025-05-10', 'MPesa'),
(2, 2000.00, '2025-05-11', 'Cash'),
(3, 1800.00, '2025-05-12', 'Card');
