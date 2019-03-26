FactoryBot.define do

  factory :user do
    email "kblack@ymca.org"
    first_name "Kim"
    last_name "Black"
    password "secret123"
    password_confirmation "secret123"
    role "admin"
  end

end