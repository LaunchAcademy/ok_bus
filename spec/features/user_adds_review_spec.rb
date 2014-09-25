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

  context "authenticated user" do
    before :each do
      @user = FactoryGirl.create(:user)
      sign_in_as(@user)

      @ride = FactoryGirl.create(:ride)
      @bus = @ride.bus
    end

    scenario "review successfully added" do
      review_attrs = {
        user: @user,
        ride: @ride,
        rating: rand(1..5),
        body: Faker::Lorem.sentence
      }

      review = Review.new(review_attrs)
      # review = FactoryGirl.build(:review, user: @user, ride: @ride)

      visit new_bus_review_path(@bus)

      select review.ride.description, from: "review[ride_id]"
      select review.rating, from: "review[rating]"

      click_on "Create Review"

      expect(page).to have_content "Review successfully created."
    end

    scenario "creating review fails without rating" do
      visit new_bus_review_path(@bus)

      select @ride.description, from: "Ride"

      click_on "Create Review"

      expect(page).to have_content "can't be blank"
    end
  end

  context "unauthenticated user" do
    scenario "user cannot add a review"
  end
end
