== Welcome to Example Package Gon

1. git clone git://github.com/cnruby/learn_rails.git
2. cd learn_rails/gon_demo/
3. bundle install
4. rake db:migrate
5. rake db:fixtures:load
6. rails server
7. open http://localhost:3000/products.json
8. open http://localhost:3000/products

== Getting Started

1.1. rails new demo_gon
1.2. cd demo_gon
1.3. rails generate scaffold product name:string price:decimal
1.4. rake db:migrate RAILS_ENV=development
1.5. rake db:fixtures:load

2.1. vim Gemfile
#	下面两个软件包顺序，软件包rabl在先，而软件包gon在后
#	gem 'rabl', '=0.6.10'
#	gem 'gon', '=3.0.0'
#	https://github.com/railscasts/episode-324/blob/master/store-after/Gemfile
2.2 bundle install
2.3 vim app/views/layouts/application.html.erb
#	line 8+
#	https://github.com/railscasts/episode-324/blob/master/store-after/app/views/layouts/application.html.erb
2.4	vim app/controllers/products_controller.rb
#	line 3+
#	https://github.com/railscasts/episode-324/blob/master/store-after/app/controllers/products_controller.rb
2.5 vim assets/javascripts/products.js.coffee
#	line 4+
#	https://github.com/railscasts/episode-324/blob/master/store-after/app/assets/javascripts/products.js.coffee
2.6 touch app/views/products/index.json.rabl
2.7 vim app/views/products/index.json.rabl
#	line all+
#	https://github.com/railscasts/episode-324/blob/master/store-after/app/views/products/index.json.rabl

3.1 rails server
3.2 open http://localhost:3000/products.json
3.3 open http://localhost:3000/products

4.1 https://github.com/railscasts/episode-324/
4.2 http://railscasts.com/episodes/324-passing-data-to-javascript?view=asciicast
4.3 http://railscasts.com/episodes/324-passing-data-to-javascript
