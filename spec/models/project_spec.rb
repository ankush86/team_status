require 'rails_helper'

RSpec.describe Project, type: :model do

  let(:project) { FactoryBot.create(:project) }

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(project).to be_valid
    end

    it "is not valid without name" do
      project.name = nil
      expect(project).to_not be_valid
    end

    it "is not valid without technology" do
      project.technology = nil
      expect(project).to_not be_valid
    end
  end
end
