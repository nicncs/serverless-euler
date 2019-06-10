# serverless-euler
Proof of Concept for URL shortener running on API Gateway and Lambda 


Based on Jets framework - https://rubyonjets.com/docs/ and MegaMode - https://blog.boltops.com/2018/11/03/jets-mega-mode-run-rails-on-aws-lambda


Setup.  Install Jets on your workspace

	gem install jets

Change to Ruby 2.5.0 - AWS Lambda only supports this Ruby version

	rvm use 2.5.0

Create new api mode starter project

	jets new serverless-euler --mode api

	cd serverless-euler/

Import Rails app into the project which will create a /rack folder

	jets import:rails ssh://git@github.com/kaodim/euler.git

	cd rack

	bundle

Prepare databases and migration

	bundle exec rails db:create db:migrate

Test locally to make sure rails app working as expected inside /rack folder first

	bundle exec rails s <--- on port 9292

Go back to top level 

	cd ..
	
	jets server

	jets deploy (after setting up AWS credentials through `aws configure`

Sample commands

	$ curl -X GET http://localhost:8080/heartbeat                           
	{"message":"Euler is alive"}

	$ curl --data "url=https://www.facebook.com" -X POST http://localhost:8080/api/v1/services/urls
	{"shortened_url":"4e290f74dd8b306b"}

	$ curl -X GET http://localhost:8080/urls/d32d53c3f035
	<html><body>You are being <a href="https://www.kaodim.com">redirected</a>.</body></html>

	$ curl -X GET http://localhost:8080/urls/4e290f74dd8b306b
	<html><body>You are being <a href="https://www.facebook.com">redirected</a>.</body></html>
