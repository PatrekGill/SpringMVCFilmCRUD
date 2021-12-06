# SpringMVCFilmCRUD

![image](https://drive.google.com/uc?export=view&id=185dLjZZ5fso-IunMCflGrKaPF6E31Mlx)
![image](https://drive.google.com/uc?export=view&id=1IKJPlnyi0TBkVa6IrdcuMsDVBReS_l7p)


## Overview
This is a paired-project that saw two individuals putting into practice the use of several technologies and design patterns to produce a minor Full-Stack project. Collaboration was conducted remotely over Zoom and Slack while managing work on the same files with the Github repository. Specifically the app is a pseudo-film database GUI that can be searched by either film id or keyword. Films are made up of various pieces of information that can be updated. Films can also be added to the database and those that the user creates can also be deleted.
<br>
<br>
As the title of the project suggests we utilized several design patterns. Namely Model View Controller, Object Relational Mapping, and a Database Accessor Object to create, read, update, and delete from the database.
<br>
<br>
To run, we used a local MAMP server for the database and a local Tomcat Server for testing, launching the application as a Spring Boot app from Spring Tool Suite.
<br>
<br>
A [Bootstrap Template](https://www.tutorialrepublic.com/snippets/preview.php?topic=bootstrap&file=crud-data-table-for-database-with-modal-form) was used for this project after we had completed the required functionality. This was our first time implementing it, so it is quite horrid in how styles are used in the `.jsp` files.


## Technologies
Java 1.8, SpringMVC, Spring Boot, Spring Tool Suite, Tomcat Server, JSP, HTML, MAMP, SQL, Git terminal, MAC OS, Bootstrap 3, Google


## Lessons Learned
Mostly just cementing of the process. These are tools that we have finally used together to make an application that while not complex is a step-up from our previous command-line oriented and hard-coded apps of previous weeks.


## Project Owners
[Jack Himes](https://github.com/JackHimes)
<br>
[Patrek Gill](https://github.com/PatrekGill)


## What We Could've Done Better
**JSP Management:**
<br>
Certainly the `.jsp`'s are not as succinct as they could or even should be.
There are likely better ways of managing the repeated information between each of these files.
<br>
<br>
**Consistency:**
<br>
There are plenty of areas within the code that could be simplified and make better use of conventions to provide an easier reading experience.
Mostly the `FilmController` class seems to suffer from this as the methods are inconsistent in their parameters types and names.
