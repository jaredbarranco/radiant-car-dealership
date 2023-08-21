# Radiant Car Dealership
This repo holds the files and links for a techincal job interview.

## Scenario
You are a developer hired by Radiant Car Dealers to manage an ERP system that encompasses their Employee, Inventory, and Sales Data.

You may use any resources available on your laptop, please just share your screen so the interviewer can follow along with your process.

## Project Setup
    1. Create a new folder on your computer called `radiant-car-dealership`
    2. Create a new git repo in this directory
    3. Download or import the resources from the url: ``

### Project 1 - SQL
The customer's goal is to have better control over the prices that their customers see on their website. The dealership pays for cars at a wholesale price, and then adds a markup to those prices to calculate the sticker price of the vehicle. The dealership also needs to know how many of each vehicle they have on-hand so they don't oversell or backorder cars.

See either ./1_carDealershipQuestion.sql or https://sqlize.online/s/XR for an online playground version.


When complete, copy/paste your updates to the bottom of 1_carDealershipQuestion.sql and save the file. Commit your changes.

### Project 2 - Schema and API
The customer's website needs to be enhanced to display the number of vehicles in stock. A current version of their API Specification Document is located at ./2_radiantCarDealers-API.yml.

You can quickly load this into an editor at: https://editor.swagger.io/, or you can edit locally using preferred tools.

Please edit the current API definition to add a /cars/inventory endpoint. The endpoint should:
    1. Be a GET Method Endpoint
    2. Return a JSON Array of cars
    3. Refer to a re-usable component in the API documentation.
    4. At minimum, return a 500 error


When complete, copy/paste your updates to the bottom of 2_radiantCarDealers-API.yml and save the file. Commit your changes.

### Project 3 - Submit to Code Review
In Git or Github Desktop, submit a Pull Request to the repository with your changes. Both the Pull Request Title and Description can be your name.

### Answer Decryption
Decrypt the answer folder on your local machine by running `bash answers-crypt.sh decrypt answers-encrypted.tar.gz.enc {password}`.

Ask jaredbarranco for the password.