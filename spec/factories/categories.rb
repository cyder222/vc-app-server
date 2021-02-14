
FactoryBot.define do
  sequence(:name, "name_1")
  factory :category, class: Category do
    name
  end
end
