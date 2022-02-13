# Full Stack Book Managing API
## Content
1. Overview
2. Getting Started
3. API Documentation
4. Endpoints
## Overview


## Getting Started

### 1 - Installing Dependencies

#### 1.1 - Python 3.8.5

Follow instructions to install the latest version of python for your platform in the 
[python docs](https://docs.python.org/3/using/unix.html#getting-and-installing-the-latest-version-of-python)

#### 1.2 - Virtual Enviornment

We recommend working within a virtual environment whenever using Python for projects. This keeps your dependencies for each project separate and organaized. Instructions for setting up a virual enviornment for your platform can be found in the [python docs](https://packaging.python.org/guides/installing-using-pip-and-virtual-environments/)

#### 1.3 - PIP Dependencies

Once you have your virtual environment setup and running, install dependencies by naviging to the `/bookApi` directory and run:

This will install all of the required packages within the `requirements.txt` file.

```bash
pip install -r requirements.txt
                OR
pip3 install -r requirements.txt
```
#### 1.4 - Key Dependencies

- [Flask](http://flask.pocoo.org/)  is a lightweight backend microservices framework. Flask is required to handle requests and responses.

- [SQLAlchemy](https://www.sqlalchemy.org/) is the Python SQL toolkit and ORM we'll use handle the lightweight sqlite database. You'll primarily work in app.py and can reference models.py.  

### 2 - Database Setup
With Postgres running, restore a database using the plants_database.sql file provided. From the backend folder in terminal run:
```bash
psql bookdb < bookdb.sql
```
## API Documentation
### 1 - API Role

This API works with 2 roles

#### 1.1 - Book Operation:

    - GET/book : Get all books
    - GET/book(book_id): Get a specific book by ID
    - PATCH/book(book_id): Modify a specific book by ID
    - DELETE/book(book_id): Delete a specific book by ID

#### 1.2 - Categorie
    - GET/categories: Get all book categories
    - GET/categories(categorie_id): Get a specific book categorie by ID
    - GET/categories/(categorie_id)/book: Get a list of book in a specific categorie by ID
    - PATCH/categories(categorie_id): Modify a specific book categorie by ID
    - DELETE/categories(categorie_id): Delete a specific book categorie by ID

    - POST/categories: can create an new book categorie
### 2 - Running the server

From within the `bookApi` directory first ensure you are working in the created virtual environment.

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

Setting the `FLASK_ENV` variable to `development` will automatically detect file changes and restart the server.

Setting the `FLASK_APP` variable to `app` directs flask to use the `app` directory and the `__init__.py` file to find the application. 

### 3 - API References

Online: This API has been deployed on heroku and is available from the link: https://capstoneapi.herokuapp.com

Base URL: This app can be run locally and the backend app is hosted at the default,
http://localhost:5000 which is set as a proxy in frontend configuration.

### 4 - Error Handling

The API will return four error types when requests fail:
- 400: Bad request
- 500: Internal server error
- 404: Not found
- 405: Method Not Allowed

Errors are retourned as JSON objects in the following format:
```
{
    "success":False
    "error": 400
    "message":"Bad request"
}
```
## Endpoints

