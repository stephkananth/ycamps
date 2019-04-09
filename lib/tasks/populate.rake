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

        thelma_lovette = Branch.new
        thelma_lovette.name = "Thelma Lovette YMCA"
        thelma_lovette.save!
        puts "Created branch, Thelma Lovette"

        camp_site = Location.new
        camp_site.name = "Camp Site"
        camp_site.branch_id = thelma_lovette.id
        camp_site.save!
        puts "Created location, Camp Site"

        camp_one = Camp.new
        camp_one.name = "Camp One"
        camp_one.program = "Fairy Tale 1"
        camp_one.location_id = camp_site.id 
        camp_one.start_date = Date.new(2019,4,8)
        camp_one.end_date = Date.new(2019,4,13)
        camp_one.save!
        puts "Created camp, Camp One"

        camp_two = Camp.new
        camp_two.name = "Camp Two"
        camp_two.program = "Fairy Tale 2"
        camp_two.location_id = camp_site.id 
        camp_two.start_date = Date.new(2019,4,8)
        camp_two.end_date = Date.new(2019,4,13)
        camp_two.save!
        puts "Created camp, Camp Two"

        camp_three = Camp.new
        camp_three.name = "Camp Three"
        camp_three.program = "Fairy Tale 2"
        camp_three.location_id = camp_site.id 
        camp_three.start_date = Date.new(2019,5,8)
        camp_three.end_date = Date.new(2019,5,13)
        camp_three.save!
        puts "Created camp, Camp Three"

    end
end