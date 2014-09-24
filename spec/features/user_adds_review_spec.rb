require 'rails_helper'

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

  scenario "review successfully added" do

    user = FactoryGirl.create(:user)
    sign_in_as(user)

    ride = FactoryGirl.create(:ride)
    bus = ride.bus

    visit new_bus_review_path(bus.id)

    review_attrs = { user_id: user.id, ride_id: ride.id, rating: rand(1..5),
      body: Faker::Lorem.sentence }

    review = Review.new(review_attrs)

    select review.ride.description, from: "review[ride_id]"
    select review.rating, from: "review[rating]"

    click_on "Create Review"

    save_and_open_page

    expect(page).to have_content "Review successfully created."
  end

  scenario "creating review fails without bus line number" do
    user = FactoryGirl.create(:user)
    sign_in_as(user)

    ride = FactoryGirl.create(:ride)
    bus = ride.bus

    visit bus_path(bus.id)

    select rand(1..5), from: "review[rating]"

    click_on "Create Review"

    expect(page).to have_content "can't be blank"
  end

  scenario "creating review fails without rating" do
    user = FactoryGirl.create(:user)
    sign_in_as(user)

    ride = FactoryGirl.create(:ride)
    bus = ride.bus

    visit bus_path(bus.id)

    select review.ride.description, from: "review[ride_id]"

    click_on "Create Review"

    expect(page).to have_content "can't be blank"
  end

end
