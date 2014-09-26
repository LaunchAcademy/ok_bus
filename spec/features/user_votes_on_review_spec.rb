require "rails_helper"

feature "User votes on a review", %{
  As a User, I want to vote on reviews
  So that I can shame really nasty reviewers
  } do
  before :each do
    @review = FactoryGirl.create(:review)
    @bus = @review.ride.bus
    visit bus_path(@bus)
  end

  scenario "vote added to up vote count" do
    @user = FactoryGirl.create(:user)
    sign_in_as(@user)
    visit bus_path(@bus)
    save_and_open_page
    within("#review-#{@review.id}") {
      expect(click_on "Up").to change(@review.up_votes).by(1)
     }
    within("#review-#{@review.id}") {
      expect(click_on "Up").to change(@review.down_votes).by(1)
     }
  end

  scenario "must be logged on to vote" do
    expect(page).to_not have_content "Vote"
  end
end
