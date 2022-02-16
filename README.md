# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

#device gem for user authentications 
devise gem github.com

gem 'devise' 
Then run bundle install

Next, you need to run the generator:

$ rails generate devise:install



Depending on your application's configuration some manual setup may be required:

  1. Ensure you have defined default url options in your environments files. Here
     is an example of default_url_options appropriate for a development environment
     in config/environments/development.rb:

       config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }

     In production, :host should be set to the actual host of your application.

     * Required for all applications. *

  2. Ensure you have defined root_url to *something* in your config/routes.rb.
     For example:

       root to: "home#index"

     * Not required for API-only Applications *

  3. Ensure you have flash messages in app/views/layouts/application.html.erb.
     For example:

       <p class="notice"><%= notice %></p>
       <p class="alert"><%= alert %></p>

     * Not required for API-only Applications *

  4. You can copy Devise views (for customization) to your app by running:

       rails g devise:views

     * Not required *
------------------------------------------------------------------

with the help of devise gem we can add extra functionalities like forgot password,remember me,confirmation email in our 
login signup logout 

$ rails generate devise User

this generates user model , migration file , unit test files and routes for sign in sign up etc

$ rails routes 

                              Prefix Verb   URI Pattern                                                                              Controller#Action
                     new_user_session GET    /users/sign_in(.:format)                                                                 devise/sessions#new
                         user_session POST   /users/sign_in(.:format)                                                                 devise/sessions#create
                 destroy_user_session DELETE /users/sign_out(.:format)                                                                devise/sessions#destroy
                    new_user_password GET    /users/password/new(.:format)                                                            devise/passwords#new
                   edit_user_password GET    /users/password/edit(.:format)                                                           devise/passwords#edit
                        user_password PATCH  /users/password(.:format)                                                                devise/passwords#update
                                      PUT    /users/password(.:format)                                                                devise/passwords#update
                                      POST   /users/password(.:format)                                                                devise/passwords#creat

---------------------------------------------------------------------------------------
$ rails db:migrate

it generates table in db

then add  before_action :authenticate_user! in application controller

then add these flash messages
 <p class="notice"><%= notice %></p>
       <p class="alert"><%= alert %></p>
in application.html.erb

so in this way user is required to signup or login to go to the root rout

--------------------------------------------------------


#install bootstrap

yarn add bootstrap@4.3.1 jquery popper.js

then add

import "bootstrap"
into javascript/packs/application.js

then add javascript

const webpack = require("webpack")

environment.plugins.append("Provide", new webpack.ProvidePlugin({

$: 'jquery',

jQuery: 'jquery',

Popper: ['popper.js', 'default']

}))

into  config/webpack/environment.js 


then add

*= require bootstrap

into assets/stylesheet/application.css

-------------------------------------------------------------------------

#use bootstrap devise gem to style devise views

https://github.com/hisea/devise-bootstrap-views

Add this line to your application's Gemfile:

gem 'devise-bootstrap-views', '~> 1.0'
And then execute:

$ bundle install

The devise:views:bootstrap_templates generator will copy all views to your application, so you can modify the files as you wish:

$ rails generate devise:views:bootstrap_templates

this will show the views under devise folder and bootstrap automatically implemented to it