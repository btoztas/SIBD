DROP TABLE if exists region;
DROP TABLE if exists element;
DROP TABLE if exists series;
DROP TABLE if exists study;
DROP TABLE if exists equipment;
DROP TABLE if exists request;
DROP TABLE if exists appointment;
DROP TABLE if exists doctor;
DROP TABLE if exists patient;

CREATE TABLE patient
   (patient_id  varchar(255),
    patient_name  varchar(255),
    birthday  date,
    address  varchar(255),
    PRIMARY KEY(patient_id));

CREATE TABLE doctor
   (doctor_id  varchar(255),
    doctor_name  varchar(255),
    specialty   varchar(255),
    PRIMARY KEY(doctor_id));
    
CREATE TABLE appointment
   (patient_id  varchar(255),
    doctor_id  varchar(255),
    appointment_date   date,
    office  varchar(255),
    PRIMARY KEY(patient_id, doctor_id, appointment_date),
    FOREIGN KEY(patient_id) REFERENCES patient(patient_id),
    FOREIGN KEY(doctor_id) REFERENCES doctor(doctor_id));

CREATE TABLE request
   (request_number  varchar(255),
    patient_id  varchar(255),
    doctor_id  varchar(255),
    appointment_date   date,
    PRIMARY KEY(request_number),
    FOREIGN KEY(patient_id, doctor_id, appointment_date) REFERENCES appointment(patient_id, doctor_id, appointment_date));
    
CREATE TABLE equipment
   (manufacturer  varchar(255),
    serial_number  varchar(255),
    model   varchar(255),
    PRIMARY KEY(manufacturer, serial_number));

CREATE TABLE study
   (request_number  varchar(255),
    description  varchar(255),
    study_date  date,
    doctor_id  varchar(255),
    manufacturer  varchar(255),
    serial_number  varchar(255),
    PRIMARY KEY(request_number, description),
    FOREIGN KEY(request_number) REFERENCES request(request_number),
    FOREIGN KEY(doctor_id) REFERENCES doctor(doctor_id),
    FOREIGN KEY(manufacturer, serial_number) REFERENCES equipment(manufacturer, serial_number));

CREATE TABLE series
   (series_id  varchar(255),
    series_name  varchar(255),
    base_url   varchar(255),
    request_number  varchar(255),
    description  varchar(255),
    PRIMARY KEY(series_id),
    FOREIGN KEY(request_number, description) REFERENCES study(request_number, description));

CREATE TABLE element
   (series_id  varchar(255),
    elem_index  varchar(255),
    PRIMARY KEY(series_id, elem_index),
    FOREIGN KEY(series_id) REFERENCES series(series_id));
     
CREATE TABLE region
   (series_id  varchar(255),
    elem_index  varchar(255),
    x1	float(4,3),
    y1	float(4,3),
    x2	float(4,3),
    y2	float(4,3),
    PRIMARY KEY(series_id, elem_index, x1, y1, x2, y2),
    FOREIGN KEY(series_id, elem_index) REFERENCES element(series_id, elem_index));
