Instructions for Assignment 4
1. For this assignment you should work in your own github public repository. Github classroom repository link wouldn’t be provided. This is to ensure that the code is pushed to your Heroku without any issues.
2. Create your own github repository and make sure it contains dev, test and master branches. Clone this repository locally.
3. Create a local copy of your dev branch. Command - $ git branch dev
4. Create a local copy of your test branch. Command - $ git branch test
5. Validate that you have three local branches dev, test, master (this one is automatically created when you clone). Command - $ git branch. It should show these three branches and master should be checked out (* pointer)
6. Checkout the dev branch. Command - $ git checkout dev
7. Add your changes to the staging area $ git add .
8. Commit your changes $ git commit -m "your commit message"
9. Push the changes $ git push <remote> <branch> (NOTE: here the branch should be *dev* and remote is origin)
10.Create a pull request and merge the changes *from dev to test*
11.Create a pull request and merge the changes *from test to master* 
12.Checkout the master branch. Command - $ git checkout master
13.Pull the merged changes from the origin into your local copy of master. Command - $ git pull origin master
14.Add your configuration changes (for Heroku the database should be postgres, change the gemfile and database.yml accordingly)
15.Create a Heroku App and push these changes to the heroku master
15.Push your changes to your Github's master as well. Command - $ git push origin master
16.Submit your heroku app link and github repository link on E-Campus 

Deploy app on Heroku
 
How to deploy your rails app on Heroku.
Step 0: Get a Heroku account from [Heroku].

Step 1: 
The easiest way to install Heroku is via the Javascript package manager "npm".
$ nvm i v8 
$ npm install -g heroku
To test if Heroku toolkit is installed:
$ heroku
Step 2: Install Postgresql. This step is only to prevent the error from installing gem 'pg'. For more advanced usage of postgresql, please read this article. 
$ sudo yum install postgresql postgresql-server postgresql-devel postgresql-contrib postgresql-docs
Step 3: Some modifications to files. (Heroku does not support Sqlite3 database.)
In /config/database.yml, do the modifications accordingly：
default: &default
  adapter: postgresql
  encoding: unicode
  # For details on connection pooling, see Rails configuration guide
  # http://guides.rubyonrails.org/configuring.html#database-pooling
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>

development:
  <<: *default
  database: myapp_development

test:
  <<: *default
  database: myapp_test

production:
  <<: *default
  database: myapp_production
  username: myapp
  password: <%= ENV['MYAPP_DATABASE_PASSWORD'] %>
In /Gemfile, replace
gem 'sqlite3'
with
gem 'pg'
then in command line, run
$ bundle install
Step 4: Push app to Heroku
Login Heroku:
$ heroku login
then enter your credentials.
To save the previous changes to git:
$ git init
$ git add .
$ git commit -m "<your message>"
Create an empty Heroku app:
$ heroku create
Push everything to Heroku app:
$ git push heroku master
Step 5: Data migration. (We have not created postgresql db, so we have to migrate the data into a postgresql db on Heroku.)
$ heroku run rake db:migrate
$ heroku run rake db:seed
Step 6: Check if your app works on Heroku
$ heroku open
The error massage says the web browser cannot be opened, but you can copy and open the URL in your web browser.
 ▸    Error opening web browser.
 ▸    Error: Exited with code 3
 ▸    
 ▸    Manually visit https://your-random-app-name.herokuapp.com/ in your browser.

