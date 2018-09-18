require 'rails_helper'

RSpec.describe Tag, type: :model do
  describe "association check" do
    it { should have_and_belong_to_many(:questions) }
  end
end
