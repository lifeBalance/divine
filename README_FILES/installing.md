# Installing stuff
First and obvious step is generating the rails project itself and change into it:
```
$ rails new divine -T
$ cd divine
```

Since we are going to be using [Rspec][rspec] for testing purposes, it's better to generate the Rails app without the **default test suite** ([Minitest][minitest]), hence the `-T` option.

### Installing Devise
To start playing we need to install [Devise][devise] itself, which is a matter of adding the following line to our `Gemfile`:
```
gem 'devise', '~> 3.5.2'
```

And run in our terminal:
```bash
$ bundle install
```
### Installing Bootstrap
To add style to our views we are gonna use the [bootstrap-sass][bootie] gem, again adding it to the `Gemfile`:
```
gem 'bootstrap-sass', '~> 3.3.5'
```

And running again:
```bash
$ bundle install
```
Then we have to make a couple of changes such as:

1. Importing the Bootstrap styles in `app/assets/stylesheets/application.css`:
    ```
    @import "bootstrap-sprockets";
    @import "bootstrap";
    ```

2. Make sure that `bootstrap-sprockets` is imported before `bootstrap` for the icon fonts to work.
3. Also, change the extension of `application.css` to `.scss`.
4. Then, remove all the `*= require_self` and `*= require_tree .` statements from the sass file. Instead, use `@import` to import Sass files.
5. Require Bootstrap Javascripts in `app/assets/javascripts/application.js`:
    ```
    //= require jquery
    //= require bootstrap-sprockets
    ```

    `bootstrap-sprockets` provides all the Bootstrap Javascript in individual files (`alert.js`, `dropdown.js`, etc), whereas the `bootstrap` file provides a concatenated file containing all Bootstrap Javascripts, that's why `bootstrap-sprockets` and `bootstrap` should not be require together.

---
[:house:][home] | [:arrow_forward:][next]

<!-- links -->
[home]: ../README.md
[next]: getting_started.md

[devise]: https://github.com/plataformatec/devise
[bootie]: https://github.com/twbs/bootstrap-sass
[rspec]: https://github.com/rspec/rspec-rails
[minitest]: https://github.com/seattlerb/minitest
