# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email 'kblack@ymca.org'
    first_name 'Kim'
    last_name 'Black'
    password 'secret123'
    password_confirmation 'secret123'
    role 'admin'
  end

  factory :parent do
    association :user
    active true
  end

  factory :camper do
    association :parent
    first_name 'Bobby'
    last_name 'Tables'
    active true
  end

  factory :counselor do
    association :user
    active true
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

  factory :branch do
    name 'Thelma Lovette'
  end

  factory :location do
    name 'Thelma Lovette YMCA'
    association :branch
  end

  factory :camp do
    association :location
    name 'Generic Summer Camp Name'
    program 'Generic Summer Camp Program'
    start_date Date.today
    end_date Date.tomorrow
    active true
  end

  factory :camp_badge do
    association :camp
    association :badge
  end

  factory :camper_camp_badge do
    association :camper
    association :camp_badge
    completed true
  end

  factory :camper_camp_badge_task do
    association :camper_camp_badge
    association :task
    completed true
  end

  factory :counselor_camp_badge do
    association :camp_badge
    association :counselor
  end
end
