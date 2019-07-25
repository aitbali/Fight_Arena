# == Schema Information
#
# Table name: reports
#
#  id         :bigint           not null, primary key
#  decription :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :report do
    decription { "MyText" }
  end
end
