# frozen_string_literal: true

FactoryBot.define do
  factory :room do
    title { 'MyString' }
    description { 'MyString' }
    max_user_num { 1 }
  end
end
