# 'Rate Limiter' Coding Challenge Solution

## Challenge

Create a home controller with an index method. This should return only the text string "ok".

The challenge is to implement rate limiting on this route. Limit it such that a requester can only make 100 requests per hour. After the limit has been reached, return a 429 with the text "Rate limit exceeded. Try again in #{n} seconds".

## Requirements
1. Ruby 2.2.2
2. Rails 4.2.6
3. SQLite3

##Synopsis

The solution uses a simple approach that makes use of a SQLite database to keep track of requests for rate limiting.

There is a Home Controller which hs an index method which returns the message "Ok" and code 200 when the rate limit is not exceeded

The no. of requests are checked by a "before action" method in the application controller and kept track of using the DB. If the rate limit is exceeded the method returns code 429 with the message "Rate limit exceeded. Try again in #{n} seconds".

Every hour at 00 minutes a cron job runs to clear the db to allow more requests

## Tests

Specs are written that test the controller method. These test a range of scenarios and logic paths. 

Execute the following command to run the tests
`bundle exec rspec`

 
## Follow the below commands to setup this project

1. `bundle install`
2. `whenever --update crontab`
3. `bundle exec rake db:create`
4. `bundle exec rake db:migrate`
5. `rails server`
6. Visit localhost:3000 at the root path



