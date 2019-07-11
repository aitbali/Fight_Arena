# == Schema Information
#
# Table name: personas
#
#  id         :integer          not null, primary key
#  avatarnum  :integer
#  name       :string
#  pa         :integer
#  pv         :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Persona < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  validates :pv, presence: true
  validates :pa, presence: true
end
