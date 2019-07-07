require 'rails_helper'

RSpec.describe Persona, type: :model do
   it "is creatable" do
    persona = create(:persona)
    expect(persona.name).not_to be_blank
    expect(persona.pv).not_to be_blank
    expect(persona.pa).not_to be_blank
  end

 
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_length_of(:name).is_at_most(10) }
  it { is_expected.to validate_presence_of(:pv) }
  it { is_expected.to validate_presence_of(:pa) }
end
