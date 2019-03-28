FactoryBot.define do
	factory :skill do
		name 'Archery'
		category 'Sports'
	end

	factory :badge do
		association :skill
		name 'Archery 1'
		level 1
		description nil
	end

	factory :task do
		association :badge
		name 'Lesson 1'
		description nil
	end
end