# Topicbot

A topic suggestion app for podcasters. Currently powering [topics.5by5.tv](http://topics.5by5.tv/).

## To Develop

1. `gem install foreman`
2. `git clone git@github.com:dan/topicbot.git; cd topicbot`
3. `cp sample.env .env` to create an environment file for Foreman.
4. Edit the environment file to point at your local Postgres installation.
5. Create a new Twitter App at [apps.twitter.com](https://apps.twitter.com/) so you have an API Key and API Secret.
6. Edit the values of `TWITTER_API_KEY` and `TWITTER_API_SECRET` in .env with the values from above.
7. `foreman run rake db:setup`
8. `foreman start`

## Want to Contribute?

Great! Fork the repo and open a pull request. Thanks in advance!

