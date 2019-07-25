# == Schema Information
#
# Table name: opponents
#
#  id         :bigint           not null, primary key
#  avatarnum  :integer
#  name       :string
#  pa         :integer
#  pv         :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :opponent do
    name { Faker::JapaneseMedia::DragonBall.character }
    pv { Faker::Number.between(1, 100) }
    pa { Faker::Number.between(1, 100) }
  end
end
