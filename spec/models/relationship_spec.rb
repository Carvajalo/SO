require 'rails_helper'

RSpec.describe Relationship, type: :model do

  # Validations Test:
  # Validate follower_id
  describe "Validation" do
    it { should validate_presence_of(:follower_id) }
  end

  # Validate followed_id
  describe "Validation" do
    it { should validate_presence_of(:followed_id) }
  end

  # Associations Test :
  # Belongs_to:follower
  describe "Association" do
    it { should belong_to(:follower).class_name('User') }
  end

  # Belongs_to:followed
  describe "Association" do
    it { should belong_to(:followed).class_name('User') }
  end
end