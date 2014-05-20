# simple_auth

BASED ON: https://github.com/pauldix/service-oriented-design-with-ruby/tree/master/chapter_01

## Getting Started
if you don't have bundler installed, then please do the following:

    $ gem install bundler --version=1.0.7

Remove Gemfile.lock:

    $ rm Gemfile.lock

Then install the gems within the root of the project:

    $ bundle install

## Migrating the Database (local)
To create a local `development` or `test` database (pick one):

    $ rake db:migrate SINATRA_ENV=test
    $ rake db:migrate SINATRA_ENV=development

## Running the app (local)
 Run the Sinatra service. Use the `-e` flag, to specify `test` or `development`.
 The test environment will create a database entry

    $ ruby service.rb -e test


To view service, point browser to: http://localhost:4567/... or use curl:

    $ curl localhost:4567/api/v1/users/paul
    $ curl -X POST -H "Content-Type: application/json" -d '{"name":"Ray", "email":"soumyaray@fiction.net", "bio":"prof" }' http://localhost:4567/api/v1/users
note: the second curl command is sending a request json data in the HTTP body

## Publishing on Heroku
Create a new Heroku app (skip if you already made one)

    $ heroku create <name-of-your-app>

Send repo to Heroku:

    $ git push heroku master

Configure Heroku to run in production:

    $ heroku config:add SINATRA_ENV=production
note: this is equivalent to local cmd: `ruby app.rb -e production`

You may have to restart Heroku (try it once without doing so):

    $ heroku restart        # do this from the sinatra app's root directory

Create the database on Heroku:

    $ heroku run rake db:migrate

Check for logging errors:

    $heroku logs


 <!-- The following does not yet work -- please ignore for now
 To test service (note, may not work on latest code version):
 rspec spec/client_spec.rb -->
