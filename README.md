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
### GET/books
GENERAL: This endpoints returns a list of book object, success value, total number of the books.
```
Sample: curl https://capstoneapi.herokuapp.com/actors
                    OR
Sample: curl https://capstoneapi.herokuapp.com/actors
```
**Here's the Result:**


```
{
    "Book": [
        {
            "Auteur": "Winsherter Mountain",
            "Code Categorie": 2,
            "Date de Publication": "Jan 08, 2007",
            "Editeur": "Chateau Rouge",
            "Identifiant": 1,
            "Isbn": "B6717",
            "Titre": "In The Room"
        },
        {
            "Auteur": "Green Montain",
            "Code Categorie": 1,
            "Date de Publication": "Jan 08, 1998",
            "Editeur": "Chateau Rouge",
            "Identifiant": 21,
            "Isbn": "B6701X7",
            "Titre": "The P Power"
        },
        {
            "Auteur": "A.C.W",
            "Code Categorie": 7,
            "Date de Publication": "Aug 17, 1998",
            "Editeur": "Staple",
            "Identifiant": 27,
            "Isbn": "OKO79C9",
            "Titre": "007"
        },
        {
            "Auteur": "$Not",
            "Code Categorie": 8,
            "Date de Publication": "May 23, 1978",
            "Editeur": "Under Neath",
            "Identifiant": 28,
            "Isbn": "PQO5199",
            "Titre": "Jason Wornes"
        },
        {
            "Auteur": "Etienne Pillow",
            "Code Categorie": 9,
            "Date de Publication": "May 23, 2012",
            "Editeur": "Universal",
            "Identifiant": 29,
            "Isbn": "LRKK189",
            "Titre": "The Gunpoint"
        },
        {
            "Auteur": "Mr Hines",
            "Code Categorie": 9,
            "Date de Publication": "Sep 19, 1990",
            "Editeur": "Paramount",
            "Identifiant": 30,
            "Isbn": "7UIO157",
            "Titre": "Bullet"
        }
    ],
    "Success": true,
    "Total Book": 30
}
```
### GET/books/book_ID
GENERAL: This endpoint allows you to get for a particular Book using its id. This endpoint
 returns one book, and the detail.
 ```
Sample: curl https://capstoneapi.herokuapp.com/actors
                    OR
Sample: curl https://capstoneapi.herokuapp.com/actors
```
**Here's the Result:**


```
{
    "Livre": {
        "Auteur": "Lord P",
        "Code Categorie": 4,
        "Date de Publication": "Jul 03, 2021",
        "Editeur": "Jaeger LeCoultre",
        "Identifiant": 4,
        "Isbn": "HN120",
        "Titre": "The Plug"
    },
    "Selected Book ID": 4,
    "Succes": true
}
```

### GET/categories
GENERAL: This endpoints returns a list of book categories object, success value, total number of the categories.
```
Sample: curl https://capstoneapi.herokuapp.com/actors
                    OR
Sample: curl https://capstoneapi.herokuapp.com/actors
```
**Here's the Result**

```
{
    "Categories": [
        {
            "Categorie": "Fiction",
            "Id": 1
        },
        {
            "Categorie": "Roman",
            "Id": 2
        },
        {
            "Categorie": "Science",
            "Id": 3
        },
        {
            "Categorie": "Polar",
            "Id": 4
        },
        {
            "Categorie": "Thriller",
            "Id": 5
        },
        {
            "Categorie": "Policier",
            "Id": 6
        },
        {
            "Categorie": "Conte",
            "Id": 7
        },
        {
            "Categorie": "Histoire",
            "Id": 8
        },
        {
            "Categorie": "Love",
            "Id": 9
        }
    ],
    "Success": true,
    "Total Categories": 9
}
```

### GET/categories/categorie_ID
GENERAL: This endpoint allows you to get for a particular Book Categorie using its id. This endpoint return one book Categorie, and the detail.
```
Sample: curl https://capstoneapi.herokuapp.com/actors
                    OR
Sample: curl https://capstoneapi.herokuapp.com/actors
```
**Here's the Result:**

```
{
    "Categorie": {
        "Categorie": "Science",
        "Id": 3
    },
    "Selected Categorie ID": 3,
    "Succes": true
}
```

### GET/categories/categorie_ID/books
GENERAL: This endpoints returns a list of books stored in a categorie object, success value, total number of the books in the categorie and the categorie name.
```
Sample: curl https://capstoneapi.herokuapp.com/actors
                    OR
Sample: curl https://capstoneapi.herokuapp.com/actors
```
**Here's the Result:**

```
{
    "Book": [
        {
            "Auteur": "Gray Shark",
            "Code Categorie": 1,
            "Date de Publication": "May 23, 2021",
            "Editeur": "The Gun House",
            "Identifiant": 2,
            "Isbn": "HG189",
            "Titre": "Killer Outside"
        },
        {
            "Auteur": "Green Montain",
            "Code Categorie": 1,
            "Date de Publication": "Jan 08, 2000",
            "Editeur": "Chateau Rouge",
            "Identifiant": 11,
            "Isbn": "B671X7",
            "Titre": "The Player"
        },
        {
            "Auteur": "Ryan Placer",
            "Code Categorie": 1,
            "Date de Publication": "May 23, 2011",
            "Editeur": "Mont Blanc",
            "Identifiant": 12,
            "Isbn": "HO1E89",
            "Titre": "The Outside"
        },
        {
            "Auteur": "Green Montain",
            "Code Categorie": 1,
            "Date de Publication": "Jan 08, 1998",
            "Editeur": "Chateau Rouge",
            "Identifiant": 21,
            "Isbn": "B6701X7",
            "Titre": "The P Power"
        },
        {
            "Auteur": "Ryan Placer",
            "Code Categorie": 1,
            "Date de Publication": "May 23, 2000",
            "Editeur": "Mont Blanc",
            "Identifiant": 22,
            "Isbn": "HO1E809",
            "Titre": "Outside"
        }
    ],
    "Categorie": "Fiction",
    "Success": true,
    "Total Book": 5
}
```

### PATCH/books/book_ID
GENERAL: This endpoints returns a list of movies object, success value, total number of the movies.
```
Sample: curl https://capstoneapi.herokuapp.com/actors
                    OR
Sample: curl https://capstoneapi.herokuapp.com/actors
```
**Here's the Result:**

```


```

### PATCH/categories/categories_ID
GENERAL: This endpoints returns a list of movies object, success value, total number of the movies.
```
Sample: curl https://capstoneapi.herokuapp.com/actors
                    OR
Sample: curl https://capstoneapi.herokuapp.com/actors
```
**Here's the Result:**

```


```

### DELETE/books/book_ID
GENERAL: Delete the book of the given ID if it exists. Return the id of the deleted book, 
success value, total of book remaining.
```
Sample: curl https://capstoneapi.herokuapp.com/actors
                    OR
Sample: curl https://capstoneapi.herokuapp.com/actors
```
**Here's the Result:**

```


```

### DELETE/categories/categories_ID
GENERAL: This endpoints Delete the categorie of the given ID if it exists. Return the id of the deleted categorie, success value, total of categories remaining.
```
Sample: curl https://capstoneapi.herokuapp.com/actors
```
***OR***
```
Sample: curl https://capstoneapi.herokuapp.com/actors
```
**Here's the Result:**

```


```
