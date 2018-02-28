Shopper Challenge
=================

## Usage

The application was developed with Ruby 2.5.0p0 and Rails 5.1.5. The database for the production environment is Postgres (For usage with Heroku), test and development environments are in Sqlite3.  In the project directory:

```bash
$ bundle install
$ rails db:create db:migrate
$ rails server
```
In the web browser go to `localhost:3000`, this takes the user to the Home page.

## Part 2

Script is written in Python

For the usage: `./get_applicants.py "2014-07-01" "2014-09-01"`

Database is assumed to be in the same directory and called "applicants.sqlite3"

Heroku app [Heroku](https://shopper-challege-mzellhuber.herokuapp.com/).