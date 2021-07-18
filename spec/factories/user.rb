require 'securerandom'

FactoryBot.define do
  factory :user, class: User do
    uid { SecureRandom.random_number(10) }
    email { Faker::Internet.email }
    name { Faker::Internet.email }
    oauth_token { SecureRandom.hex(10) }
  end
end
