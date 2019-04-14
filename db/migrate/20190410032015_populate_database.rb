class PopulateDatabase < ActiveRecord::Migration[5.1]
  def change
  	# Create Users
  	kim_user = User.new
    kim_user.role = "admin"
    kim_user.email = "kblack@ymcapgh.org"
    kim_user.password = "secret123"
    kim_user.password_confirmation = "secret123"
    kim_user.first_name = "Kimberly"
    kim_user.last_name = "Black"
    kim_user.save!
    puts "Created admin user, Kim"

    kelly_user = User.new
    kelly_user.role = "parent"
    kelly_user.email = "kgreen@gmail.com"
    kelly_user.password = "secret123"
    kelly_user.password_confirmation = "secret123"
    kelly_user.first_name = "Kelly"
    kelly_user.last_name = "Green"
    kelly_user.save!
    puts "Created parent user, Kelly"

    karen_user = User.new
    karen_user.role = "parent"
    karen_user.email = "kko@yahoo.com"
    karen_user.password = "secret123"
    karen_user.password_confirmation = "secret123"
    karen_user.first_name = "Karen"
    karen_user.last_name = "Ko"
    karen_user.save!
    puts "Created parent user, Karen"

    # Create Branches
    thelma_lovette = Branch.new
    thelma_lovette.name = "Thelma Lovette YMCA"
    thelma_lovette.save!
    puts "Created branch, Thelma Lovette"

    # Create Locations
    camp_site = Location.new
    camp_site.name = "Camp Site"
    camp_site.branch_id = thelma_lovette.id
    camp_site.save!
    puts "Created location, Camp Site"

    # Create Camps
    camp_one = Camp.new
    camp_one.name = "Camp One"
    camp_one.program = "Fairy Tale 1"
    camp_one.location_id = camp_site.id 
    camp_one.start_date = Date.today()
    camp_one.end_date = Date.today() + 5
    camp_one.save!
    puts "Created camp, Camp One"

    camp_two = Camp.new
    camp_two.name = "Camp Two"
    camp_two.program = "Fairy Tale 2"
    camp_two.location_id = camp_site.id 
    camp_two.start_date = Date.today()
    camp_two.end_date = Date.today() + 5
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

    # Create Skills
    art_skill = Skill.new
    art_skill.name = "Art Imaginarium"
    art_skill.category = "Arts and Crafts"
    art_skill.save!
    puts "Created skill, Art Imaginarium"

    outdoor_skill = Skill.new
    outdoor_skill.name = "Nature Quest"
    outdoor_skill.category = "Worst Case Scenario"
    outdoor_skill.save!
    puts "Created skill, Nature Quest"


    # Create Badges
    colorful_world_badge = Badge.new
    colorful_world_badge.name = "It's a Colorful World"
    colorful_world_badge.level = 1
    colorful_world_badge.description = "This badge ackowledges the understanding of the color wheel and color schemes along with the understanding and skill of designing a Pointillism Portrait and wax resistant painting."
    colorful_world_badge.skill_id = art_skill.id
    colorful_world_badge.save!
    puts "Created badge, It's a Colorful World"

    nature_101_badge = Badge.new
    nature_101_badge.name = "Nature 101"
    nature_101_badge.level = 1
    nature_101_badge.description = "This badge acknowledges the basics of nature exploration.  You will learn about the food web and how it impacts us, what is orienteering and how do you do it, and enjoy a nature hike using your new skills."
    nature_101_badge.skill_id = outdoor_skill.id

    # Create Parents
    kelly_parent = Parent.new
    kelly_parent_id = kelly_user.id

    karen_parent = Parent.new
    karen_parent_id = karen_user.id

    # Create Campers
    jack_camper = Camper.new
    jack_camper_parent_id = kelly_user.id
    jack_first_name = "Jack"
    jack_last_name = "Green"

    jill_camper = Camper.new
    jill_camper_parent_id = kelly_user.id
    jill_first_name = "Jill"
    jill_last_name = "Green"

    sam_camper = Camper.new
    sam_camper_parent_id = karen_user.id
    sam_first_name = "Sam"
    sam_last_name = "Ko"        



    # Create Tasks
  # create_table "tasks", force: :cascade do |t|
  #   t.string "name"
  #   t.text "description"
  #   t.bigint "badge_id"
  #   t.datetime "created_at", null: false
  #   t.datetime "updated_at", null: false
  #   t.index ["badge_id"], name: "index_tasks_on_badge_id"
  # end
  end
end
