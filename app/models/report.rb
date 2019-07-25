# == Schema Information
#
# Table name: reports
#
#  id         :bigint           not null, primary key
#  decription :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Report < ApplicationRecord
  validates :decription, presence: true
end
