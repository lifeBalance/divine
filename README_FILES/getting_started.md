# Getting started
Once we have added the [Devise][devise] gem to our `Gemfile`, it is installed in our system, but we still need to run the generator to get it installed in our app:
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

## Preliminary tasks
Let's start taking care of the setup instructions mentioned before:

* Even though we're not gonna be sending email yet, defining **default url options** for our **mailer** is no biggie, so we'll do it now and get it over with. Just add the suggested line to the desired `config/environments`. Could be a good idea to add it to `development.rb` and `test.rb`. We'll take care of `production.rb` when we're ready to deploy.
* We're going to need a **root url** so let's create a controller for a simple static page that will serve as our home:

```
rails generate controller StaticPages home
```

Now we'll edit the `routes.rb` file and set the **root url**:
```ruby
Rails.application.routes.draw do
  root 'static_pages#home'
end
```

* Next, we are going to add **flash messages** to our application layout, so add the following lines to it:
```html
<body>
  <div class="container">
    <% flash.each do |key, value| %>
      <div class="alert <%= key %>-message" role="alert">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>

        <strong><%= key %>!</strong> <%= value %>
      </div>
    <% end %>

    <%= yield %>
  </div>
</body>
```

Since we are going to be using [Bootstrap][bootie] we have also taken the chance to wrap everything in a `div` element with the `container` class.

Also we have added the following styles to our `static_pages.scss` file:

```sass
.alert-message {
  @extend .alert-danger;
  @extend .alert-dismissible;
}
.notice-message {
  @extend .alert-info;
  @extend .alert-dismissible;
}
```

* Since Devise is designed as a **Rails engine**, all its views are packaged inside the gem. This comes in handy to get us started, but most probably we are going to need to modify them. For that we just need to invoke again the Devise **generator** to copy all the **views** to our application:
```
$ rails generate devise:views
```

## Adding a navigation partial
Before start modifying our Devise views, we are going to add a **navigation bar** to the site. So let's create the `views/shared` folder, and inside it let's add the `_navigation.html.erb` partial.

And let's add a `render` call to this partial in our `application.html.erb`:

```html
<body>
  <%= render 'shared/navigation' %>
  <div class="container">
    ...
```

For now that should be enough for getting us started. As we move along we'll be adding more [Bootstrap][bootie] styles to the project.

> If you want to see how the project looks like so far, checkout the `version-0.1` branch and run `rails server`.

---
[:arrow_backward:][back] | [:house:][home] | [:arrow_forward:][next]

<!-- link references -->
[home]: ../README.md
[back]: installing.md
[next]: generating_devise_model.md

[devise]: https://github.com/plataformatec/devise
[bootie]: https://github.com/twbs/bootstrap-sass
