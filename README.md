# Divine
This repo is intended as a playground for experimenting with [Devise][l1], a gem for Rails that has become almost the *de facto* standard for implementing authentication.

## Setup
First and obvious step is generating the rails project itself and change into it:
```
$ rails new divine
$ cd divine
```
### Installing Devise
To start playing we need to install [Devise][l1] itself, which is a matter of adding the following line to our `Gemfile`:
```
gem 'devise', '~> 3.5.2'
```

And run in our terminal:
```bash
$ bundle install
```

<!-- links -->
[l1]: https://github.com/plataformatec/devise
