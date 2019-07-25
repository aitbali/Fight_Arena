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

class OpponentSerializer < ActiveModel::Serializer
  attributes :id, :name, :pv, :pa
end
