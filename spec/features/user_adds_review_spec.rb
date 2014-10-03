require "rails_helper"

feature "User adds a review", %{
  As a user
  I want to add a review
  So that I can provide other users
  with my evaluation of my experience

  Acceptance Criteria:

  I must be logged in to create a review
  I must add a new review from the bus
  detail page
  I must specifiy the bus line, otherwise
  there is an error
  I must select a rating 1-5
  I can optionally add a review body
  I can specify ride time, day (weekday/
    weekend), and bus direction
  } do

  let(:ride) { FactoryGirl.create(:ride) }
  let(:bus) { ride.bus }

  context "authenticated user" do
    before :each do
      @user = FactoryGirl.create(:user)
      sign_in_as(@user)
    end

    scenario "review successfully added" do
      review = FactoryGirl.build(:review, user: @user, ride: ride)

      visit bus_path(bus)
      click_on "New Review"

      select review.ride.timeframe, from: "ride[timeframe]"
      select review.ride.day, from: "ride[day]"

      if review.ride.direction = "inbound"
        select review.ride.bus.inbound, from: "ride[direction]"
      else
        select review.ride.bus.outbound, from: "ride[direction]"
      end

      select review.rating, from: "review[rating]"

      click_on "Submit Review"

      expect(page).to have_content "Review successfully created."
    end

    scenario "creating review fails without rating" do
      visit bus_path(bus)
      click_on "New Review"

      select ride.timeframe, from: "ride[timeframe]"
      select ride.day, from: "ride[day]"

      if ride.direction = "inbound"
        select ride.bus.inbound, from: "ride[direction]"
      else
        select ride.bus.outbound, from: "ride[direction]"
      end

      click_on "Submit Review"

      expect(page).to have_content "can't be blank"
    end
  end

  context "unauthenticated user" do
    scenario "user cannot add a review" do
      visit new_bus_review_path(bus)

      expect(page).to have_content
      "You need to sign in or sign up before continuing."
    end

    scenario "user doesn't have access to New Review button" do
      visit bus_path(bus)
      expect(page).to_not have_button "New Review"
    end
  end
end
