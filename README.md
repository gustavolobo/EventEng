EventEng
========
Usage
-----
###Installation
In your project:
```
cd vendor/engines
git clone https://github.com/gustavolobo/EventEng.git
cd ../..
```
In your Gemfile:
```ruby
gem 'event_eng', :path => "vendor/engines"
```
Run:
```
bundle install
rake event_eng:install:migrations
rake db:migrate
```
In your routes file:
```ruby
mount EventEng::Engine, :at => "/event_eng"
```

Contributing
------------
If you found a bug or if you think that should be done an improvement in the project, I'll appreciate any contact.