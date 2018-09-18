require 'rails_helper'

RSpec.describe Question, type: :model do
  describe "validation check" do
    it { should validate_presence_of :text }
    it { should validate_presence_of :user }
    it { should validate_length_of(:text).is_at_most(255) }
  end

  describe "association check" do
    it { should belong_to(:user) }
    it { should belong_to(:questioning_user).class_name('User') }
    it { should have_and_belong_to_many(:tags) }
  end
end
