require 'rails_helper'

RSpec.describe Event, type: :model do
  before :each do
    @user = create(:user, name: "User", password: "rootroot", password_confirmation: "rootroot")
  end

  context "Unit Tests:" do
    it "Creates a regular Event" do
      event = build(:event, title: "Event Title", description: "Event description", creator_id: @user.id)
      expect(event).to be_valid
    end

    it "Needs a title" do
      event = build(:event, title: nil, creator_id: @user.id)
      expect(event).to_not be_valid
    end

    it "Doesn't need a description" do
      event = build(:event, description: nil, creator_id: @user.id)
      expect(event).to be_valid
    end

    it "Needs a creator ID" do
      event = build(:event, creator_id: nil)
      expect(event).to_not be_valid
    end

    it "Needs a creation date" do
      event = build(:event, creator_id: @user.id, event_date: nil)
      expect(event).to_not be_valid
    end
  end
end
