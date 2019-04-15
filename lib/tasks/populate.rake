namespace :db do
<<<<<<< HEAD
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
        kam_user = User.new
        kam_user.role = "admin"
        kam_user.email = "kablack@ymcapgh.org"
        kam_user.password = "secret123"
        kam_user.password_confirmation = "secret123"
        kam_user.first_name = "Kamberly"
        kam_user.last_name = "Black"
        kam_user.save!
        test = User.find_by_email("kablack@ymcapgh.org")
        if test
            puts "Created admin user, #{test.first_name}"
        end
    end
end

=======
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
    require 'faker'
    require 'factory_bot_rails'
  end
end
>>>>>>> 3306fc70603ce21b10a6296b1e790f50f95ac2e6
