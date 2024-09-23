# university-database


Here's the installation guide for your database project translated into English:

DATABASE INSTALLATION INSTRUCTIONS

Prerequisites: To install the database, you will need a database management tool such as SQL Server Management Studio (SSMS), Azure Data Studio, or similar.

If you are using Azure Data Studio, you will also need to install the Admin Pack for SQL Server extension in order to import the .bacpac file.

Installation steps:

Connect your chosen tool (e.g., Azure Data Studio) to the server.
In the "Databases" folder, right-click and select "Data-tier Application wizard".
Choose "Create a database from a .bacpac file [Import Bacpac]".
Provide the path where the .bacpac file is stored and enter the name "GraduateInfo".
Click Next and complete the import process.
Once the process is completed, a message saying "Import bacpac succeeded" will appear at the bottom of the screen.
Go to the "Databases" folder, click Refresh, and the new database will appear.
