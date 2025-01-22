#Hospital Management System
The Hospital Management System is a web-based application designed to simplify and automate hospital operations. It provides a seamless interface for administrators, doctors, and users (patients), enabling functionalities such as registration, appointment booking, profile management, and administrative tasks.

📋 Features
User Module:
Registration & Login: Users can register themselves if they don't have an account and log in to access their profiles.
Appointment Booking: Users can book appointments with their preferred doctors.
Profile Management: Users can change their passwords and update their profile information.
Comment Section: Users can leave feedback or comments for doctors.
Doctor Module:
Appointment Management: Doctors can view the total number of patients who have booked appointments with them.
Profile Management: Doctors can update their profile details.
Patient Interaction: Doctors can respond to comments or feedback left by users.
Admin Module:
Manage Users & Doctors: Admins can view, add, update, and delete doctors, as well as manage users.
Doctor Listing: Admins can see the total number of available doctors.
🛠️ Technologies Used
Backend: Core Java, Servlets, JSP
Frontend: HTML, CSS, JavaScript, Bootstrap
Database: MySQL
IDE: Eclipse
🚀 How to Run the Project
Prerequisites:
Java Development Kit (JDK): Ensure that JDK 8 or above is installed.
MySQL: Install MySQL and create a database for the project.
Eclipse IDE: Install Eclipse IDE for Java Developers.
Apache Tomcat: Install and configure Apache Tomcat Server.
Steps to Set Up:
Clone the Repository:

bash
Copy
Edit
git clone https://github.com/yourusername/hospital-management-system.git
Import the Project into Eclipse:

Open Eclipse.
Go to File > Import > Existing Projects into Workspace.
Select the cloned project folder and click Finish.
Configure Database:

Open the DBConnection class in the com.db package.
Update the database URL, username, and password:
java
Copy
Edit
private static final String URL = "jdbc:mysql://localhost:3306/your_database_name";
private static final String USER = "your_username";
private static final String PASSWORD = "your_password";
Create the database and required tables by referring to the provided SQL scripts in the /sql directory.
Run the Application:

Right-click on the project in Eclipse.
Select Run As > Run on Server.
Choose Apache Tomcat and start the server.
Access the Application:

Open your browser and navigate to:
bash
Copy
Edit
http://localhost:8080/hospital-management-system/
📖 Usage
Admin Login:
Admin can manage users, add/delete doctors, and monitor the system.
Doctor Login:
Doctors can view patient appointments, update their profiles, and interact via comments.
User Login:
Users can book appointments, manage their profiles, and interact with doctors.

