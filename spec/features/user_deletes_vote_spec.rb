require "rails_helper"

feature "User deletes vote", %{
  I want to be able to delete my vote
  So that I can be fickle
  } do
  scenario "delete vote" do
    @review = FactoryGirl.create(:review)
    @bus = @review.ride.bus
    @user = FactoryGirl.create(:user)
    sign_in_as(@user)
    FactoryGirl.create(:vote, review: @review, user: @user)
    visit bus_path(@bus)
    within("#review-#{@review.id}") do
      expect { click_link "Delete Vote" }.to change(Vote, :count).by(-1)
    end
  end
end
