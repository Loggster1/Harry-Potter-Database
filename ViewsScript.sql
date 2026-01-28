CREATE OR REPLACE VIEW crashinvestigator AS
SELECT 
    l.city,
    l.country,
    i.totalDamages,
    TO_CHAR(i.date, 'YYYY-MM-DD') AS incident_Date,
    w.name AS wiz_name,
    v.vehicleType
FROM Incident i
JOIN Location l ON i.location_ID = l.location_ID
JOIN InvolvedInIncident inv ON i.incident_ID = inv.incident_ID
JOIN Wizard w ON inv.wiz_ID = w.wiz_ID
LEFT JOIN IncidentVehicle iv ON i.incident_ID = iv.incident_ID
LEFT JOIN Vehicle v ON iv.vehicle_ID = v.vehicle_ID;


CREATE OR REPLACE VIEW travelinvestigator AS
SELECT 
    w.name AS wiz_name,
    l_start.city AS origin,
    l_dest.city AS destination,
    TO_CHAR(t.date, 'YYYY-MM-DD') AS travel_date,
    TO_CHAR(i.date, 'YYYY-MM-DD') AS incident_date
FROM TravelRecords t
JOIN Wizard w ON t.wiz_ID = w.wiz_ID
JOIN Location l_start ON t.startLoc = l_start.location_ID
JOIN Location l_dest ON t.destLoc = l_dest.location_ID
JOIN InvolvedInIncident inv ON w.wiz_ID = inv.wiz_ID
JOIN Incident i ON inv.incident_ID = i.incident_ID;


CREATE OR REPLACE VIEW spellinvestigator AS
SELECT 
    s.name AS spell_name,
    s.type AS spell_type,
    i.length AS incident_length,
    i.totalDamages,
    i.date AS incident_date
FROM Spell s
JOIN IncidentSpell iss ON s.spell_ID = iss.spell_ID
JOIN Incident i ON iss.incident_ID = i.incident_ID;