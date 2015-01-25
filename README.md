# Topicbot

A topic suggestion app for podcasters. Currently powering [topics.5by5.tv](http://topics.5by5.tv/).

## Run Your Own

To create your own Topicbot running on Heroku, sign up for a [free Heroku account](https://signup.heroku.com/www-header) if you don't have one, then click this:

[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)

## To Develop

1. `gem install foreman`
2. `git clone git@github.com:dan/topicbot.git; cd topicbot`
3. `cp sample.env .env` to create an environment file for Foreman.
4. Edit the environment file to point at your local Postgres installation.
5. Create a new Twitter App at [apps.twitter.com](https://apps.twitter.com/) so you have an API Key and API Secret.
6. Edit the values of `TWITTER_API_KEY` and `TWITTER_API_SECRET` in .env with the values from above.
7. `foreman run rake db:setup`
8. `foreman start`

## Adding an Admin User

To create topics, you'll need to create at least one admin user. You should do this right away and on the first user you create, like this:

1. Sign in with Twitter (click the link on the top right of the site) and authorize yourself.
2. `foreman run rails c`
3. `u = User.first`
4. `u.is_admin = true`
5. `u.save`

Now you can create topics.

## Want to Contribute?

Great! Fork the repo and open a pull request. Thanks in advance!

## Todo

1. Add a way to mark suggestions/questions as *answered*, with a link to the answer.
2. Create a better way to navigate users and make them admins.
