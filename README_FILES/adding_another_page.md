# Adding another page
So far we have a **landing page** that everybody can access, let's modify it a bit adding the following markup:

```html
<div class="jumbotron">
  <h2>Son, do you want to go to heaven?</h2>
  <p><%= image_tag 'heck-yes.jpg', class: 'center-block img-rounded' %></p>
  <p class="text-center">
    <%= link_to "Yes", heaven_path, class: 'btn btn-primary' %>
  </p>
</div>
```
We've just added a [Bootstrap][bootie] jumbotron with some image inside and a link styled like a button to a second page.

## The second page
Let's also add a second page named `heaven.html.erb` in the `views/static_pages` folder. The content is gonna be pretty simple:
```html
<div class="jumbotron">
  <h1 class="text-center">Welcome to heaven son!</h1>
  <p><%= image_tag 'heaven.jpg', class: 'center-block img-rounded' %></p>
</div>
```
Exactly, another **jumbotron** with some image inside.

To wire this page we are going to need 2 things:

* An empty **action** in our `StaticPagesController` named `heaven` (same name as the view).
```ruby
def heaven
end
```

* And also a **route** to this action in our `routes.rb` file:
```ruby
get 'heaven', :to => 'static_pages#heaven'
```

### The authenticate_user? helper method
This second page is gonna be available only for **logged in** users, but for everyone else is gonna be **off limits**. So how can we do that? [Devise][devise] offers a helper method named `authenticate_user?` that we can use in a `before_action` in any of our controllers.

If we placed at the top of your `ApplicationController` something like this:
```ruby
before_action :authenticate_user!
```

Every time a **not logged-in** user visit any page of our site, she's gonna be automatically redirected to the **log in** page.

But we want to keep a **landing page** available to everybody, so even users that are not logged-in can take a look at our site and see what it's about. To accomplish this, we are gonna put this code at the top of the `StaticPagesController`, and make an exception for the **home action** which is associated with our **home view** (landing page). The whole controller looks like this:

```ruby
class StaticPagesController < ApplicationController
  before_action :authenticate_user!, except: [:home]

  def home
  end

  def heaven
  end
end
```

Now everybody has access to a welcoming landing page, and if someone wants to go to *"heaven"*, must log in first.

> If you want to see how the project looks like so far, checkout the `version-0.3` branch and run `rails server`.

---
[:arrow_backward:][back] | [:house:][home] | [:arrow_forward:][next]

<!-- link references -->
[home]: ../README.md
[back]: generating_devise_model.md
[next]: #

[bootie]: https://github.com/twbs/bootstrap-sass
[devise]: https://github.com/plataformatec/devise
