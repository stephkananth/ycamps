FactoryBot.define do
  factory :camp_counselor do
    camp nil
    counselor nil
  end
  factory :camper_registration do
    camp nil
    camper nil
  end
  factory :user do
    email "kblack@ymca.org"
    first_name "Kim"
    last_name "Black"
    password "secret123"
    password_confirmation "secret123"
    role "admin"
  end

  factory :branch do
    name "Thelma Lovette"
  end

  factory :location do
    name "Thelma Lovette YMCA"
    association :branch
  end

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