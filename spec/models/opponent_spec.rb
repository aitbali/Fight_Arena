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

require 'rails_helper'

RSpec.describe Opponent, type: :model do
  it "is creatable" do
    persona = create(:opponent)
    expect(persona.name).not_to be_blank
    expect(persona.pv).not_to be_blank
    expect(persona.pa).not_to be_blank
  end

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_length_of(:name).is_at_most(50) }
  it { is_expected.to validate_presence_of(:pv) }
  it { is_expected.to validate_presence_of(:pa) }
end
