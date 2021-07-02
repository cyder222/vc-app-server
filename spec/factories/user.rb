require 'securerandom'

FactoryBot.define do
  factory :user, class: User do
    email { Faker::Internet.email }
    name { Faker::Internet.email }
    oauth_token { SecureRandom.hex(10) }
  end
end
