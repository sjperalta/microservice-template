FactoryBot.define do
    factory :user do
        full_name { Faker::Name.name }
        email { Faker::Internet.email }
        password { Faker::Internet.password }
        status {1}
    end
end

  