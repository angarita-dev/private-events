require 'factory_bot'

 FactoryBot.define do
   factory :user do |f|
    f.name { "Jane Doe" }
    f.password { "supersecret123" }
    f.password_confirmation { "supersecret123" }
  end
end
