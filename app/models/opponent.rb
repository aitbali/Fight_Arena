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

class Opponent < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  validates :pv, presence: true
  validates :pa, presence: true

  after_initialize :defaults

  def defaults
    self.pv = 100
    self.pa = 100
  end
end
