CREATE TABLE Department (
    dept_ID INT PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE IncidentType (
    type_ID INT PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE ModeOfTransport (
    transport_ID INT PRIMARY KEY,
    modeType VARCHAR(255) 
);

CREATE TABLE CauseOfIncident (
    cause_ID INT PRIMARY KEY,
    name VARCHAR(255) 
);

CREATE TABLE Location (
    location_ID INT PRIMARY KEY,
    city VARCHAR(255),
    country VARCHAR(255)
);

CREATE TABLE Spell (
    spell_ID INT PRIMARY KEY,
    name VARCHAR(255) ,
    type VARCHAR(255)
);

CREATE TABLE Artifact (
    artifact_ID INT PRIMARY KEY,
    type VARCHAR(255) 
);

CREATE TABLE Wizard (
    wiz_ID INT PRIMARY KEY,
    name VARCHAR(255) ,
    age INT,
    role VARCHAR(255),
    dept_ID INT,
    FOREIGN KEY (dept_ID) REFERENCES Department(dept_ID)
);

CREATE TABLE Vehicle (
    vehicle_ID INT PRIMARY KEY,
    vehicleType VARCHAR(255),
    ownerWiz_ID INT,
    FOREIGN KEY (ownerWiz_ID) REFERENCES Wizard(wiz_ID)
);

CREATE TABLE Incident (
    incident_ID INT PRIMARY KEY,
    location_ID INT,
    cause_ID INT,
    incidentType INT, 
    date DATE,
    length VARCHAR(100), 
    numOfMuggles INT,
    numOfWizards INT,
    totalDamages DECIMAL(12, 2), 
    FOREIGN KEY (location_ID) REFERENCES Location(location_ID),
    FOREIGN KEY (cause_ID) REFERENCES CauseOfIncident(cause_ID),
    FOREIGN KEY (incidentType) REFERENCES IncidentType(type_ID)
);

CREATE TABLE ObliviationOccurred (
    obliviate_ID INT PRIMARY KEY,
    incident_ID INT,
    numMugglesWiped INT,
    numObliviators INT,
    FOREIGN KEY (incident_ID) REFERENCES Incident(incident_ID)
);

CREATE TABLE TravelRecords (
    travel_ID INT PRIMARY KEY,
    wiz_ID INT,
    date DATE,
    time TIME,
    startLoc INT,
    destLoc INT,
    artifact_ID INT,
    transport_ID INT,
    FOREIGN KEY (wiz_ID) REFERENCES Wizard(wiz_ID),
    FOREIGN KEY (startLoc) REFERENCES Location(location_ID),
    FOREIGN KEY (destLoc) REFERENCES Location(location_ID),
    FOREIGN KEY (artifact_ID) REFERENCES Artifact(artifact_ID),
    FOREIGN KEY (transport_ID) REFERENCES ModeOfTransport(transport_ID)
);

CREATE TABLE IncidentVehicle (
    incident_ID INT,
    vehicle_ID INT,
    PRIMARY KEY (incident_ID, vehicle_ID),
    FOREIGN KEY (incident_ID) REFERENCES Incident(incident_ID),
    FOREIGN KEY (vehicle_ID) REFERENCES Vehicle(vehicle_ID)
);

CREATE TABLE InvolvedInIncident (
    incident_ID INT,
    wiz_ID INT,
    PRIMARY KEY (incident_ID, wiz_ID),
    FOREIGN KEY (incident_ID) REFERENCES Incident(incident_ID),
    FOREIGN KEY (wiz_ID) REFERENCES Wizard(wiz_ID)
);

CREATE TABLE IncidentSpell (
    incident_ID INT,
    spell_ID INT,
    PRIMARY KEY (incident_ID, spell_ID),
    FOREIGN KEY (incident_ID) REFERENCES Incident(incident_ID),
    FOREIGN KEY (spell_ID) REFERENCES Spell(spell_ID)
);