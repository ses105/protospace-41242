FactoryBot.define do
  factory :user do
    email      {Faker::Internet.email}
    name       {Faker::Name.last_name}
    profile    {Faker::Lorem.sentence}
    occupation {Faker::Lorem.sentence}
    position   {Faker::Lorem.sentence}
    password   {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
  end
end

