ShopifyEngine
=============

ShopifyEngine is a Rails::Engine for RAD development of Shopify apps. It does
all of the dirty work for you, leaving you with only the fun stuff: Writing the
app!


Installation
============

### Shopify Side

* Create an app from your [Shopify partner's dashboard](https://app.shopify.com/services/partners).
* Set the `Return URL` to `http://localhost:3000/shopify/finalize` during development.
* You will need the `API Key` and `Shared Secret` for the Rails side instructions.


### Rails Side

* You can start with an existing or a new Rails app.
* Add `gem 'shopify-engine'` to your Gemfile.
* Run `bundle`
* Add the following two lines to the file `config/environments/development.rb`:

    config.shopify.api_key = "" # <= Insert your app's API key here
    config.shopify.secret  = "" # <= Insert your app's shared secret here

* Next copy the engine's database migrations into your app by running

    rake shopify_engine_engine:install:migrations


Now start up your Rails app's server, and point your browser to
[http://localhost:3000/shopify/login](http://localhost:3000/shopify/login) to
login to the app.

*NOTE:* As you can see, this only sets up the development environment. When
switching into production mode you'll more than likely want to use environment
variables. See the Configuration section below to find out more.


Configuration
=============

### Shopify credentials

To configure your shopify credentials, set these two values in any of your
environment files:

    config.shopify.api_key
    config.shopify.secret

### Production Environment

The best practice for production mode is to use environment variables. Add these
lines to `config/environments/production.rb`:

    config.shopify.api_key = ENV['SHOPIFY_API_KEY']
    config.shopify.secret  = ENV['SHOPIFY_SHARED_SECRET']

Then set those environment variables on your server to the appropriate values.


Contributing to ShopifyEngine
=============================


### Testing

All the tests for ShopifyEngine are written in RSpec, and can be found in a
dummy Rails app in the path `spec/dummy`. You will need to run the tests from
that path.
