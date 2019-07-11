# == Schema Information
#
# Table name: reports
#
#  id         :integer          not null, primary key
#  decription :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Report, type: :model do
end
