# == Schema Information
#
# Table name: opponents
#
#  id         :integer          not null, primary key
#  name       :string
#  pa         :integer
#  pv         :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :opponent do
    name { "MyString" }
    pv { 1 }
    pa { 1 }
  end
end
