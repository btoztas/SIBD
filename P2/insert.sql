insert into patient values ('1', 'Adams', '1968-03-12', 'Tumming Road');
insert into patient values ('2', 'Brooks',  '1983-01-04', 'Sparrow Road');
insert into patient values ('3', 'Curry',  '1984-07-21', 'Beyoncé Road');
insert into patient values ('4', 'Glenn',  '1974-07-16', 'Joplin Road');
insert into patient values ('5', 'Green', '1966-11-12', 'Irving Road');
insert into patient values ('6', 'Hayes',  '1970-12-24', 'Jonas Road');
insert into patient values ('7', 'Jackson', '1991-02-02', 'Mark Road');
insert into patient values ('8', 'Turner', '1963-07-09', 'Pogba Road');

insert into doctor values ('1', 'Morgan', 'clinical');
insert into doctor values ('2', 'Albert',  'technical');
insert into doctor values ('3', 'Lindsay',  'clinical');
insert into doctor values ('4', 'Ivan',  'clinical');
insert into doctor values ('5', 'Jessica', 'clinical');
insert into doctor values ('6', 'Steven',  'technical');
insert into doctor values ('7', 'Jay', 'clinical');
insert into doctor values ('8', 'Kelly', 'technical');

insert into equipment values ('Johnson & Johnson', 'N9TT-9G0A-B7FQ-RANC', '509-GPG1');
insert into equipment values ('Philips', 'QK6A-JI6S-7ETR-0A6C',  '355-S34D');
insert into equipment values ('Medtronic Inc.', 'SXFP-CHYK-ONI6-S89U',  '234-PT63');
insert into equipment values ('Siemens AG', 'XNSS-HSJW-3NGU-8XTJ',  '175-FK99');
insert into equipment values ('Baxter International Inc.', 'NHLE-L6MI-4GE4-ETEV', '090-KXZB');
insert into equipment values ('Philips', '6ETI-UIL2-9WAX-XHYO',  '459-J7CM');
insert into equipment values ('Philips', '2E62-E3SR-33FI-XHV3', '539-PMMB');
insert into equipment values ('Johnson & Johnson', '7EIQ-72IU-2YNV-3L4Y', '579-Y7X6');

insert into appointment values ('7', '5', '2016-11-10', 'Fernando Pessoa');
insert into appointment values ('5', '5',  '2016-11-10', 'Luís de Camões');
insert into appointment values ('6', '6',  '2016-11-15', 'Vergilio Ferreira');
insert into appointment values ('3', '5',  '2016-11-11', 'Eça de Queiroz');
insert into appointment values ('8', '1', '2016-11-11', 'Fernando Pessoa');
insert into appointment values ('3', '4',  '2016-11-15', 'Fernando Pessoa');
insert into appointment values ('2', '4', '2016-11-12', 'Antero de Quental');
insert into appointment values ('4', '4', '2016-11-13', 'Eduardo Lourenço');
insert into appointment values ('3', '5', '2016-11-11', 'Antero de Quental');
insert into appointment values ('4', '3',  '2016-11-14', 'Fernando Pessoa');
insert into appointment values ('6', '3',  '2016-11-15', 'Eduardo Lourenço');
insert into appointment values ('6', '6',  '2016-11-15', 'Fernando Pessoa');
insert into appointment values ('3', '4', '2016-11-15', 'Virgilio Ferreira');
insert into appointment values ('6', '5',  '2016-11-15', 'Luis de Camões');
insert into appointment values ('1', '5', '2016-11-16', 'Eduardo Lourenço');
insert into appointment values ('7', '3', '2016-11-16', 'Antero de Quental');

