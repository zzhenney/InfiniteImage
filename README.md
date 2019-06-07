database set up: 

1. create database named "ii_development" 
2. create user 'iiadmin'@'localhost' identified by 'team06' 
3. grant all priveleges ON *.* TO 'iiadmin'@'localhost' WITH GRANT OPTION;
4. rake db:reset 
5. rake db:migrate 
6. rake db:seed 

update for thumbnail

1. brew install imagemagick (or whatever installer you use for your machine) 
2. bundle install 
3. depending on your database setup you may have to run "rake db:reset" to reset your database.

Sign up/ Sign in:

I have installed Clearance gem, this can be found in the gemfile.
to sign up go to: localhost:3000/sign_up

