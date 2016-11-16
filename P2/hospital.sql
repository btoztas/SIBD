DROP TABLE IF EXISTS region;
DROP TABLE IF EXISTS element;
DROP TABLE IF EXISTS series;
DROP TABLE IF EXISTS study;
DROP TABLE IF EXISTS equipment;
DROP TABLE IF EXISTS request;
DROP TABLE IF EXISTS appointment;
DROP TABLE IF EXISTS doctor;
DROP TABLE IF EXISTS patient;

CREATE TABLE patient
   (patient_id  VARCHAR(255),
    patient_name  VARCHAR(255),
    birthday  date,
    address  VARCHAR(255),
    PRIMARY KEY(patient_id));

CREATE TABLE doctor
   (doctor_id  VARCHAR(255),
    doctor_name  VARCHAR(255),
    specialty   VARCHAR(255),
    PRIMARY KEY(doctor_id));

CREATE TABLE appointment
   (patient_id VARCHAR(255),
    doctor_id VARCHAR(255),
    appointment_date date,
    office VARCHAR(255),
    PRIMARY KEY(patient_id, doctor_id, appointment_date),
    FOREIGN KEY(patient_id) REFERENCES patient(patient_id),
    FOREIGN KEY(doctor_id) REFERENCES doctor(doctor_id));

CREATE TABLE request
   (request_number VARCHAR(255),
    patient_id VARCHAR(255),
    doctor_id VARCHAR(255),
    appointment_date DATE,
    PRIMARY KEY(request_number),
    FOREIGN KEY(patient_id, doctor_id, appointment_date) REFERENCES appointment(patient_id, doctor_id, appointment_date));

CREATE TABLE equipment
   (manufacturer  VARCHAR(255),
    serial_number  VARCHAR(255),
    model   VARCHAR(255),
    PRIMARY KEY(manufacturer, serial_number));

CREATE TABLE study
   (request_number  VARCHAR(255),
    description  VARCHAR(255),
    study_date  date,
    doctor_id  VARCHAR(255),
    manufacturer  VARCHAR(255),
    serial_number  VARCHAR(255),
    PRIMARY KEY(request_number, description),
    FOREIGN KEY(request_number) REFERENCES request(request_number),
    FOREIGN KEY(doctor_id) REFERENCES doctor(doctor_id),
    FOREIGN KEY(manufacturer, serial_number) REFERENCES equipment(manufacturer, serial_number));

CREATE TABLE series
   (series_id  VARCHAR(255),
    series_name  VARCHAR(255),
    base_url   VARCHAR(255),
    request_number  VARCHAR(255),
    description  VARCHAR(255),
    PRIMARY KEY(series_id),
    FOREIGN KEY(request_number, description) REFERENCES study(request_number, description));

CREATE TABLE element
   (series_id  VARCHAR(255),
    elem_index  VARCHAR(255),
    PRIMARY KEY(series_id, elem_index),
    FOREIGN KEY(series_id) REFERENCES series(series_id));

CREATE TABLE region
   (series_id  VARCHAR(255),
    elem_index  VARCHAR(255),
    x1	FLOAT(4,3),
    y1	FLOAT(4,3),
    x2	FLOAT(4,3),
    y2	FLOAT(4,3),
    PRIMARY KEY(series_id, elem_index, x1, y1, x2, y2),
    FOREIGN KEY(series_id, elem_index) REFERENCES element(series_id, elem_index));
