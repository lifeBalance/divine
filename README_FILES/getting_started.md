# Getting started
Once [Devise][devise] is installed, we need to run the generator:
```
$ rails generate devise:install
      create  config/initializers/devise.rb
      create  config/locales/devise.en.yml
===============================================================================

Some setup you must do manually if you haven't yet:

  1. Ensure you have defined default url options in your environments files. Here
     is an example of default_url_options appropriate for a development environment
     in config/environments/development.rb:

       config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }

     In production, :host should be set to the actual host of your application.

  2. Ensure you have defined root_url to *something* in your config/routes.rb.
     For example:

       root to: "home#index"

  3. Ensure you have flash messages in app/views/layouts/application.html.erb.
     For example:

       <p class="notice"><%= notice %></p>
       <p class="alert"><%= alert %></p>

  4. If you are deploying on Heroku with Rails 3.2 only, you may want to set:

       config.assets.initialize_on_precompile = false

     On config/application.rb forcing your application to not access the DB
     or load models when precompiling your assets.

  5. You can copy Devise views (for customization) to your app by running:

       rails g devise:views

===============================================================================
```

The output of this command contains important instructions to keep in mind for later. The generator creates just two files:
* An **initializer** which describes ALL of Devise's configuration options.
* A **locale file** which comes in handy for customizing Devise's messages according to user's language.


---
* [Home][home]
* [Back][back]
* [Next][next]

<!-- link references -->
[home]: ../README.md
[back]: installing.md
[next]: getting_started.md

[devise]: https://github.com/plataformatec/devise
