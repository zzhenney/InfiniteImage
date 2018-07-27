# csc648-su18-Team06

Branch: upload_backend_connection
Joe Phabmixay 7/27/18

Current idea: Copied the front-end code of view/home/upload into view/images/form. This is so that the upload frontend can use the controller of Images in order to be added to database. 

There were some changes that had to be made to routes, and I am unsure if this is the best sort of implementation to go with without communicating the idea with the team.

Also, there were errors with receiving user_id in Andre's get_author method in controllers/images_controllers. This is most likely due to the deletion of those attributes from the database, and we had wondered where user_id originally came from, and it looks like it was needed the entire time! (I removed it originally by mistake, fixed in new migration)

======

Quick summary:    
The upload route in /config/routes.rb changed to 'images#new' (still retains url ...com/upload). Front page is rendered in /view/images/new and form is rendered in /form.html.erb

Original upload file is still located in /views/home/upload

New migration to re-add user_id, as it was needed for user ownership of images