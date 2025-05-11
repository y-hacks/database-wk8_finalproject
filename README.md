# database-wk8_finalproject
# 🏥 Kenyan Clinic Booking System

## 📋 Project Description

The **Kenyan Clinic Booking System** is a relational database project built using MySQL. It is designed to manage patients, doctors, appointments, medical records, prescriptions, and payments in a clinical setup located in Kenya. The project includes realistic Kenyan names and follows best practices for relational database design including normalization, use of constraints, and foreign key relationships.

This system is useful for:
- Booking and tracking medical appointments
- Managing doctors and their departments
- Recording medical diagnoses and prescriptions
- Tracking patient payment history

---

## 🛠️ Technologies Used

- **MySQL** (Database Engine)
- **SQL** (DDL for creating tables and relationships)
- **Graphviz** (for ERD visualization)

---

## 🚀 Getting Started

### Prerequisites
- MySQL installed on your system
- Any MySQL GUI client (e.g., MySQL Workbench, DBeaver) or terminal access

### Installation and Setup

1. Clone the repository:
   ```bash
   https://github.com/y-hacks/database-wk8_finalproject.git
   cd kenyan-clinic-booking-system
Import the SQL schema into your MySQL server:

Open your MySQL GUI or terminal

Run the script:

sql:
    SOURCE path/to/kenyan_clinic_booking_system.sql;
# Database Schema Overview
The system contains the following core tables:

Departments: Clinic departments (e.g., Pediatrics, Surgery)

Doctors: Medical personnel, linked to departments

Patients: People who book appointments

Appointments: Scheduled visits

MedicalRecords: Diagnostic history

Prescriptions: Medicines prescribed during visits

Payments: Patient billing and payment details

# Entity-Relationship Diagram

download the image directly:
kenyan_clinic_erd.png

# Project Structure
graphql
kenyan-clinic-booking-system/
├── kenyan_clinic_booking_system.sql   # Main SQL script with table creation and sample data
├── kenyan_clinic_erd.png              # ERD diagram
└── README.md                          # Project documentation

# License
This project is licensed under the MIT License.

📞 Contact
If you'd like to suggest improvements or use this in production, feel free to reach out or fork the repository!


