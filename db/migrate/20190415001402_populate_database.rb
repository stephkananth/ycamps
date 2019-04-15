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

    tiffany_user = User.new
    tiffany_user.role = "counselor"
    tiffany_user.email = "tchen@gmail.com"
    tiffany_user.password = "secret123"
    tiffany_user.password_confirmation = "secret123"
    tiffany_user.first_name = "Tiffany"
    tiffany_user.last_name = "Chen"
    tiffany_user.save!
    puts "Created counselor user, Tiffany"

    nawon_user = User.new
    nawon_user.role = "counselor"
    nawon_user.email = "nchoi@gmail.com"
    nawon_user.password = "secret123"
    nawon_user.password_confirmation = "secret123"
    nawon_user.first_name = "Nawon"
    nawon_user.last_name = "Choi"
    nawon_user.save!
    puts "Created counselor user, Nawon"

    steph_user = User.new
    steph_user.role = "counselor"
    steph_user.email = "sananth@gmail.com"
    steph_user.password = "secret123"
    steph_user.password_confirmation = "secret123"
    steph_user.first_name = "Stephanie"
    steph_user.last_name = "Ananth"
    steph_user.save!
    puts "Created counselor user, Steph"

    # Create Parents
    kelly_parent = Parent.new
    kelly_parent.user_id = kelly_user.id
    kelly_parent.save!
    puts "Created parent, Kelly"

    karen_parent = Parent.new
    karen_parent.user_id = karen_user.id
    karen_parent.save!
    puts "Created parent, Karen"

     # Create Campers
    jack_camper = Camper.new
    jack_camper.parent_id = kelly_parent.id
    jack_camper.first_name = "Jack"
    jack_camper.last_name = "Green"
    jack_camper.save!
    puts "Created camper, Jack"

    jill_camper = Camper.new
    jill_camper.parent_id = kelly_parent.id
    jill_camper.first_name = "Jill"
    jill_camper.last_name = "Green"
    jill_camper.save!
    puts "Created camper, Jill"

    sam_camper = Camper.new
    sam_camper.parent_id = karen_parent.id
    sam_camper.first_name = "Sam"
    sam_camper.last_name = "Ko"
    sam_camper.save!
    puts "Created camper, Sam"

    # Create Counselor
    tiffany_counselor = Counselor.new
    tiffany_counselor.user_id = tiffany_user.id
    tiffany_counselor.save!
    puts "Created Counselor, Tiffany"

    nawon_counselor = Counselor.new
    nawon_counselor.user_id = nawon_user.id
    nawon_counselor.save!
    puts "Created Counselor, Nawon"

    steph_counselor = Counselor.new
    steph_counselor.user_id = steph_user.id
    steph_counselor.save!
    puts "Created Counselor, Steph"

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
    nature_101_badge.save!
    puts "Created badge, Nature 101"

    # Create Camp_Badge
    cb1_1 = CampBadge.new
    cb1_1.badge_id = colorful_world_badge.id
    cb1_1.camp_id = camp_one.id
    cb1_1.save!
    puts "Created camp badge, CB1_1"

    cb1_2 = CampBadge.new
    cb1_2.badge_id = nature_101_badge.id
    cb1_2.camp_id = camp_one.id
    cb1_2.save!
    puts "Created camp badge, CB1_2"

    cb2_1 = CampBadge.new
    cb2_1.badge_id = nature_101_badge.id
    cb2_1.camp_id = camp_two.id
    cb2_1.save!
    puts "Created camp badge, CB2_1"

    # Create Counselor Camp Badge
    ccb_tiffany = CounselorCampBadge.new
    ccb_tiffany.camp_badge_id = cb1_1.id
    ccb_tiffany.counselor_id = tiffany_counselor.id
    ccb_tiffany.save!
    puts "Created counselor camp badge, Tiffany"

    ccb_nawon = CounselorCampBadge.new
    ccb_nawon.camp_badge_id = cb1_2.id
    ccb_nawon.counselor_id = nawon_counselor.id
    ccb_nawon.save!
    puts "Created counselor camp badge, Nawon"    

    ccb_steph = CounselorCampBadge.new
    ccb_steph.camp_badge_id = cb2_1.id
    ccb_steph.counselor_id = steph_counselor.id
    ccb_steph.save!
    puts "Created counselor camp badge, Steph"

    # Create Camper Camp Badge
    camper_cb1 = CamperCampBadge.new
    camper_cb1.camp_badge_id = cb1_1.id
    camper_cb1.camper_id = jack_camper.id
    camper_cb1.completed = "False"
    camper_cb1.save!
    puts "Created camper camp badge, Camper_CB1"    

    camper_cb2 = CamperCampBadge.new
    camper_cb2.camp_badge_id = cb1_1.id
    camper_cb2.camper_id = jill_camper.id
    camper_cb2.completed = "False"
    camper_cb2.save!
    puts "Created camper camp badge, Camper_CB2"

    camper_cb3 = CamperCampBadge.new
    camper_cb3.camp_badge_id = cb1_1.id
    camper_cb3.camper_id = sam_camper.id
    camper_cb3.completed = "False"
    camper_cb3.save!
    puts "Created camper camp badge, Camper_CB3"

    # Create Tasks
    cw1_task = Task.new
    cw1_task.name = "Color Scheme Portrait"
    cw1_task.description = "Campers will understand color schemes and how to find them on the color wheel."
    cw1_task.badge_id = colorful_world_badge.id
    cw1_task.save!
    puts "Created task, Color Scheme Portrait"

    cw2_task = Task.new
    cw2_task.name = "Wax Resistant Paintings"
    cw2_task.description = "Campers will be able to explain how a wax-resist painting works and what makes it different from a regular painting or drawing"
    cw2_task.badge_id = colorful_world_badge.id
    cw2_task.save!
    puts "Created task, Wax Resistant Paintings"   

    cw3_task = Task.new
    cw3_task.name = "Pointillism"
    cw3_task.description = "Campers will know the term Pointillism and be able to create an artwork inspired by the movement."
    cw3_task.badge_id = colorful_world_badge.id
    cw3_task.save!
    puts "Created task, Pointillism" 

    cw4_task = Task.new
    cw4_task.name = "Fourth Task"
    cw4_task.description = "random text lol"
    cw4_task.badge_id = colorful_world_badge.id
    cw4_task.save!
    puts "Created task, Fourth Task"     

    nature1_task = Task.new
    nature1_task.name = "Food Web"
    nature1_task.description = "Campers will be taught about what a food web is and how it can be impacted."
    nature1_task.badge_id = nature_101_badge.id
    nature1_task.save!
    puts "Created task, Food Web"

    nature2_task = Task.new
    nature2_task.name = "Orienteering"
    nature2_task.description = "Campers will learn how to use a compass and map to navigate to a destination"
    nature2_task.badge_id = nature_101_badge.id
    nature2_task.save!
    puts "Created task, Orienteering"

    nature3_task = Task.new
    nature3_task.name = "Nature Hike"
    nature3_task.description = "Campers will be given a list of scavenger hunt-like challenges that they must accomplish during the hike.  Campers will learn about the plants and animals located around camp."
    nature3_task.badge_id = nature_101_badge.id
    nature3_task.save!
    puts "Created task, Nature Hike" 

    # Create Camper Registrations
    cr1 = CamperRegistration.new
    cr1.camp_id = camp_one.id
    cr1.camper_id = jack_camper.id
    cr1.save!
    puts "Created camper registration 1"

    cr2 = CamperRegistration.new
    cr2.camp_id = camp_one.id
    cr2.camper_id = jill_camper.id
    cr2.save!
    puts "Created camper registration 2"

    cr3 = CamperRegistration.new
    cr3.camp_id = camp_one.id
    cr3.camper_id = sam_camper.id
    cr3.save!
    puts "Created camper registration 3"

    cr4 = CamperRegistration.new
    cr4.camp_id = camp_two.id
    cr4.camper_id = jack_camper.id
    cr4.save!
    puts "Created camper registration 4"

    cr5 = CamperRegistration.new
    cr5.camp_id = camp_two.id
    cr5.camper_id = jill_camper.id
    cr5.save!
    puts "Created camper registration 5"

    # Create Camp Counselors
    cc1 = CampCounselor.new
    cc1.camp_id = camp_one.id
    cc1.counselor_id = tiffany_counselor.id
    cc1.save!
    puts "Created camp counselor 1"

    cc2 = CampCounselor.new
    cc2.camp_id = camp_one.id
    cc2.counselor_id = nawon_counselor.id
    cc2.save!
    puts "Created camp counselor 2"    

    cc3 = CampCounselor.new
    cc3.camp_id = camp_two.id
    cc3.counselor_id = steph_counselor.id
    cc3.save!
    puts "Created camp counselor 3"      

  end
end