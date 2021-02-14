FactoryBot.define do
  sequence(:title, "title_1")
  sequence(:description, "description_1")
  factory :room do
    title
    description
    max_user_num { 1 }
    main_language { "ja" }
  end
end
