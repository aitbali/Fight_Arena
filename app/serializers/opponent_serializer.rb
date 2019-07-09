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

class OpponentSerializer < ActiveModel::Serializer
  attributes :id, :name, :pv, :pa
end
