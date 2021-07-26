# Inventory-api

An api for simple inventory management.

## Installation
1. Clone the repository

```bash
git clone https://github.com/afifialaa/inventory-api.git
```
2.  Install the dependencies specified in the Gemfile
```bash
bundle install
```
4. Create and setup the database
```bash
rails db:create
rails db:migrate
```
3. Start local server
```bash
rails s
```
And now you can visit the site with the URL http://localhost:3000


## Usage

### User routes

### Supplier routes

| Method        | URL                  | description            |
| ------------- | -------------        |-------------           |
| POST          | /suppliers  |create new supplier  |
| GET           | /suppliers/:id  |return specific supplier|
| GET           | /suppliers  |return all suppliers|
| DELETE           | /suppliers/:id  |delete supplier|
| PUT        | /suppliers/:id  |update supplier|

### Product routes

| Method        | URL                  | description            |
| ------------- | -------------        |-------------           |
| POST          | /Products  |create new product  |
| GET           | /Products/:id  |return specific product|
| GET           | /Products  |return all products|
| DELETE           | /Products/:id  |delete product|
| PUT        | /Products/:id  |update product|

### Category routes

| Method        | URL                  | description            |
| ------------- | -------------        |-------------           |
| POST          | /categories  |create category  |
| GET           | /categories/:id  |return specific category|
| GET           | /categories  |return all categories|
| DELETE           | /categories/:id  |delete category|
| PUT        | /categories/:id  |update category|



## Pending
* User authentication
* Dockerizing the api