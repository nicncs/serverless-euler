# serverless-euler
Proof of Concept for URL shortener running on API Gateway and Lambda 


Based on Jets framework - https://rubyonjets.com/docs/ and MegaMode - https://blog.boltops.com/2018/11/03/jets-mega-mode-run-rails-on-aws-lambda


Setup

	gem install jets

Change to Ruby 2.5.0 - AWS Lambda only supports this

	rvm use 2.5.0

Create new api mode starter project

	jets new euler-serverless --mode api

	cd euler-serverless/

Import Rails app into the project which will create a /rack folder

	jets import:rails ssh://git@github.com/kaodim/euler.git

	cd rack

	bundle

Prepare databases and migration

	bundle exec rails db:create db:migrate

Test locally to make sure rails app working as expected inside /rack folder first

	bundle exec rails s
