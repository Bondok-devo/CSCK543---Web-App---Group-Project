# 🍳 Savory Spoon - Recipe Web App

Welcome to Savory Spoon! This is a dynamic, server-side web application built with PHP and MySQL. It provides a platform for users to discover, save, and rate a variety of delicious recipes. The application is designed to be responsive, accessible, and performant, following modern web development best practices.

## Features

* **User Authentication:** Secure user registration and login system.
* **Recipe Discovery:** A feature-rich homepage with featured recipes and a full alphabetical listing.
* **Advanced Search & Filtering:** Users can search for recipes by name or ingredient and filter results by multiple categories.
* **Recipe Details:** A clean, modern view for individual recipes, including ingredients, steps, and meta-information.
* **User Accounts:** Logged-in users have an account page to view their saved favourite recipes.
* **Interactive Ratings:** A 5-star rating system that allows users to rate recipes with a single click.
* **Responsive Design:** A mobile-first design that works seamlessly on devices of all sizes, featuring an interactive filter overlay for smaller screens.
* **High Performance & Accessibility:** Optimized based on Lighthouse audits to achieve perfect performance scores and high accessibility standards.

---

##  Prerequisites

Before you begin, ensure you have the following software installed on your system:

* **XAMPP:** A web server solution that bundles Apache, MySQL, and PHP.
* **MySQL Workbench (Recommended):** A visual tool for managing the MySQL database.

---

## ⚙️ Setup Instructions

Follow these steps carefully to set up the project on your local machine.

### 1. Install XAMPP

First, you need a local server environment.

1.  Download and install **XAMPP** from the [official Apache Friends website](https://www.apachefriends.org/index.html). Choose the correct version for your operating system (Windows or OS X).
2.  Launch the **XAMPP Control Panel**.
3.  **Start** the **Apache** and **MySQL** services. You should see their status turn green. 

### 2. Place the Project Folder

The web server needs access to the project files.

1.  Navigate to the `htdocs` folder inside your XAMPP installation directory.
    * **On Windows:** `C:\xampp\htdocs\`
    * **On macOS:** `/Applications/XAMPP/xamppfiles/htdocs/`
2.  Copy the entire project folder (`CSCK543---Web-App---Group-Project`) into this `htdocs` directory.

### 3. Import the Database

Next, you need to create the database and import the sample data.

1.  Open **MySQL Workbench** and connect to your local MySQL server (the one running from XAMPP).
2.  In the SCHEMAS panel on the left, right-click and select **Create Schema...**.
3.  Name the new schema exactly `Recipe_web_app` and click **Apply**.
4.  Once the schema is created, go to the top menu and select **Server > Data Import**.
5.  In the Data Import window:
    * Select **Import from Self-Contained File**.
    * Click the `...` button and navigate to the database export file located at:
        `CSCK543---Web-App---Group-Project/Recipe_web_app-export.sql`
    * For the **Default Target Schema**, select the `Recipe_web_app` schema you just created.
    * Click the **Start Import** button at the bottom right. The process will run and populate your database with all the necessary tables and recipe data. 

### 4. Verify Configuration (Optional)

The project is pre-configured to work with the default XAMPP MySQL setup, which has a username of `root` and no password. If your setup is different, you can edit the credentials in the `src/config.php` file.

---

## 🚀 Running the Application

Once the setup is complete, you can run the web app.

1.  Make sure your Apache and MySQL services are still running in the XAMPP Control Panel.
2.  Open your web browser.
3.  Navigate to the following URL:
    ```
    http://localhost/CSCK543---Web-App---Group-Project/public/
    ```

The Savory Spoon homepage should now be visible!

### Demo Credentials

The database includes a pre-made demo user account. However, for security, the best way to test is to create your own account.

* Use the **Register** button on the website to create a new user account.
* Then, log in with the credentials you just created to test features like saving favourites and rating recipes.