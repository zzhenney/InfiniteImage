# csc648-su18-Team06


BRANCH OF DATABASE_DEVELOPMENT -- Follow Paul's Instructions first!!
Following tutorial: https://barnesian.com/adding-a-drop-down-list-in-rails-with-a-foreign-key/


Added drop-down menu of foreign keys for image postings.
IMPORTANT: 
    Image Tag Column has been changed to a foreign key, and might conflict with existing databases on local machines. I am unsure if db:migrate fixes it completely, or will have to run a db:reset to purge all data.

    As Paul has said, nothing important is stored locally anyways


CHANGES

Tag table migration created with id and name
Tags are created in /db/seeds.rb
tag_id changed from integer to foreign key
    > /models/image.rb --> belongs_to :tag
    > /views/forms.html.erb --> drop down menu for tag selection
    > /views/show.html.erb --> @image.tag_id to @image.tag.name 

I had to change my socket on /config/database.yml to point to my local machine for testing. Commented it it out before pushing to branch.

==================================================================

7/7/18
<img width="668" alt="screen shot 2018-07-07 at 3 43 13 pm" src="https://user-images.githubusercontent.com/39932781/42415243-cf18e22c-81fc-11e8-8540-3f5d44816f58.png">

==================================================================

http://localhost:3000/users can now add users and some data

TO CREATE YOUR DATABASE LOCALLY ON MYSQL WITH MY SAME EXACT SETTINGS
Database instruction for our project:
create database ii_development
create user 'iiadmin'@'localhost' identified by 'team06'
grant all on iidevelopment to ‘iiadmin’@‘localhost’

YOU WILL NOT HAVE THE SAME DATA I HAVE ON MY LOCAL MACHINE BUT YOU CAN HAVE THE SAME SCHEMA
AT THE MOMENT WE DONT HAVE ANYTHING IMPORTANT LOCALLY ANYWAYS 
LOOKUP UP COMMANDS rake db:schema:load, rake db:create, AND rake db:migrate THESE WILL HELP WITH TESTING 


