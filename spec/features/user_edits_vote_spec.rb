require "rails_helper"

feature "User edits vote", %{
  I want to be able to change my vote
  So that I can be fickle
  } do
  scenario "change vote from up to down" do
    @review = FactoryGirl.create(:review)
    @bus = @review.ride.bus
    @user = FactoryGirl.create(:user)
    sign_in_as(@user)
    FactoryGirl.create(:vote, review: @review, user: @user)
    visit bus_path(@bus)
    within("#review-#{@review.id}") { click_link "Down" }
    expect(page).to have_content("Vote changed!")
  end
end
