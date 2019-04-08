namespace :db do
    desc "Erase and fill database"
    # creating a rake task within db namespace called 'populate'
    # executing 'rake db:populate' will cause this script to run
    task :populate => :environment do
        # Drop the old db and recreate from scratch
        Rake::Task['db:drop'].invoke
        Rake::Task['db:create'].invoke
        # Invoke rake db:migrate
        Rake::Task['db:migrate'].invoke
        Rake::Task['db:test:prepare'].invoke
        # Need gem to make this work when adding students later: faker
        # Docs at: http://faker.rubyforge.org/rdoc/
        require 'faker'
        require 'factory_bot_rails'

        # Step 1: Create some instructors
        kim_user = User.new
        kim_user.role = "admin"
        kim_user.email = "kblack@ymcapgh.org"
        kim_user.password = "secret123"
        kim_user.password_confirmation = "secret123"
        kim_user.first_name = "Kimberly"
        kim_user.last_name = "Black"
        kim_user.save!
        puts "Created admin user, Kim"
    end
end