<a id="readme-top"></a>

<div align="center">
  <h3 align="center">The Ministry Ledger: Wizarding World Of Harry Potter</h3>

  <p align="center">
    A Java Swing GUI and PostgreSQL database system designed for tracking and analyzing magical incidents.
    <br />
    <br />
  </p>
</div>

<details>
  <summary>Table of Contents</summary>
  <ol>
    <li><a href="#about-the-project">About The Project</a></li>
    <li><a href="#features">Features</a></li>
    <li><a href="#technologies">Technologies</a></li>
    <li><a href="#getting-started">Getting Started</a></li>
  </ol>
</details>

# About The Project
I developed a Java Swing GUI to interface with a custom Harry Potter database I created for a Database Management class. I designed the ER diagram, implemented the full relational schema, and created optimized SQL views to handle interactive queries. It was originally implemented for Oracle but was migrated to Postgres after graduation.

# Features
| Feature | Description |
| :--- | :--- |
| **Crash Investigator** | Analyzes damages, date of incident, and location of incident. It also displays vehicles and the wizard involved in each incident using complex multi-table joins. |
| **Spell Investigator** | Monitors which spells were used in recent incidents, as well as the length of the incident and the damage caused to identify high-damage trends. |
| **Travel Investigator** | Tracks wizards movement in the past X amount of days to see where suspects come from and go to leading up to an incident. |
| **Relational Database** | I built a 13-table schema designed with an ER diagram to ensure data consistency. |
| **Optimized Views** | Uses server-side SQL Views to reduce client-side processing and improve query speed. |

# Technologies
* **Languages:** Java, SQL
* **Database:** PostgreSQL (Migrated from Oracle)
* **Design:** ER Diagramming (Relational Mapping)
* **Tools:** NetBeans, pgAdmin 4 (Migrated from sqlDeveloper)

# Getting Started
#### Prerequisites
* **Java JDK:** Ensure JDK 17+ is installed.
* **PostgreSQL:** A local instance of PostgreSQL must be running.
* **JDBC Driver:** You will need the [PostgreSQL JDBC Driver](https://jdbc.postgresql.org/download/) added to your project libraries in NetBeans.

#### Installation
1. Download the [HarryPotterGUI.zip](https://github.com/Loggster1/Harry-Potter-Database/blob/main/HarryPotterGUI.zip) and extract the files.
2. Open the project in **NetBeans**.
3. In `HarryPotterGUI.java`, update the following lines with your local credentials:
```java
String url = "jdbc:postgresql://localhost:5432/HarryPotterGUI";
String user = "your_username";
String password = "your_password";
```
4. Once a PostgreSQL server is running, create a database named HarryPotterGUI in pgAdmin 4.
5. Run the included SQL scripts to build and populate the database. 
    * Download and run [**SchemaScript.sql**](https://github.com/Loggster1/Harry-Potter-Database/blob/main/SchemaScript.sql) to create the relational table structure.
    * Download and run [**ViewsScript.sql**](https://github.com/Loggster1/Harry-Potter-Database/blob/main/ViewsScript.sql) to create the views required for queries used by the GUI.
    * **Data Import:** Download and extract [**PotterDBData.zip**](https://github.com/Loggster1/Harry-Potter-Database/blob/main/PotterDBData.zip) and import the CSV files into their matching tables. 
