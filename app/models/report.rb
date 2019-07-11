# == Schema Information
#
# Table name: reports
#
#  id         :integer          not null, primary key
#  decription :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Report < ApplicationRecord
  belongs_to :persona
end
