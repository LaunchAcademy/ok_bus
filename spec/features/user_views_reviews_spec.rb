require 'rails_helper'

feature "User views all reviews for bus", %{
  As a user I want to view all the reviews for a bus
  So that I can read other people's opinions
  } do
  scenario "must be on bus detail page" do
    bus = FactoryGirl.create(:bus)
    visit bus_path(bus.id)
    review = FactoryGirl.build(:review)
    save_and_open_page
    expect(page).to have_content review.rating.to_s + " out of 5"
    expect(page).to have_content review.body
  end

  scenario "only see reviews associated with bus"

  scenario "reviews are in order with most recent first" do
    bus = FactoryGirl.create(:bus)
    visit bus_path(bus.id)
    review1 = FactoryGirl.build(:review)
    review2 = FactoryGirl.build(:review)

    if review1.created_at > review2.created_at
      expect(review1.body).to appear_before review2.body
    else
      expect(review2.body).to appear_before review1.body
    end
  end

  scenario "review shows ride details" do
    bus = FactoryGirl.create(:bus)
    visit bus_path(bus.id)
    ride = FactoryGirl.create(:ride)
    review = FactoryGirl.build(:review)
    expect(page).to have_content ride.timeframe
    expect(page).to have_content ride.direction
    expect(page).to have_content ride.day
  end
end
