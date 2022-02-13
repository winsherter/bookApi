# Full Stack Book Managing API
## Content
1. Overview
2. Getting Started
3. API Documentation
4. Existing roles
## Overview


## Getting Started

### 1 - Installing Dependencies

#### Python 3.8.5

Follow instructions to install the latest version of python for your platform in the 
[python docs](https://docs.python.org/3/using/unix.html#getting-and-installing-the-latest-version-of-python)

#### Virtual Enviornment

We recommend working within a virtual environment whenever using Python for projects. This keeps your dependencies for each project separate and organaized. Instructions for setting up a virual enviornment for your platform can be found in the [python docs](https://packaging.python.org/guides/installing-using-pip-and-virtual-environments/)

#### PIP Dependencies

Once you have your virtual environment setup and running, install dependencies by naviging to the `/bookApi` directory and run:

This will install all of the required packages within the `requirements.txt` file.

```bash
pip install -r requirements.txt
or
pip3 install -r requirements.txt
```
##### Key Dependencies

- [Flask](http://flask.pocoo.org/)  is a lightweight backend microservices framework. Flask is required to handle requests and responses.

- [SQLAlchemy](https://www.sqlalchemy.org/) is the Python SQL toolkit and ORM we'll use handle the lightweight sqlite database. You'll primarily work in app.py and can reference models.py.  

### 2 - Database Setup
With Postgres running, restore a database using the plants_database.sql file provided. From the backend folder in terminal run:
```bash
psql bookdb < bookdb.sql
```
## API Documentation
### 1 - Running the server

From within the `bookApi` directory first ensure you are working using your created virtual environment.

To run the server on Linux or Mac, execute:

```bash
export FLASK_APP=app.py
export FLASK_ENV=development
flask run
```
To run the server on Windows, execute:

```bash
set FLASK_APP=app.py
set FLASK_ENV=development
flask run
```

Setting the `FLASK_ENV` variable to `development` will detect file changes and restart the server automatically.

Setting the `FLASK_APP` variable to `app` directs flask to use the `app` directory and the `__init__.py` file to find the application. 

### 2 - API REFERENCE

Base URL: At present this app can only be run locally and is not hosted as a base URL. The backend app is hosted at the default, http://localhost:5000; which is set as a proxy in frontend configuration.

This API has been deployed on heroku and is available from the link https://capstoneapi.herokuapp.com

### 3 - Error Handling
Errors are retourned as JSON objects in the following format:
{
    "success":False
    "error": 400
    "message":"Bad request"
}

The API will return four error types when requests fail:
. 400: Bad request
. 500: Internal server error
. 404: Not found
. 405: Method Not Allowed

## Endpoints
. ## GET/plants

    GENERAL:
        This endpoints returns a list of plant object, success value, total number of the plants. 

    SAMPLE: curl http://localhost:5000/livres
