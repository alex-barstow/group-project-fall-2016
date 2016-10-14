![Build Status](https://codeship.com/projects/68fbc850-6ba7-0134-34d9-6efe74dd2a57/status?branch=master)
![Code Climate](https://codeclimate.com/github/alex-barstow/group-project-fall-2016.png)
![Coverage Status](https://coveralls.io/repos/alex-barstow/group-project-fall-2016/badge.png)

# BetterCheddar
[Visit BetterCheddar on Heroku](https://bettercheddar.herokuapp.com/)
### Synopsis
In today’s fast paced world of Cheese Reviewing, BetterCheddar provides a hub for all the “ChedHeads” out there. The site allows users to view different types of cheddar, along with user reviews and ratings. Finally, the world has a place to go for everything about our most popular (and best) cheese.
### Contributors
* Alex Barstow (https://github.com/alex-barstow/)
* George Katsaros (https://github.com/gkatsaros16/)
* Jonathan Kamin-Allen (https://github.com/jkaminallen/)
* Stephen MacVicar (https://github.com/jammjammjamm/)
### Features
* Create and update their own personal account.
* Optionally add an avatar to further personalize their account.
* Create, rate, and review different brands and types of cheddar cheese.
* Add a photo to help further differentiate each different kind of cheese.
* Upvote or downvote other users' cheese reviews to select the most helpful reviews.
* Search for a particular type of cheddar.
### Installation
1. In a terminal, run `git clone https://github.com/alex-barstow/group-project-fall-2016.git`.
1. Navigate to the project's root directory with `cd group-project-fall-2016`.
1. Run `bundle install && npm install && rake db:setup`.
1. In two separate terminals, run `rails server` and `npm start` from the project's root directory.
1. Visit http://localhost:3000 in your browser.
### Technologies Used
* Backend: Rails 5.0.0.1
* User Authentication: Devise
* Image Uploader: CarrierWave
* Image Hosting: Amazon Web Services (s3)
* Search & Live Updating Index: React
* Voting: jQuery
* E-mail: ActionMailer & SendGrid
* Styling: Foundation
* Database: Postgres
* Testing: RSpec, FactoryGirl, Capybara, Capybara-Webkit
