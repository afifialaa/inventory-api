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
3. Start local server in development environment
```bash
rails s -e development
```
And now you can visit the site with the URL http://localhost:3000


## Usage

### User endpoints
| Method        | URL                  | description            |
| ------------- | -------------        |-------------           |
| POST          | /user/signup  |create a new user  |
| POST           | /user/login  |authenticate  a user|

### Supplier endpoints

| Method        | URL                  | description            |
| ------------- | -------------        |-------------           |
| POST          | /supplier  |create a new supplier  |
| GET           | /supplier/:id  |return a specific supplier|
| GET           | /supplier  |return all suppliers|
| DELETE           | /supplier/:id  |delete a supplier|
| PUT        | /supplier/:id  |update a supplier|

### Product endpoints

| Method        | URL                  | description            |
| ------------- | -------------        |-------------           |
| POST          | /product  |create a new product  |
| GET           | /product/:id  |return a specific product|
| GET           | /product  |return all products|
| DELETE           | /product/:id  |delete a product|
| PUT        | /product/:id  |update a product|

### Category endpoints

| Method        | URL                  | description            |
| ------------- | -------------        |-------------           |
| POST          | /category  |create a category  |
| GET           | /category/:id  |return a specific category|
| GET           | /category  |return all categories|
| DELETE           | /category/:id  |delete a category|
| PUT        | /category/:id  |update a category|

### Warehouse endpoints
| Method        | URL                  | description            |
| ------------- | -------------        |-------------           |
| POST          | /warehouse  |create a warehouse  |
| GET           | /warehouse/:id  |return a specific warehouse|
| GET           | /warehouse  |return all warehouses|
| DELETE           | /warehouse/:id  |delete a warehouse|
| PUT           | /warehouse/:id  |update a specific warehouse|

### Employee endpoints
| Method        | URL                  | description            |
| ------------- | -------------        |-------------           |
| POST          | /employee  |create an employee  |
| GET          | /employee/:id  |return an employee by id  |
| GET          | /employee  |return all employees|
| DELETE          | /employee/:id  |delete an employee |
| PUT          | /employee/:id  |update an employee |

### Customer endpoints
| Method        | URL                  | description            |
| ------------- | -------------        |-------------           |
| POST          | /customer  |create a customer  |
| GET          | /customer/:id  |return a customer by id  |
| DELETE          | /customer/:id  |delete a customer |
| PUT          | /customer/:id  |update a customer |

### Order endpoints
| Method        | URL                  | description            |
| ------------- | -------------        |-------------           |
| POST          | /order  |create an order  |
| POST          | /order/:id  |add item to an order  |
| GET          | /order/:id  |return an order |
| DELETE          | /order/:id |delete order |


## Pending
* Dockerizing the api