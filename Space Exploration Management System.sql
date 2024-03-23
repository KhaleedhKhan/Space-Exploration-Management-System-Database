create database space_dbs;

drop database space_dbs;


CREATE TABLE Missions (
  mission_id INT NOT NULL IDENTITY(1,1),
  mission_name VARCHAR(255) NOT NULL,
  launch_date DATE NOT NULL,
  destination VARCHAR(255),
  status VARCHAR(255),
  funding BIGINT,  
  expenses BIGINT,  
  PRIMARY KEY (mission_id)
);

CREATE TABLE Astronauts (
  astronaut_id INT NOT NULL IDENTITY(1,1) ,
  name VARCHAR(255) NOT NULL,
  age INT,
  nationality VARCHAR(255),
  specialization VARCHAR(255),
  number_of_missions INT,
  mission_id INT,
  PRIMARY KEY (astronaut_id),
  FOREIGN KEY (mission_id) REFERENCES Missions(mission_id)
);



CREATE TABLE Spacecraft (
  id INT NOT NULL IDENTITY(1,1) ,
  name VARCHAR(255) NOT NULL,
  type VARCHAR(255) NOT NULL,
  launch_date DATE NOT NULL,
  status VARCHAR(255) NOT NULL,
  mission_id INT,
  PRIMARY KEY (id),
  FOREIGN KEY (mission_id) REFERENCES Missions(mission_id)
);


CREATE TABLE SpaceStations (
  id INT NOT NULL IDENTITY(1,1) ,
  name VARCHAR(255) NOT NULL,
  country VARCHAR(255) NOT NULL,
  launch_date DATE NOT NULL,
  orbit_type VARCHAR(255) NOT NULL,
  altitude INT NOT NULL,
  mission_id INT,
  PRIMARY KEY (id),
  FOREIGN KEY (mission_id) REFERENCES Missions(mission_id)
);
CREATE TABLE Rockets (
    RocketID INT PRIMARY KEY,
    RocketName VARCHAR(50),
    Manufacturer VARCHAR(50),
    PayloadCapacity INT,
    LaunchDate DATE,
    SuccessFailureStatus VARCHAR(50),
    mission_ID INT,
    FOREIGN KEY (mission_ID) REFERENCES Missions(mission_ID)
);




CREATE TABLE Satellites (
  id INT NOT NULL IDENTITY(1,1) ,
  name VARCHAR(255) NOT NULL,
  country VARCHAR(255) NOT NULL,
  launch_date DATE NOT NULL,
  orbit_type VARCHAR(255) NOT NULL,
  altitude INT NOT NULL,
  purpose VARCHAR(255) NOT NULL,
  mission_id INT,
  PRIMARY KEY (id),
  FOREIGN KEY (mission_id) REFERENCES Missions(mission_id)
);

