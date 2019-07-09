require 'rails_helper'

RSpec.describe PersonasController, type: :controller do
  describe "#index" do
    let!(:personas) { create_list(:persona, 5) }

    subject do
      get :index
    end

    it "returns all the personas" do
      subject
      expect(json_response[:personas].size).to eq(5)
    end
  end

  describe "#show" do
    let(:persona) { create(:persona) }
    let(:id) { persona.id }

    subject do
      get :show, params: { id: id }
    end

    it "returns the turtle" do
      subject
      expect(json_response[:persona][:name]).to eq(persona.name)
      expect(json_response[:persona][:pv]).to eq(100)
      expect(json_response[:persona][:pa]).to eq(50)
    end

    # context "the persona does not exist" do
    #  let(:id) { "123" }

    #  it "returns not found" do
    #    subject

    #    expect(json_response).to be_not_found
    #  end
    # end
  end

  describe "#new"

  describe "#create" do
    let(:name) { Faker::Movies::StarWars.character }
    let(:pv) { Faker::Number.between(1, 100) }
    let(:pa) { Faker::Number.between(1, 100) }

    subject do
      post :create, params: { name: name, pv: pv, pa: pa }
    end

    it "creates the persona" do
      #  expect{ subject }.to change(Persona, :count).by(1)
      # expect(json_response[:persona][:name]).to eq(name)
      #  expect(json_response[:persona][:pv]).to eq(100)
      #  expect(json_response[:persona][:pa]).to eq(50)
      #  first_persona = Persona.first
      #  expect(first_persona.name).to eq(name)
      #  expect(first_persona.pv).to eq(100)
      #  expect(first_persona.pa).to eq(50)
    end

    # context "with no name" do
    #  let(:name) { nil }
    #  it "fails" do
    #    expect{ subject }.not_to(change(Persona, :count))
    #    expect(json_response).to be_forbidden
    #  end
    # end
  end

  describe "#edit"

  describe "#update" do
    let!(:persona) { create(:persona) }
    let(:id) { persona.id }
    let(:name) { Faker::Movies::StarWars.character }

    subject do
      patch :update, params: { id: id, name: name }
    end

    it "updates the persona" do
      expect{ subject }.to change{ persona.reload.name }.to(name)
      expect(json_response[:persona][:name]).to eq(name)
    end
  end

  describe "#destroy" do
    let!(:persona) { create(:persona) }
    let(:id) { persona.id }

    subject do
      delete :destroy, params: { id: id }
    end

    it "destroys the persona" do
      expect{ subject }.to change(Persona, :count).from(1).to(0)
    end

    it "returns no_content" do
      subject
      expect(response).to be_no_content
    end

    # context "the persona does not exist" do
    #  let(:id) { "123" }

    #  it "returns not found" do
    #    expect{ subject }.not_to(change(Persona, :count))
    #    expect(json_response).to be_not_found
    #  end
    # end
  end
end
