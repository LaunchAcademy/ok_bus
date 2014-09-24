require 'rails_helper'

feature "User views all reviews for bus", %{
  As a user I want to view all the reviews for a bus
  So that I can read other people's opinions
  } do
  scenario "must be on bus detail page" do
    review = FactoryGirl.create(:review)
    bus = review.ride.bus
    visit bus_path(bus)
    expect(page).to have_content review.rating.to_s + " out of 5"
    expect(page).to have_content review.body
  end

  scenario "only see reviews associated with bus"

  scenario "reviews are in order with most recent first" do
    review1 = FactoryGirl.create(:review)
    review2 = FactoryGirl.create(:review, ride: review1.ride)
    bus = review1.ride.bus
    visit bus_path(bus)

    if review1.created_at > review2.created_at
      expect(review1.body).to appear_before review2.body
    else
      expect(review2.body).to appear_before review1.body
    end
  end

  scenario "review shows ride details" do
    review = FactoryGirl.create(:review)
    bus = review.ride.bus
    ride = review.ride
    visit bus_path(bus)
    expect(page).to have_content ride.timeframe
    expect(page).to have_content ride.direction
    expect(page).to have_content ride.day
  end
end