CREATE TABLE Scientists (
  id INT NOT NULL IDENTITY(1,1) ,
  name VARCHAR(255) NOT NULL,
  gender VARCHAR(255) NOT NULL,
  birth_date DATE NOT NULL,
  death_date DATE,
  field VARCHAR(255) NOT NULL,
  notable_achievements VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE LaunchSites (
  id INT NOT NULL IDENTITY(1,1) ,
  name VARCHAR(255) NOT NULL,
  country VARCHAR(255) NOT NULL,
  latitude DECIMAL(10, 7) NOT NULL,
  longitude DECIMAL(10, 7) NOT NULL,
  altitude INT NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE Payloads (
  id INT NOT NULL IDENTITY(1,1),
  name VARCHAR(255) NOT NULL,
  type VARCHAR(255) NOT NULL,
  mass FLOAT NOT NULL,
  dimensions VARCHAR(255) NOT NULL,
  launch_date DATE NOT NULL,
  launch_site INT,
  rocket INT,
  status VARCHAR(255) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (launch_site) REFERENCES LaunchSites(id),
  FOREIGN KEY (rocket) REFERENCES Rockets(RocketID)
);


CREATE TABLE MissionControl (
  id INT NOT NULL IDENTITY(1,1) ,
  name VARCHAR(255) NOT NULL,
  location VARCHAR(255) NOT NULL,
  country VARCHAR(255) NOT NULL,
  latitude DECIMAL(10, 7) NOT NULL,
  longitude DECIMAL(10, 7) NOT NULL,
  altitude INT NOT NULL,
  mission_id INT,
  PRIMARY KEY (id),
  FOREIGN KEY (mission_id) REFERENCES Missions(mission_id)
);

CREATE TABLE GroundStations (
  id INT NOT NULL IDENTITY(1,1) ,
  name VARCHAR(255) NOT NULL,
  location VARCHAR(255) NOT NULL,
  country VARCHAR(255) NOT NULL,
  latitude DECIMAL(10, 7) NOT NULL,
  longitude DECIMAL(10, 7) NOT NULL,
  altitude INT NOT NULL,
  mission_id INT,
  PRIMARY KEY (id),
  FOREIGN KEY (mission_id) REFERENCES Missions(mission_id)
);

CREATE TABLE SpaceAgencies (
  id INT NOT NULL IDENTITY(1,1) ,
  name VARCHAR(255) NOT NULL,
  country VARCHAR(255) NOT NULL,
  founded DATE NOT NULL,
  budget INT NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE ExplorationPrograms (
  id INT NOT NULL IDENTITY(1,1) ,
  name VARCHAR(255) NOT NULL,
  agency_id INT NOT NULL,
  description VARCHAR(255) NOT NULL,
  start_date DATE NOT NULL,
  end_date DATE,
  PRIMARY KEY (id),
  FOREIGN KEY (agency_id) REFERENCES SpaceAgencies(id)
);

CREATE TABLE SpacecraftComponents (
  id INT NOT NULL IDENTITY(1,1) ,
  name VARCHAR(255) NOT NULL,
  description VARCHAR(255) NOT NULL,
  type VARCHAR(255) NOT NULL,
  spacecraft_id INT,
  PRIMARY KEY (id),
  FOREIGN KEY (spacecraft_id) REFERENCES Spacecraft(id)
);

CREATE TABLE MissionTimeline (
  id INT NOT NULL IDENTITY(1,1) ,
  mission_id INT,
  event_date DATE NOT NULL,
  event_description VARCHAR(255) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (mission_id) REFERENCES Missions(mission_id)
);

INSERT INTO Missions (mission_name, launch_date, destination, status, funding, expenses)
VALUES
  ('Apollo 11', '1969-07-20', 'Moon', 'Completed', 2540000000, 410000000),
  ('Apollo 13', '1970-04-11', 'Moon', 'Abandoned', 130000000, 0),
  ('Skylab 1', '1973-05-25', 'Low Earth Orbit', 'Completed', 260000000, 180000000),
  ('Space Shuttle Columbia', '1981-04-12', 'Low Earth Orbit', 'Completed', 1960000000, 1220000000),
  ('Space Shuttle Challenger', '1983-04-04', 'Low Earth Orbit', 'Destroyed', 550000000, 410000000),
  ('Space Shuttle Discovery', '1984-08-30', 'Low Earth Orbit', 'Completed', 2130000000, 1320000000),
  ('Space Shuttle Atlantis', '1985-10-08', 'Low Earth Orbit', 'Completed', 2130000000, 1320000000),
  ('Space Shuttle Endeavour', '1992-05-07', 'Low Earth Orbit', 'Completed', 2130000000, 1320000000),
  ('International Space Station', '1998-11-20', 'Low Earth Orbit', 'Active', 100000000000, 100000000000),
  ('Mars Exploration Rover Spirit', '2003-06-10', 'Mars', 'Abandoned', 450000000, 450000000),
  ('Mars Exploration Rover Opportunity', '2003-07-07', 'Mars', 'Abandoned', 450000000, 450000000),
  ('Juno', '2011-08-05', 'Jupiter', 'Active', 1100000000, 1100000000),
  ('New Horizons', '2006-01-19', 'Pluto', 'Completed', 720000000, 720000000),
  ('Perseverance', '2020-07-30', 'Mars', 'Active', 2700000000, 2700000000),
  ('Hope', '2020-07-20', 'Mars', 'Active', 200000000, 200000000),
  ('Chang''e 4', '2019-01-03', 'Moon', 'Active', 3400000000, 3400000000),
  ('Chang''e 5', '2020-12-01', 'Moon', 'Completed', 4400000000, 4400000000),
  ('Solar Orbiter', '2020-02-09', 'Sun', 'Active', 1500000000, 1500000000);


  INSERT INTO Astronauts (name, age, nationality, specialization, number_of_missions, mission_id)
VALUES
('Neil Armstrong', 38, 'United States', 'Pilot', 1, 1),
('Buzz Aldrin', 39, 'United States', 'Pilot', 1, 1),
('Michael Collins', 39, 'United States', 'Command Module Pilot', 1, 1),
('Jim Lovell', 42, 'United States', 'Commander', 1, 2),
('Fred Haise', 36, 'United States', 'Lunar Module Pilot', 1, 2),
('Jack Swigert', 38, 'United States', 'Command Module Pilot', 1, 2),
('Valentina Tereshkova', 26, 'Soviet Union', 'Cosmonaut', 1, 3),
('Alan Shepard', 47, 'United States', 'Pilot', 2, 4),
('Stuart Roosa', 37, 'United States', 'Command Module Pilot', 1, 4),
('Edgar Mitchell', 40, 'United States', 'Lunar Module Pilot', 1, 4),
('David Scott', 39, 'United States', 'Commander', 1, 5),
('James Irwin', 41, 'United States', 'Lunar Module Pilot', 1, 5),
('Alfred Worden', 39, 'United States', 'Command Module Pilot', 1, 5),
('John Young', 42, 'United States', 'Commander', 1, 6),
('Charles Duke', 36, 'United States', 'Lunar Module Pilot', 1, 6),
('Thomas Mattingly', 37, 'United States', 'Command Module Pilot', 1, 6),
('Eugene Cernan', 38, 'United States', 'Commander', 1, 7),
('Harrison Schmitt', 37, 'United States', 'Lunar Module Pilot', 1, 7),
('Ron Evans', 38, 'United States', 'Command Module Pilot', 1, 7),
('Yuri Gagarin', 27, 'Soviet Union', 'Pilot', 1, 8),
('Gherman Titov', 25, 'Soviet Union', 'Pilot', 1, 9),
('Andriyan Nikolayev', 33, 'Soviet Union', 'Pilot', 1, 10),
('Pete Conrad', 37, 'United States', 'Commander', 1, 11),
('Alan Bean', 39, 'United States', 'Lunar Module Pilot', 1, 11),
('Richard Gordon', 40, 'United States', 'Command Module Pilot', 1, 11),
('Charles Conrad', 39, 'United States', 'Commander', 1, 12),
('Joseph Kerwin', 36, 'United States', 'Science Pilot', 1, 12),
('Paul Weitz', 37, 'United States', 'Command Module Pilot', 1, 12),
('James McDivitt', 39, 'United States', 'Commander', 1, 13),
('David Scott', 37, 'United States', 'Command Module Pilot', 1, 13),
('Russell Schweickart', 37, 'United States', 'Lunar Module Pilot', 1, 13),
('Frank Borman', 41, 'United States', 'Commander', 1, 14),
('William Anders', 35, 'United States', 'Lunar Module Pilot', 1, 14),
('James Lovell', 39, 'United States', 'Command Module Pilot', 1, 14),
('Thomas Stafford', 39, 'United States', 'Commander', 1, 15),
('Vance Brand', 40, 'United States', 'Command Module Pilot', 1, 15),
('Donald Slayton', 51, 'United States', 'Docking Module Pilot', 1, 15),
('Alexei Leonov', 44, 'Soviet Union', 'Commander', 1, 16),
('Valeri Kubasov', 39, 'Soviet Union', 'Engineer', 1, 16),
('Thomas Stafford', 42, 'United States', 'Commander', 1, 17),
('Donald Slayton', 47, 'United States', 'Docking Module Pilot', 1, 17),
('Vance Brand', 43, 'United States', 'Command Module Pilot', 1, 17),
('John Young', 47, 'United States', 'Commander', 1, 18),
('Robert Crippen', 43, 'United States', 'Pilot', 1, 18);





INSERT INTO Spacecraft (name, type, launch_date, status, mission_id)
VALUES
('Apollo 11 Command Module', 'Command Module', '1969-07-16', 'Completed', 1),
('Apollo 11 Lunar Module', 'Lunar Module', '1969-07-20', 'Completed', 1),
('Apollo 13 Command Module', 'Command Module', '1970-04-11', 'Abandoned', 2),
('Apollo 13 Lunar Module', 'Lunar Module', '1970-04-13', 'Abandoned', 2),
('Skylab 1 Orbital Workshop', 'Space Station', '1973-05-25', 'Completed', 3),
('Space Shuttle Columbia Orbiter', 'Space Shuttle', '1981-04-12', 'Completed', 4),
('Space Shuttle Challenger Orbiter', 'Space Shuttle', '1983-04-04', 'Destroyed', 5),
('Space Shuttle Discovery Orbiter', 'Space Shuttle', '1984-08-30', 'Completed', 6),
('Space Shuttle Atlantis Orbiter', 'Space Shuttle', '1985-10-08', 'Completed', 7),
('Space Shuttle Endeavour Orbiter', 'Space Shuttle', '1992-05-07', 'Completed', 8),
('International Space Station Node 1', 'Space Station Module', '1998-11-20', 'Completed', 9),
('Mars Exploration Rover Spirit', 'Rover', '2003-06-10', 'Abandoned', 10),
('Mars Exploration Rover Opportunity', 'Rover', '2003-07-07', 'Abandoned', 11),
('Juno Spacecraft', 'Spacecraft', '2011-08-05', 'Active', 12),
('New Horizons Spacecraft', 'Spacecraft', '2006-01-19', 'Completed', 13),
('Perseverance Rover', 'Rover', '2020-07-30', 'Active', 14),
('Hope Orbiter', 'Orbiter', '2020-07-20', 'Active', 15),
('Chang''e 4 Lander', 'Lander', '2019-01-03', 'Active', 16),
('Chang''e 5 Orbiter', 'Orbiter', '2020-12-01', 'Completed', 17),
('Solar Orbiter', 'Spacecraft', '2020-02-09', 'Active', 18);


INSERT INTO SpaceStations (name, country, launch_date, orbit_type, altitude, mission_id)
VALUES
('Skylab', 'United States', '1973-05-25', 'Low Earth Orbit', 438, 1),
('Mir', 'Soviet Union', '1986-02-20', 'Low Earth Orbit', 254, 2),
('International Space Station', 'United States', '1998-11-20', 'Low Earth Orbit', 408, 3),
('Tiangong', 'China', '2021-04-29', 'Low Earth Orbit', 340, 4),
('Skylab 2', 'United States', '1974-05-25', 'Low Earth Orbit', 438, 5),
('Mir 2', 'Soviet Union', '1987-02-20', 'Low Earth Orbit', 254, 6),
('International Space Station 2', 'United States', '2000-11-20', 'Low Earth Orbit', 408, 7),
('Tiangong 2', 'China', '2022-04-29', 'Low Earth Orbit', 340, 8),
('Skylab 3', 'United States', '1975-05-25', 'Low Earth Orbit', 438, 9),
('Mir 3', 'Soviet Union', '1988-02-20', 'Low Earth Orbit', 254, 10),
('International Space Station 3', 'United States', '2002-11-20', 'Low Earth Orbit', 408, 11),
('Tiangong 3', 'China', '2023-04-29', 'Low Earth Orbit', 340, 12),
('Skylab 4', 'United States', '1976-05-25', 'Low Earth Orbit', 438, 13),
('Mir 4', 'Soviet Union', '1989-02-20', 'Low Earth Orbit', 254, 14),
('International Space Station 4', 'United States', '2004-11-20', 'Low Earth Orbit', 408, 15),
('Tiangong 4', 'China', '2024-04-29', 'Low Earth Orbit', 340, 16),
('Skylab 5', 'United States', '1977-05-25', 'Low Earth Orbit', 438, 17),
('Mir 5', 'Soviet Union', '1990-02-20', 'Low Earth Orbit', 254, 18);


INSERT INTO Rockets (RocketID, RocketName, Manufacturer, PayloadCapacity, LaunchDate, SuccessFailureStatus, Mission_ID)
VALUES
    (1, 'Falcon 9', 'SpaceX', 22000, '2022-01-01', 'Success', 1),
    (2, 'Atlas V', 'United Launch Alliance', 18150, '2022-02-15', 'Success', 2),
    (3, 'Delta IV Heavy', 'United Launch Alliance', 28500, '2022-03-10', 'Failure', 3),
    (4, 'GSLV Mk III', 'Indian Space Research Organization', 10000, '2022-04-20', 'Success', 4),
    (5, 'Soyuz', 'Roscosmos', 7200, '2022-05-05', 'Success', 5),
    (6, 'Long March 5', 'China National Space Administration', 25000, '2022-06-18', 'Success', 6),
    (7, 'Falcon Heavy', 'SpaceX', 64000, '2022-07-25', 'Success', 7),
    (8, 'H-IIA', 'Mitsubishi Heavy Industries', 10000, '2022-08-10', 'Failure', 8),
    (9, 'Electron', 'Rocket Lab', 300, '2022-09-05', 'Success', 9),
    (10, 'Vega', 'Arianespace', 1500, '2022-10-20', 'Success', 10),
    (11, 'PSLV', 'Indian Space Research Organization', 3200, '2022-11-15', 'Success', 11),
    (12, 'Proton', 'Roscosmos', 23500, '2022-12-01', 'Failure', 12),
    (13, 'Falcon 1', 'SpaceX', 670, '2023-01-10', 'Success', 13),
    (14, 'Zenit', 'Yuzhmash', 13150, '2023-02-15', 'Success', 14),
    (15, 'Angara A5', 'Khrunichev State Research Space Center', 24500, '2023-03-05', 'Failure', 15),
    (16, 'Pegasus', 'Northrop Grumman', 450, '2023-04-12', 'Success', 16),
    (17, 'GSLV Mk II', 'Indian Space Research Organization', 2500, '2023-05-20', 'Success', 17),
    (18, 'Ariane 5', 'Arianespace', 21000, '2023-06-08', 'Success', 18);



INSERT INTO Satellites (name, country, launch_date, orbit_type, altitude, purpose, mission_id)
VALUES
('Galileo', 'European Union', '1989-10-18', 'Geosynchronous', 23222, 'Earth observation', 1),
('Terra', 'United States', '1999-12-18', 'Sun-synchronous', 705, 'Earth observation', 2),
('Aqua', 'United States', '2002-05-04', 'Sun-synchronous', 705, 'Earth observation', 3),
('SMOS', 'European Union', '2002-11-21', 'Sun-synchronous', 705, 'Earth observation', 4),
('Cryosat', 'European Union', '2005-03-27', 'Polar', 786, 'Ice observation', 5),
('GOCE', 'European Union', '2009-03-17', 'Polar', 255, 'Gravity field observation', 6),
('Jason-1', 'United States', '2001-01-12', 'Oceanography', 1336, 'Oceanography', 7),
('Jason-2', 'United States', '2008-06-20', 'Oceanography', 1336, 'Oceanography', 8),
('TerraSAR-X', 'Germany', '2007-02-15', 'Polar', 514, 'Earth observation', 9),
('TanDEM-X', 'Germany', '2010-04-21', 'Polar', 35786, 'Earth observation', 10),
('Sentinel-1A', 'European Union', '2014-03-31', 'Polar', 695, 'Earth observation', 11),
('Sentinel-1B', 'European Union', '2016-03-25', 'Polar', 695, 'Earth observation', 12),
('Sentinel-2A', 'European Union', '2015-06-23', 'Sun-synchronous', 786, 'Earth observation', 13),
('Sentinel-3A', 'European Union', '2016-02-22', 'Polar', 1100, 'Oceanography', 14),
('Sentinel-3B', 'European Union', '2018-04-25', 'Polar', 1100, 'Oceanography', 15),
('ALOS-2', 'Japan', '2014-05-22', 'Polar', 681, 'Earth observation', 16),
('Gaia', 'European Union', '2013-12-19', 'Heliocentric', 1500000, 'Astrometry', 17),
('Planck', 'European Union', '2009-05-14', 'Heliocentric', 1500000, 'Cosmology', 18)


INSERT INTO Scientists (name, gender, birth_date, death_date, field, notable_achievements)
VALUES
('Neil Armstrong', 'Male', '1930-08-05', '2012-08-25', 'Aeronautics', 'First person to walk on the Moon'),
('Buzz Aldrin', 'Male', '1930-03-02', '2019-01-20', 'Aeronautics', 'Second person to walk on the Moon'),
('Michael Collins', 'Male', '1930-10-30', '2021-04-28', 'Aeronautics', 'Command Module Pilot on Apollo 11'),
('John Glenn', 'Male', '1921-07-18', '2016-12-08', 'Aeronautics', 'First American to orbit the Earth'),
('Sally Ride', 'Female', '1951-03-26', '2012-07-23', 'Aeronautics', 'First American woman in space'),
('Valentina Tereshkova', 'Female', '1937-03-16',NULL , 'Aeronautics', 'First woman in space'),
('Yuri Gagarin', 'Male', '1934-03-09', '1968-03-27', 'Aeronautics', 'First person in space'),
('Alan Shepard', 'Male', '1923-09-14', '1998-07-21', 'Aeronautics', 'First American in space'),
('Ed White', 'Male', '1930-03-03', '1967-01-27', 'Aeronautics', 'First American to walk in space'),
('Buzz Grissom', 'Male', '1926-03-03', '1967-01-27', 'Aeronautics', 'First American to die in a space accident'),
('Virgil Grissom', 'Male','1926-03-03', '1967-01-27', 'Aeronautics', 'First American to die in a space accident'),
('Roger Chaffee', 'Male', '1930-03-03', '1967-01-27', 'Aeronautics', 'First American to die in a space accident'),
('Alan Bean', 'Male', '1932-03-15', '2018-05-26', 'Aeronautics', 'Command Module Pilot on Apollo 12'),
('Charles Duke', 'Male', '1935-10-3',NULL , 'Aeronautics', 'Lunar Module Pilot on Apollo 16'),
('Harrison Schmitt', 'Male', '1935-08-30',NULL, 'Geology', 'Geologist on Apollo 17'),
('Eugene Cernan', 'Male', '1934-03-27', '2017-01-16', 'Aeronautics', 'Last person to walk on the Moon'),
('Jack Schmitt', 'Male', '1935-08-30',NULL , 'Geology', 'Geologist on Apollo 17');


INSERT INTO LaunchSites (name, country, latitude, longitude, altitude)
VALUES
('Cape Canaveral Air Force Station', 'United States', 28.537289, -80.685197, 0),
('Vandenberg Air Force Base', 'United States', 34.672728, -120.677457, 0),
('Jiuquan Satellite Launch Center', 'China', 40.465721, 104.089745, 1545),
('Baikonur Cosmodrome', 'Kazakhstan', 46.557056, 63.405278, 1500),
('Satish Dhawan Space Centre', 'India', 13.0625, 80.140278, 0),
('European Spaceport', 'French Guiana', 5.5, -52.2, 0),
('Kura Space Center', 'Russia', 60.0625, 169.3125, 0),
('Xichang Satellite Launch Center', 'China', 28.215722, 99.865278, 3216),
('Tonopah Test Range', 'United States', 37.223482, -115.584666, 0),
('White Sands Missile Range', 'United States', 32.334444, -106.458333, 0),
('Svobodny Cosmodrome', 'Russia', 47.775, 126.974444, 0),
('Sary Shagan Test Range', 'Kazakhstan', 45.65, 71.766667, 0),
('Plomerussa Air Base', 'Netherlands', 52.708889, 4.885278, 0),
('Mid-Atlantic Regional Spaceport', 'United States', 37.175, -76.197222, 0),
('Andøya Space Center', 'Norway', 69.217222, 15.662222, 0),
('Esrange Space Center', 'Sweden', 66.551389, 20.738611, 0),
('Kiruna Spaceport', 'Sweden', 67.85, 20.716667, 0),
('New Zealand Space Agency Launch Site', 'New Zealand', -43.5, 172.5, 0);

INSERT INTO Payloads (name, type, mass, dimensions, launch_date, launch_site, rocket, status)
VALUES
('Galileo', 'Spacecraft', 2, '1.8 x 1.8 x 2.2 meters', '1989-10-18', 1, 1, 'Launched'),
('Hubble Space Telescope', 'Space telescope', 11, '4.3 x 11.5 x 4.5 meters', '1990-04-24', 2, 2, 'Launched'),
('Chandra X-ray Observatory', 'Space telescope', 8.4, '1.4 x 4.2 x 1.2 meters', '1999-07-23', 3, 3, 'Launched'),
('Spitzer Space Telescope', 'Space telescope', 8.5, '1.5 x 4.2 x 1.4 meters', '2003-08-25', 4, 4, 'Launched'),
('New Horizons', 'Spacecraft', 10, '4.7 x 2.2 x 2.1 meters', '2006-01-19', 5, 5, 'Launched'),
('Juno', 'Spacecraft', 3.6, '4.2 x 1.5 x 1.2 meters', '2011-08-05', 6, 6, 'Launched'),
('Perseverance', 'Rover', 1.025, '1.8 x 1.0 x 2.7 meters', '2020-07-30', 7, 7, 'Launched'),
('InSight', 'Rover', 850, '1.6 x 1.4 x 1.5 meters', '2018-11-26', 8, 8, 'Launched'),
('OSIRIS-REx', 'Sample return spacecraft', 2.1, '4.5 x 2.1 x 2.1 meters', '2016-10-27', 9, 9, 'Launched'),
('DART', 'Double Asteroid Redirection Test', 5.5, '2.3 x 1.2 x 1.2 meters', '2021-10-23', 10, 10, 'Launched'),
('James Webb Space Telescope', 'Space telescope', 6.5, '6.5 x 14.3 x 4.2 meters', '2021-12-25', 11, 11, 'Launched'),
('Lunar Gateway', 'Space station', 45, '70 x 70 x 30 meters', '2024-01-01', 12, 12, 'Under construction'),
('Space Launch System', 'Rocket', 2, '122.2 meters', '2022-01-01', 13, 13, 'Under development'),
('SpaceX Starship', 'Rocket', 120, '120 meters', '2023-01-01', 14, 14, 'Under development'),
('New Glenn', 'Rocket', 7, '95 meters', '2024-01-01', 15, 15, 'Under development'),
('Ariane 6', 'Rocket', 6.7, '68 meters', '2022-01-01', 16, 16, 'Under development'),
('Falcon 9', 'Rocket', 1.6, '70 meters', '2010-01-01', 17, 17, 'In service'),
('Falcon Heavy', 'Rocket', 27, '122 meters', '2018-01-01', 18, 18, 'In service');


INSERT INTO MissionControl (name, location, country, latitude, longitude, altitude, mission_id)
VALUES
('Kennedy Space Center', 'Cape Canaveral, Florida', 'United States', 28.5774, -80.6501, 0, 1),
('Johnson Space Center', 'Houston, Texas', 'United States', 29.7509, -95.3695, 0, 2),
('European Space Agency''s Kourou Space Center', 'Kourou, French Guiana', 'France', 5.2222, -52.2222, 0, 3),
('Jiuquan Satellite Launch Center', 'Jiuquan, Gansu', 'China', 40.4000, 96.7000, 0, 4),
('Baikonur Cosmodrome', 'Kazakhstan', 'Kazakhstan', 46.6000, 63.3000, 0, 5),
('Satish Dhawan Space Centre', 'Sriharikota, Andhra Pradesh', 'India', 13.7469, 80.2234, 0, 6),
('Vandenberg Air Force Base', 'Vandenberg, California', 'United States', 34.6342, -120.6018, 0, 7),
('Pleasington Launch Site', 'Pleasanton, California', 'United States', 37.7760, -122.0878, 0, 8),
('White Sands Missile Range', 'Alamogordo, New Mexico', 'United States', 32.4838, -106.3850, 0, 9),
('Wallops Flight Facility', 'Wallops Island, Virginia', 'United States', 37.9085, -75.3800, 0, 10),
('Esrange Space Center', 'Kiruna, Sweden', 'Sweden', 67.8833, 20.2167, 0, 11),
('Andøya Space Center', 'Andøya, Norway', 'Norway', 69.2500, 16.0000, 0, 12),
('New Mexico Spaceport', 'Spaceport America, New Mexico', 'United States', 32.7945, -106.0456, 0, 13),
('Mid-Atlantic Regional Spaceport', 'Wallops Island, Virginia', 'United States', 37.9085, -75.3800, 0, 14),
('Spaceport Cornwall', 'Newquay, Cornwall', 'United Kingdom', 49.8500, -5.9500, 0, 15),
('Spaceport Sweden', 'Kumlinge, Aland Islands', 'Sweden', 60.1167, 19.9167, 0, 16),
('Spaceport Sweden', 'Kiruna, Sweden', 'Sweden', 67.8833, 20.2167, 0, 17),
('Spaceport Japan', 'Abashiri, Hokkaido', 'Japan', 43.9333, 143.8333, 0, 18);


INSERT INTO GroundStations (name, location, country, latitude, longitude, altitude, mission_id)
VALUES
('Goldstone Deep Space Communications Complex', 'Barstow, California', 'United States', 35.2025, -116.8278, 0, 1),
('Madrid Deep Space Communications Complex', 'Madrid, Spain', 'Spain', 40.4167, -3.7000, 0, 2),
('Canberra Deep Space Communications Complex', 'Canberra, Australia', 'Australia', -35.2833, 149.1250, 0, 3),
('Parkes Observatory', 'Parkes, New South Wales', 'Australia', -33.5833, 147.8667, 0, 4),
('DSS-43', 'Ushuaia, Argentina', 'Argentina', -54.8333, -67.9500, 0, 5),
('DSS-6', 'Boca Chica, Puerto Rico', 'Puerto Rico', 18.4667, -65.5667, 0, 6),
('DSS-14', 'Cebreros, Spain', 'Spain', 40.5000, -4.4667, 0, 7),
('DSS-16', 'Medicina, Italy', 'Italy', 44.6667, 11.2667, 0, 8),
('DSS-17', 'Goldstone, California', 'United States', 35.2025, -116.8278, 0, 9),
('DSS-18', 'Shobdon, United Kingdom', 'United Kingdom', 52.2500, -2.8833, 0, 10),
('DSS-24', 'Yokosuka, Japan', 'Japan', 35.2833, 139.6250, 0, 11),
('DSS-25', 'Canberra, Australia', 'Australia', -35.2833, 149.1250, 0, 12),
('DSS-26', 'Goldstone, California', 'United States', 35.2025, -116.8278, 0, 13),
('DSS-27', 'Madrid, Spain', 'Spain', 40.4167, -3.7000, 0, 14),
('DSS-28', 'Canberra, Australia', 'Australia', -35.2833, 149.1250, 0, 15),
('DSS-34', 'Cebreros, Spain', 'Spain', 40.5000, -4.4667, 0, 16),
('DSS-36', 'Medicina, Italy', 'Italy', 44.6667, 11.2667, 0, 17),
('DSS-46', 'Shobdon, United Kingdom', 'United Kingdom', 52.2500, -2.8833, 0, 18);


INSERT INTO SpaceAgencies (name, country, founded, budget)
VALUES
('NASA', 'United States', '1958-07-29', 22.621),
('Roscosmos', 'Russia', '1992-01-01', 7.6),
('ESA', 'Europe', '1975-03-15', 6.7),
('JAXA', 'Japan', '2003-01-01', 4.5),
('ISRO', 'India', '1972-08-15', 2.4),
('CSA', 'Canada', '1969-01-01', 2.2),
('CASC', 'China', '1993-01-01', 1.9),
('CNES', 'France', '1962-01-01', 1.8),
('ASI', 'Italy', '1981-01-01', 1.6),
('UKSA', 'United Kingdom', '1964-01-01', 1.5),
('DNEOS', 'South Korea', '2006-01-01', 1.4),
('AEB', 'Brazil', '1961-01-01', 1.3),
('Arianespace', 'Europe', '1980-01-01', 1.2),
('SpaceX', 'United States', '2002-06-28', 1.1),
('Blue Origin', 'United States', '2000-09-06', 1.0),
('Virgin Galactic', 'United Kingdom', '2004-09-04', 0.9),
('OneWeb', 'United Kingdom', '2012-09-01', 0.8);


INSERT INTO ExplorationPrograms (name, agency_id, description, start_date, end_date)
VALUES
('Project Apollo', 1, 'A program to land humans on the Moon and return them safely to Earth.', '1961-09-17', '1972-12-14'),
('Project Gemini', 1, 'A program to test the technologies and procedures needed for human spaceflight.', '1961-03-23', '1966-12-15'),
('Project Mercury', 1, 'A program to put humans into space and return them safely to Earth.', '1958-04-05', '1963-05-25'),
('International Space Station', 2, 'A large spacecraft in low Earth orbit that is a joint project of 15 countries.', '1998-11-20', '9999-12-31'),
('Lunar Exploration Program', 3, 'A program to explore the Moon.', '1973-01-01', '9999-12-31'),
('Venus Exploration Program', 3, 'A program to explore Venus.', '1962-01-01', '9999-12-31'),
('Mars Exploration Program', 3, 'A program to explore Mars.', '1960-01-01', '9999-12-31'),
('Jupiter Exploration Program', 3, 'A program to explore Jupiter.', '1973-01-01', '9999-12-31'),
('Saturn Exploration Program', 3, 'A program to explore Saturn.', '1973-01-01', '9999-12-31'),
('Uranus Exploration Program', 3, 'A program to explore Uranus.', '1973-01-01', '9999-12-31'),
('Neptune Exploration Program', 3, 'A program to explore Neptune.', '1973-01-01', '9999-12-31'),
('Pluto Exploration Program', 3, 'A program to explore Pluto.', '1973-01-01', '9999-12-31'),
('Comet Exploration Program', 3, 'A program to explore comets.', '1973-01-01', '9999-12-31'),
('Asteroid Exploration Program', 3, 'A program to explore asteroids.', '1973-01-01', '9999-12-31'),
('Deep Space Exploration Program', 3, 'A program to explore deep space.', '1973-01-01', '9999-12-31'),
('Space Shuttle Program', 1, 'A program to launch and retrieve spacecraft from low Earth orbit.', '1981-04-12', '2011-07-21'),
('Orion Program', 1, 'A program to develop a new spacecraft that can carry humans to the Moon and beyond.', '2005-10-02', '9999-12-31'),
('Space Launch System', 1, 'A program to develop a new rocket that can launch heavy payloads into space.', '2011-06-20', '9999-12-31');


INSERT INTO SpacecraftComponents (name, description, type, spacecraft_id)
VALUES
('Space Shuttle Orbiter', 'The Space Shuttle Orbiter is the reusable spacecraft that was used to launch and retrieve other spacecraft from low Earth orbit.', 'Spacecraft', 1),
('Space Shuttle Solid Rocket Boosters', 'The Space Shuttle Solid Rocket Boosters are the two large rockets that provide the majority of the thrust for the Space Shuttle launch.', 'Rocket Boosters', 1),
('Space Shuttle External Tank', 'The Space Shuttle External Tank is the large tank that provides the liquid hydrogen and oxygen fuel for the Space Shuttle engines.', 'Tank', 1),
('International Space Station', 'The International Space Station is a large spacecraft in low Earth orbit that is a joint project of 15 countries.', 'Spacecraft', 2),
('Hubble Space Telescope', 'The Hubble Space Telescope is a large space telescope that is used to observe objects in space.', 'Telescope', 3),
('Galileo Spacecraft', 'The Galileo Spacecraft was used to explore Jupiter and its moons.', 'Spacecraft', 4),
('Voyager 1', 'The Voyager 1 spacecraft is the farthest human-made object from Earth. It is currently in interstellar space.', 'Spacecraft', 5),
('Voyager 2', 'The Voyager 2 spacecraft is the second farthest human-made object from Earth. It is currently in the Kuiper Belt.', 'Spacecraft', 6),
('Pioneer 10', 'The Pioneer 10 spacecraft was the first human-made object to fly past Jupiter.', 'Spacecraft', 7),
('Pioneer 11', 'The Pioneer 11 spacecraft was the first human-made object to fly past Saturn.', 'Spacecraft', 8),
('New Horizons', 'The New Horizons spacecraft was the first human-made object to fly past Pluto.', 'Spacecraft', 9),
('Juno', 'The Juno spacecraft is currently orbiting Jupiter. It is the first spacecraft to study Jupiter''s atmosphere in detail.', 'Spacecraft', 10),
('Curiosity', 'The Curiosity rover is currently exploring Mars. It is the first rover to use a drill to collect samples from the Martian surface.', 'Rover', 11),
('Opportunity', 'The Opportunity rover explored Mars for over 15 years. It was the longest-serving rover on Mars.', 'Rover', 12),
('Spirit', 'The Spirit rover explored Mars for over six years. It was the second longest-serving rover on Mars.', 'Rover', 13),
('Perseverance', 'The Perseverance rover is currently exploring Mars. It is the first rover to search for signs of ancient life on Mars.', 'Rover', 14),
('Ingenuity', 'The Ingenuity helicopter is the first helicopter to fly on Mars. It is currently flying on Mars to test the feasibility of using helicopters for exploration.', 'Helicopter', 15),
('Dragon', 'The Dragon spacecraft is a reusable spacecraft that is used to transport cargo to and from the International Space Station.', 'Spacecraft', 16),
('Starliner', 'The Starliner spacecraft is a reusable spacecraft that is under development by Boeing. It is designed to transport astronauts to and from the International Space Station.', 'Spacecraft', 17);


INSERT INTO MissionTimeline (mission_id, event_date, event_description)
VALUES
  (1, '1969-07-20', 'Apollo 11 - Moon Landing'),
  (1, '1969-07-24', 'Apollo 11 - Splashdown'),
  (2, '1970-04-11', 'Apollo 13 - Abandoned'),
  (3, '1973-05-25', 'Skylab 1 - Mission Start'),
  (3, '1974-02-08', 'Skylab 1 - Mission End'),
  (4, '1981-04-12', 'Space Shuttle Columbia - Launch'),
  (4, '1981-04-14', 'Space Shuttle Columbia - First Landing'),
  (5, '1983-04-04', 'Space Shuttle Challenger - Launch'),
  (5, '1986-01-28', 'Space Shuttle Challenger - Disaster'),
  (6, '1984-08-30', 'Space Shuttle Discovery - Launch'),
  (6, '1988-09-18', 'Space Shuttle Discovery - Final Landing'),
  (7, '1985-10-08', 'Space Shuttle Atlantis - Launch'),
  (7, '2011-07-21', 'Space Shuttle Atlantis - Final Landing'),
  (8, '1992-05-07', 'Space Shuttle Endeavour - Launch'),
  (8, '2011-06-01', 'Space Shuttle Endeavour - Final Landing'),
  (9, '1998-11-20', 'International Space Station - Start of Assembly'),
  (10, '2003-06-10', 'Mars Exploration Rover Spirit - Mission Start'),
  (10, '2010-05-25', 'Mars Exploration Rover Spirit - Mission End'),
  (11, '2003-07-07', 'Mars Exploration Rover Opportunity - Mission Start'),
  (11, '2018-06-11', 'Mars Exploration Rover Opportunity - Mission End'),
  (12, '2011-08-05', 'Juno - Arrival at Jupiter'),
  (13, '2006-01-19', 'New Horizons - Pluto Flyby'),
  (14, '2020-07-30', 'Perseverance - Mars Landing'),
  (15, '2020-07-20', 'Hope - Mars Arrival'),
  (16, '2019-01-03', 'Chang''e 4 - Moon Landing'),
  (17, '2020-12-01', 'Chang''e 5 - Moon Sample Return'),
  (18, '2020-02-09', 'Solar Orbiter - Launch');

--1.Retrieve the details of all missions.
select * from missions;

--2.Retrieve the details of all astronauts.
select * from Astronauts;
 
--3.Retrieve the details of all spacecraft.
select * from spacecraft;
 
--4.Retrieve the details of all space stations.
select * from spacestations;
 
--5.Retrieve the details of all rockets.
select * from rockets;
 
--6.Retrieve the details of all satellites.
select * from satellites;

--7.Retrieve the details of the missions that are completed.
SELECT * FROM missions WHERE status = 'completed';

--8.Retrieve the details of the missions to the Moon.
SELECT * FROM missions WHERE destination = 'Moon';

--9.Retrieve the details of the missions to Mars.
SELECT * FROM missions WHERE destination = 'Mars';

--10.Retrieve the details of the missions to Jupiter.
SELECT * FROM missions WHERE destination = 'Jupiter';

--11.Retrieve the details of the missions to Pluto.
SELECT * FROM missions WHERE destination = 'Pluto';

--12.Retrieve the details of the missions to the Sun.
SELECT * FROM missions WHERE destination = 'Sun';

--13.Retrieve the details of the astronauts who have been on multiple missions.
 SELECT a.astronaut_id, a.name, a.number_of_missions
FROM Astronauts a
WHERE a.number_of_missions > 1;

--14.Retrieve the details of the astronauts from the United States.
SELECT *
FROM Astronauts
WHERE nationality = 'United States';

--15.Retrieve the details of the astronauts who specialize in spacewalks.
SELECT *
FROM Astronauts
WHERE specialization = 'Pilot'

--16.Retrieve the total number of missions for each astronaut.
SELECT name, SUM(number_of_missions) AS total_missions
FROM Astronauts
GROUP BY name

--17.Retrieve the details of the spacecraft used in each mission.
SELECT m.mission_name, m.launch_date AS mission_date, m.destination, s.name AS spacecraft_name, s.status
FROM Missions m
JOIN Spacecraft s ON m.mission_id = s.mission_id

--18.Retrieve the details of the space stations where missions were conducted.
SELECT m.mission_name, ss.name, ss.country
FROM Missions m
JOIN SpaceStations ss ON m.mission_id = ss.mission_id;

--19.Retrieve the details of the rockets used in each mission.
SELECT m.mission_name, r.RocketName
FROM Missions m
JOIN Rockets r ON m.mission_ID = r.mission_ID;

--20.Retrieve the details of the satellites launched by the United States.
SELECT name, launch_date, orbit_type, purpose
FROM Satellites
WHERE country = 'United States';

--21.Retrieve the details of the satellites launched after a certain date.
SELECT name, launch_date, orbit_type, purpose
FROM Satellites
WHERE launch_date > '2006-01-29';

--22.Retrieve the total number of satellites for each country.
SELECT country, COUNT(*) AS total_satellites
FROM Satellites
GROUP BY country;

--23.Retrieve the total funding for all missions.
SELECT SUM(funding) AS total_funding
FROM Missions;

--24.Retrieve the total expenses for all missions.
SELECT SUM(expenses) AS total_expenses
FROM Missions;

--25.Retrieve the total funding for each celestial body.
SELECT m.destination AS celestial_body, SUM(m.funding) AS total_funding
FROM Missions m
GROUP BY m.destination;

--26.Retrieve the average funding for missions to the Moon.
SELECT AVG(funding) AS average_funding
FROM Missions
WHERE destination = 'Moon';

--27.Retrieve the average expenses for missions to Mars.
SELECT AVG(expenses) AS average_expenses
FROM Missions
WHERE destination = 'Mars';

--28.Retrieve the average funding and expenses for each destination.
SELECT destination, AVG(funding) AS average_funding, AVG(expenses) AS average_expenses
FROM Missions
GROUP BY destination;

--29.Retrieve the details of the latest mission launched.
SELECT TOP 1 mission_name, launch_date, destination, status, funding, expenses
FROM Missions
ORDER BY launch_date DESC;

--30.Retrieve the details of the oldest mission launched.
SELECT TOP 1 mission_name, launch_date, destination, status, funding, expenses
FROM Missions
ORDER BY launch_date ASC;

--31.Create a view to display the details of all completed missions.
CREATE VIEW CompletedMissionsView AS
SELECT mission_name, launch_date, destination, status, funding, expenses
FROM Missions
WHERE status = 'Completed';

--32.Create a view to display the details of all active missions.
CREATE VIEW ActiveMissionsView AS
SELECT mission_name, launch_date, destination, status, funding, expenses
FROM Missions
WHERE status = 'Active';

--33.Create a view to display the details of all astronauts from the United States.
CREATE VIEW AstronautsUSView AS
SELECT *
FROM Astronauts
WHERE nationality = 'United States';

--34.Create a view to display the details of all astronauts specializing in spacewalks.
CREATE VIEW AstronautsSpacewalkView AS
SELECT *
FROM Astronauts
WHERE specialization = 'Spacewalk';

--35.Create a trigger to update the mission status when its funding changes.
CREATE TRIGGER UpdateMissionStatus
ON Missions
AFTER UPDATE
AS
BEGIN
    IF UPDATE(funding)
    BEGIN
        UPDATE Missions
        SET status = CASE
            WHEN inserted.funding >= 0 THEN 'Active'
            ELSE 'Inactive'
            END
        FROM inserted
        WHERE Missions.mission_id = inserted.mission_id;
    END
END;

--36.Create a trigger to insert a new record in the spacecraft table when a mission is completed.
CREATE TRIGGER InsertSpacecraftOnMissionCompletion
ON Missions
AFTER UPDATE
AS
BEGIN
    IF UPDATE(status)
    BEGIN
        DECLARE @MissionID INT;
        DECLARE @Status VARCHAR(50);
       
        SELECT @MissionID = mission_id, @Status = status
        FROM inserted;
       
        IF @Status = 'Completed'
        BEGIN
            INSERT INTO Spacecraft (mission_id, name, status)
            SELECT @MissionID, 'New Spacecraft', 'Active';
        END
    END
END;

--37.Create a trigger to delete the records of astronauts who have not been on any mission.
CREATE TRIGGER DeleteAstronautsOnNoMission
ON Astronauts
AFTER DELETE
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Missions WHERE mission_id IN (SELECT mission_id FROM deleted))
    BEGIN
        DELETE FROM Astronauts
        WHERE name IN (SELECT name FROM deleted);
    END
END;


--38.Create a cursor to retrieve the details of all missions one by one.
-- Declare variables
DECLARE @MissionID INT;
DECLARE @MissionName VARCHAR(255);
DECLARE @LaunchDate DATE;
DECLARE @Destination VARCHAR(255);
DECLARE @Status VARCHAR(255);
DECLARE @Funding BIGINT;
DECLARE @Expenses BIGINT;

-- Declare cursor
DECLARE MissionCursor CURSOR FOR
SELECT mission_id, mission_name, launch_date, destination, status, funding, expenses
FROM Missions;

-- Open the cursor
OPEN MissionCursor;

-- Fetch the first row
FETCH NEXT FROM MissionCursor INTO @MissionID, @MissionName, @LaunchDate, @Destination, @Status, @Funding, @Expenses;

-- Process the rows
WHILE @@FETCH_STATUS = 0
BEGIN
    -- Print or use the mission details
    PRINT 'Mission ID: ' + CAST(@MissionID AS VARCHAR(10));
    PRINT 'Mission Name: ' + @MissionName;
    PRINT 'Launch Date: ' + CONVERT(VARCHAR(10), @LaunchDate, 120);
    PRINT 'Destination: ' + @Destination;
    PRINT 'Status: ' + @Status;
    PRINT 'Funding: ' + CAST(@Funding AS VARCHAR(20));
    PRINT 'Expenses: ' + CAST(@Expenses AS VARCHAR(20));
    PRINT '-------------------------';

    -- Fetch the next row
    FETCH NEXT FROM MissionCursor INTO @MissionID, @MissionName, @LaunchDate, @Destination, @Status, @Funding, @Expenses;
END

-- Close and deallocate the cursor
CLOSE MissionCursor;
DEALLOCATE MissionCursor;



--39.Create a cursor to calculate the total expenses for each mission.
-- Declare variables
DECLARE @MissionID INT;
DECLARE @Expenses BIGINT;
DECLARE @TotalExpenses BIGINT = 0;

-- Declare cursor
DECLARE MissionCursor CURSOR FOR
SELECT mission_id, expenses
FROM Missions;

-- Open the cursor
OPEN MissionCursor;

-- Fetch the first row
FETCH NEXT FROM MissionCursor INTO @MissionID, @Expenses;

-- Process the rows
WHILE @@FETCH_STATUS = 0
BEGIN
    -- Accumulate expenses for each mission
    SET @TotalExpenses = @TotalExpenses + @Expenses;

    -- Fetch the next row
    FETCH NEXT FROM MissionCursor INTO @MissionID, @Expenses;
END

-- Close and deallocate the cursor
CLOSE MissionCursor;
DEALLOCATE MissionCursor;

-- Display the total expenses for each mission
SELECT mission_id, @TotalExpenses AS total_expenses
FROM Missions;


--40.Create a nested query to retrieve the details of the mission with the highest funding.
SELECT *
FROM Missions
WHERE funding = (
    SELECT MAX(funding)
    FROM Missions
);


--41.Create a nested query to retrieve the details of the astronaut with the most number of missions.
SELECT *
FROM Astronauts
WHERE number_of_missions = (
    SELECT MAX(number_of_missions)
    FROM Astronauts
);

--42.Create a nested query to retrieve the total number of missions to each destination.
SELECT destination, COUNT(*) AS total_missions
FROM Missions
GROUP BY destination
ORDER BY total_missions DESC;

--43.Create a correlated nested query to retrieve the details of the mission with the highest expenses.
SELECT mission_id, mission_name, launch_date, destination, status, funding, expenses
FROM Missions m1
WHERE expenses = (
  SELECT MAX(expenses)
  FROM Missions m2
  WHERE m2.mission_id = m1.mission_id
);


--44.Create a correlated nested query to retrieve the details of the astronaut with the most recent mission.
SELECT *
FROM Astronauts a1
WHERE mission_id = (
  SELECT MAX(mission_id)
  FROM Astronauts a2
  WHERE a2.name = a1.name
);

--45.Create a correlated nested query to retrieve the total number of astronauts for each country.
SELECT a.nationality AS country, COUNT(*) AS total_astronauts
FROM Astronauts a
GROUP BY a.nationality;

--46.Retrieve the average funding and expenses for each destination using aggregate functions and group by.
SELECT destination, AVG(funding) AS avg_funding, AVG(expenses) AS avg_expenses
FROM Missions
GROUP BY destination;

--47.Retrieve the details of the mission with the lowest expenses using subqueries and order by.
SELECT *
FROM Missions
WHERE expenses = (
    SELECT MIN(expenses)
    FROM Missions
);

--48.Retrieve the details of the astronauts who have been on missions to the Moon and Mars using joins.
SELECT a.name, a.age, a.nationality, a.specialization, a.number_of_missions, m.destination
FROM Astronauts a
JOIN Missions m ON a.mission_id = m.mission_id
WHERE m.destination IN ('Moon', 'Mars');

--49.Retrieve the details of the satellites launched by the United States after a certain date using subqueries and joins.
SELECT s.name, s.launch_date, s.country
FROM Satellites s
WHERE s.country = 'United States'
  AND s.launch_date > '2006-01-01';


