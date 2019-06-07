# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"


set :environment, :development        #ENVIRONMENT IS SET TO DEVELOPMENT, MAY NEED WORK FROM Andre

#7/18/18 Paul Ancajima
# RUNS LOCAL ONLY MUST REFER TO https://github.com/javan/whenever FOR MORE INFO
#
# bundle exec whenever
# whenever --update-crontab
#
every :day, at: '12:00am' do
  #EVERYDAY AT MIDNIGHT PST THIS WILL DELETE ALL UNAPPROVED IMAGES
  rake "delete_unapproved"
end

# UNCOMMENT BELOW FOR TESTING. SHOULD DELETE ANY UNAPPROVED IMAGES IN 1 MINUTE
# every 1.minute do
#   #EVERYDAY AT MIDNIGHT PST THIS WILL DELETE ALL UNAPPROVED IMAGES
#   rake "delete_unapproved"
# end

# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
