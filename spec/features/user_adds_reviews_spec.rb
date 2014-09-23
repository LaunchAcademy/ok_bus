require 'rails_helper'

feature "User views reviews", %Q{
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

    bus = FactoryGirl.create(:bus)

    visit new_review_path(bus.id)

    review_attrs = { bus_line_number: rand(1..100), rating: rand(1..5) }

    review = Review.new(review_attrs)

    fill_in 'Bus line number', with: review.body
    select review.rating, from: 'review[rating]'

    click_button 'Create Rating'

    expect(page).to have_content "Review successfully created."
  end

  scenario "creating review fails without bus line number" do
    bus = FactoryGirl.create(:bus)

    visit bus_path(bus.id)

    select rand(1..5), from: 'review[rating]'

    click_on 'Create Review'

    expect(page).to have_content "can't be blank"
  end

  scenario "creating review fails without rating" do
    bus = FactoryGirl.create(:bus)

    visit bus_path(bus.id)

    fill_in 'Bus line number', with: rand(1..100)

    click_on 'Create Review'

    expect(page).to have_content "can't be blank"
  end

end