insert into request values ('1', '7', '5', '2016-11-10');
insert into request values ('2', '5', '5',  '2016-11-10');
insert into request values ('3', '3', '5',  '2016-11-11');
insert into request values ('4', '3', '5',  '2016-11-11');
insert into request values ('5', '8', '1', '2016-11-11');
insert into request values ('6', '3', '5',  '2016-11-11');
insert into request values ('7', '8', '1', '2016-11-11');
insert into request values ('8', '4', '4', '2016-11-13');
insert into request values ('9', '6', '3', '2016-11-15');
insert into request values ('10', '3', '4',  '2016-11-15');
insert into request values ('11', '6', '3',  '2016-11-15');
insert into request values ('12', '6', '6',  '2016-11-15');
insert into request values ('13', '3', '4', '2016-11-15');
insert into request values ('14', '7', '3',  '2016-11-16');
insert into request values ('15', '1', '5', '2016-11-16');
insert into request values ('16', '7', '3', '2016-11-16');

insert into study values ('1', 'X-ray left foot', '2016-11-13', '2', 'Philips', '2E62-E3SR-33FI-XHV3');
insert into study values ('2', 'X-ray left foot', '2016-11-13', '6',  'Philips', 'QK6A-JI6S-7ETR-0A6C');
insert into study values ('3', 'X-ray left foot', '2016-11-13', '8',  'Siemens AG', 'XNSS-HSJW-3NGU-8XTJ');
insert into study values ('4', 'X-ray left foot', '2016-11-13', '6',  'Johnson & Johnson', 'N9TT-9G0A-B7FQ-RANC');
insert into study values ('5', 'X-ray left foot', '2016-11-13', '6', 'Baxter International Inc.', 'NHLE-L6MI-4GE4-ETEV');
insert into study values ('6', 'X-ray left foot', '2016-11-13', '2',  'Johnson & Johnson', 'N9TT-9G0A-B7FQ-RANC');
insert into study values ('7', 'X-ray left foot', '2016-11-13', '8', 'Siemens AG', 'XNSS-HSJW-3NGU-8XTJ');
insert into study values ('8', 'X-ray left foot', '2016-11-16', '2', 'Philips', '2E62-E3SR-33FI-XHV3');
insert into study values ('9', 'X-ray left foot', '2016-11-16', '6', 'Johnson & Johnson', '7EIQ-72IU-2YNV-3L4Y');
insert into study values ('10', 'X-ray left foot', '2016-11-18', '8',  'Philips', 'QK6A-JI6S-7ETR-0A6C');
insert into study values ('11', 'X-ray left foot', '2016-11-18', '2',  'Philips', 'QK6A-JI6S-7ETR-0A6C');
insert into study values ('12', 'X-ray left foot', '2016-11-18', '6',  'Philips', '6ETI-UIL2-9WAX-XHYO');
insert into study values ('13', 'X-ray left foot', '2016-11-18', '8', 'Johnson & Johnson', 'N9TT-9G0A-B7FQ-RANC');
insert into study values ('14', 'X-ray left foot', '2016-11-19', '2',  'Johnson & Johnson', '7EIQ-72IU-2YNV-3L4Y');
insert into study values ('15', 'X-ray left foot', '2016-11-19', '6', 'Medtronic Inc.', 'SXFP-CHYK-ONI6-S89U');
insert into study values ('16', 'X-ray left foot', '2016-11-19', '2', 'Philips', '6ETI-UIL2-9WAX-XHYO');
insert into study values ('4', 'X-ray right foot', '2016-11-13', '8', 'Johnson & Johnson', 'N9TT-9G0A-B7FQ-RANC');
insert into study values ('7', 'X-ray right foot', '2016-11-13', '6',  'Philips', 'QK6A-JI6S-7ETR-0A6C');
insert into study values ('14', 'X-ray right foot', '2016-11-19', '6', 'Philips', '6ETI-UIL2-9WAX-XHYO');
insert into study values ('3', 'X-ray right foot', '2016-11-13', '8', 'Siemens AG', 'XNSS-HSJW-3NGU-8XTJ');

