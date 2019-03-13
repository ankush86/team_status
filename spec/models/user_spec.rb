require 'rails_helper'
require 'pry'

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.build(:user) }

  describe "Associations" do
    it { should have_many(:assigned_projects) }
    it { should have_many(:projects) }
  end

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(user).to be_valid
    end

    it "is not valid without a first_name" do
      user.first_name = nil
      expect(user).to_not be_valid
    end

    it "is not valid without last_name" do
      user.last_name = nil
      expect(user).to_not be_valid
    end

    it "is not valid without email" do
      user.email = nil
      expect(user).to_not be_valid
    end

    it "is not valid without contact" do
      user.contact = nil
      expect(user).to_not be_valid
    end

    it "is not valid without skills" do
      user.skills = nil
      expect(user).to_not be_valid
    end
  end

  describe '#full_name' do
    context 'full name' do
      it 'should have full name' do
        user = FactoryBot.create(:user)
        expect(user.full_name).to eq "#{user.first_name} #{user.last_name}"
      end
    end
  end
end
