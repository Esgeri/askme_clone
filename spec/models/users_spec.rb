require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validation check" do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password).on(:create) }
    it { should validate_length_of(:username).is_at_most(40) }
    it { should allow_value('user1').for(:username) }
    it { should allow_value('user1@test.com').for(:email) }
    it { should allow_value('#ffe6e6').for(:background_color) }
    it { should validate_uniqueness_of(:username).ignoring_case_sensitivity }
    it { should validate_uniqueness_of(:email) }
    it { should validate_confirmation_of(:password) }
  end

  describe "association check" do
    it { should have_many(:questions).dependent(:destroy) }
  end

  describe User do
    it "should before validation check" do
      user = User.new(:username => 'User1')
      user.username.downcase!
      user.valid?
      user.username.should == 'user1'
    end
  end
end