insert into series values ('1', 'Serie A', 'http://www.medic.db/seriea', '2', 'X-ray left foot');
insert into series values ('2', 'Serie B', 'http://www.medic.db/serieb', '2', 'X-ray left foot');
insert into series values ('3', 'Serie C', 'http://www.medic.db/seriec', '2', 'X-ray left foot');
insert into series values ('4', 'Serie D', 'http://www.medic.db/seried', '5', 'X-ray left foot');
insert into series values ('5', 'Serie E', 'http://www.medic.db/seriee', '5', 'X-ray left foot');
insert into series values ('6', 'Serie F', 'http://www.medic.db/serief', '6', 'X-ray left foot');
insert into series values ('7', 'Serie G', 'http://www.medic.db/serieg', '6', 'X-ray left foot');
insert into series values ('8', 'Serie H', 'http://www.medic.db/serieh', '6', 'X-ray left foot');
insert into series values ('9', 'Serie I', 'http://www.medic.db/seriei', '6', 'X-ray left foot');
insert into series values ('10', 'Serie J', 'http://www.medic.db/seriej', '10', 'X-ray left foot');
insert into series values ('11', 'Serie K', 'http://www.medic.db/seriek', '11', 'X-ray left foot');
insert into series values ('12', 'Serie L', 'http://www.medic.db/seriel', '11', 'X-ray left foot');
insert into series values ('13', 'Serie M', 'http://www.medic.db/seriem', '11', 'X-ray left foot');
insert into series values ('14', 'Serie N', 'http://www.medic.db/serien', '15', 'X-ray left foot');
insert into series values ('15', 'Serie O', 'http://www.medic.db/serieo', '15', 'X-ray left foot');
insert into series values ('16', 'Serie P', 'http://www.medic.db/seriep', '15', 'X-ray left foot');
insert into series values ('17', 'Serie Q', 'http://www.medic.db/serieq', '15', 'X-ray left foot');
insert into series values ('18', 'Serie R', 'http://www.medic.db/serier', '4', 'X-ray right foot');
insert into series values ('19', 'Serie T', 'http://www.medic.db/seriet', '4', 'X-ray right foot');
insert into series values ('20', 'Serie U', 'http://www.medic.db/serieu', '4', 'X-ray right foot');

insert into element values ('1', '1');
insert into element values ('2', '1');
insert into element values ('3', '1');
insert into element values ('4', '1');
insert into element values ('5', '1');
insert into element values ('6', '1');
insert into element values ('7', '1');
insert into element values ('8', '1');
insert into element values ('9', '1');
insert into element values ('10', '1');
insert into element values ('11', '1');
insert into element values ('12', '1');
insert into element values ('13', '1');
insert into element values ('14', '1');
insert into element values ('15', '1');
insert into element values ('16', '1');
insert into element values ('17', '1');
insert into element values ('18', '1');
insert into element values ('19', '1');
insert into element values ('20', '2');

insert into region values ('1', '1', 0.02, 0.02, 0.5, 0.5); -- 1 e 2 dao overlap
insert into region values ('2', '1', 0.17, 0.17, 0.6, 0.6);
insert into region values ('3', '1', 0.02, 0.02, 0.10, 0.10); -- 3 e 4 nao dao overlap
insert into region values ('4', '1', 0.70, 0.70, 1, 1);
insert into region values ('5', '1', 0.01, 0.01, 0.99, 0.99); -- 5 esta contido em 6
insert into region values ('6', '1', 0.21, 0.21, 0.49, 0.49);
/*insert into region values ('3', '1', 0.21, 0.91, 0.49, 0.95);
insert into region values ('8', '1', 0.82, 0.82, 0.99, 0.99);
insert into region values ('3', '1', 0.50, 0.50, 1, 1);
insert into region values ('3', '1', 0.01, 0.01, 0.05, 0.05);
insert into region values ('8', '1', 0.78, 0.78, 0.99, 0.99);
*/

