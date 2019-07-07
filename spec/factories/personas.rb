FactoryBot.define do
  factory :persona do
    name { Faker::JapaneseMedia::DragonBall.character }
    pv { Faker::Number.between(1, 100) }
    pa { Faker::Number.between(1, 100) }
  end
end
