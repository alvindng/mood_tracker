FactoryGirl.define do
  factory :user do
    email 'musashi@miyomoto.com'
    password 'welcome'
    password_confirmation 'welcome'
  end
  factory :user_profile do
    name "arfganochi"
    age 60
    association :user
  end
  factory :entry do
    work 3
    social 3
    health 3
    education 3
    date '12/11/1778'
    association :user
  end
end
