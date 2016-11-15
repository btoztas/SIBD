drop table if exists region;
drop table if exists element;
drop table if exists series;
drop table if exists study;
drop table if exists equipment;
drop table if exists request;
drop table if exists appointment;
drop table if exists doctor;
drop table if exists patient;

create table patient
   (patient_id  varchar(255),
    patient_name  varchar(255),
    birthday  date,
    address  varchar(255),
    primary key(patient_id));

create table doctor
   (doctor_id  varchar(255),
    doctor_name  varchar(255),
    specialty   varchar(255),
    primary key(doctor_id));
    
create table appointment
   (patient_id  varchar(255),
    doctor_id  varchar(255),
    appointment_date   date,
    office  varchar(255),
    primary key(patient_id, doctor_id, appointment_date),
    foreign key(patient_id) references patient(patient_id),
    foreign key(doctor_id) references doctor(doctor_id));

create table request
   (request_number  varchar(255),
    patient_id  varchar(255),
    doctor_id  varchar(255),
    appointment_date   date,
    primary key(request_number),
    foreign key(patient_id, doctor_id, appointment_date) references appointment(patient_id, doctor_id, appointment_date));
    
create table equipment
   (manufacturer  varchar(255),
    serial_number  varchar(255),
    model   varchar(255),
    primary key(manufacturer, serial_number));

create table study
   (request_number  varchar(255),
    description  varchar(255),
    study_date  date,
    doctor_id  varchar(255),
    manufacturer  varchar(255),
    serial_number  varchar(255),
    primary key(request_number, description),
    foreign key(request_number) references request(request_number),
    foreign key(doctor_id) references doctor(doctor_id),
    foreign key(manufacturer, serial_number) references equipment(manufacturer, serial_number));

create table series
   (series_id  varchar(255),
    series_name  varchar(255),
    base_url   varchar(255),
    request_number  varchar(255),
    description  varchar(255),
    primary key(series_id),
    foreign key(request_number, description) references study(request_number, description));

create table element
   (series_id  varchar(255),
    elem_index  varchar(255),
    primary key(series_id, elem_index),
    foreign key(series_id) references series(series_id));
     
create table region
   (series_id  varchar(255),
    elem_index  varchar(255),
    x1	float(10,2),
    y1	float(10,2),
    x2	float(10,2),
    y2	float(10,2),
    primary key(series_id, elem_index, x1, y1, x2, y2),
    foreign key(series_id, elem_index) references element(series_id, elem_index));
