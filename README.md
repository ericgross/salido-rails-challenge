# Challenge for Rails Engineer
To better assess a candidates development skills, we provide this following challenge.  You have as much time as you'd like (though we ask that you not spend more than a few hours).

## Submission Instructions
1. First, fork this project on github.  You will need to create an account if you don't already have one.
1. Next, complete the project as described below within your fork.
1. Finally, push all of your changes to your fork on github and submit a pull request.  You should also email the appropriate address at Salido and your recruiter to let them know you have submitted a solution.  Make sure to include your github username in your email (so we can match people with pull requests).
1. Include in your README any assumptions or other information you want to communicate.
1. Include documentation of how to work with API calls.

## Alternate Submission Instructions (if you don't want to publicize completing the challenge)
1. Clone the repository
1. Next, complete your project as described below within your local repository
1. Email a patch file to the appropriate address at Salido and your recruiter to let them know you have submitted a solution.

## Project Description
Imagine that Salido has just acquired a new company called ABC Wine Distributors (ABC WD) for the purpose of selling wines through Salido's existing customer-facing mobile app.

Your job is to prorotype a web-based Inventory Management System.

ABC WD's API: https://api.wine.com You will need to sign up for an account to obtain your own apikey.

Here's what your application must do:

1. load ABC products from ABC WD's API into Salido's DB
1. allow an user to add new products to Salido's DB
1. allow an user to update existing products in Salido'S DB
1. expose a list of products in Salido'S DB using an API
1. allow a user to update existing products in Salido'S DB using an API
1. demonstrate your API calls using RSpec tests

Your application does not need to:

1. handle authentication or authorization 
1. be aesthetically pleasing

Your application should be easy to set up and run on Rails 4 or later.  It should not require any for-pay software.

## Evaluation
Evaluation of your submission will be based on the following criteria. 

1. Did your application fulfill the basic requirements?
1. Did you document the method for setting up and running your application?
1. Did you follow the instructions for submission?

Additionally, reviewers will attempt to assess your familiarity with standard libraries. Reviewers will also assess your experience with object-oriented programming based on how you've structured your submission.

# Instructions for use
## Configuration

1. Clone repo
2. Install required gems with `bundle install`
3. Run the rails server with `rails s`

## Web Interface

### Get Product List
The Product list can be viewed at `/products` - each item can be clicked, this will bring you to the editing page where you can modify the properties of the product and submit your changes (or go back to cancel).

### Add New Product
A new product can be added by visiting `/products/new`.

## API

### Get Product List
The API can be used to retrieve all products - use `/api/v1/products` - the results are returned in JSON format with the top level keys `count` signifying the number of products being returned and `products` which is an array of products, each product being represented by a hash.

### Update Existing Product
It is also possible to edit an existing product via POSTing to the API at `/api/v1/products` with ALL of the properties of the product, not just the properties you wish to modify. You will get a return code that is appropriate for the result as well as a JSON payload including the result.

#### The properties that are required
1. id (integer)
1. name (string)
1. url (string)
1. price_retail (float)
1. product_type (enum: int): wine: 0, wine set: 1, basket: 2, glassware: 3, accessory: 4

#### Optional properties
1. description (string)
1. year (integer)
