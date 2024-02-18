# CSSE-490-lab-3

Lab 3: Photo Processing App

## Project Setup


### Cloning and Installing Dependencies

Make sure you have Ruby 3.1.4 or Ruby 3.2.x installed locally [on Windows using WSL](https://gorails.com/setup/windows/11) or [on Mac/Linux](https://www.ruby-lang.org/en/documentation/installation/). To push to Heroku, you'll also need to install the [Heroku CLI](https://devcenter.heroku.com/articles/heroku-cli)).  If using Ruby 3.2.x, update the `.ruby-version` file to match your version of Ruby.

You will also need postgresql installed.  On OS X you can install it via `brew install postgresql`.  On Linux/WSL use the instructions in [Get started with databases on Windows Subsystem for Linux](https://docs.microsoft.com/en-us/windows/wsl/tutorials/wsl-database).  Be sure to *start* the postgres database server once you have installed postgres itself (instructions are printed out via. brew/in the article).  On Linux/WSL you will likely need to run `apt install libpq-dev` in order to install all of the python packages below.

```sh
$ git clone <repo url>
$ cd lab-3-<your_github_username>
# NOTE: Bundle will fail if you haven't installed postgres yet
$ bundle
```

Prepare the database:
```
$ cp config/database.yml.example config/database.yml
# Update config/database.yml with any username or password information required for your local postgres server
$ rake db:create:all
$ rake db:migrate
$ rake db:environment:set
$ rake db:test:prepare
```

### Running Tests

Run the full test suite with `rake` or `rake test`.

Run a single test with `rspec spec/path/to_spec.rb:6`, replacing `rspec/path/to_spec.rb` with the path to your actual test, and `6` with the actual line number of the test you are trying to run.

### Running Locally

Create the local development databases and load them with the correct schema.


```sh
$ rerun rackup
```

* `rerun` watches for filesystem changes and restarts your app as needed
* `rackup` runs rack applications (Sinatra is a rack application)

Your app should now be running on [localhost:9292](http://localhost:9292/).

## Deploying to Heroku

### Creating the Heroku application

```sh
$ heroku create

# Create the postgres database
$ heroku addons:create heroku-postgresql:mini

$ git push heroku main
$ heroku run rake db:migrate

$ heroku open
```

### Testing in a local Heroku environment

```sh
$ heroku local
```

### Pushing up new updates to the existing application

```sh
$ git push heroku main
```
