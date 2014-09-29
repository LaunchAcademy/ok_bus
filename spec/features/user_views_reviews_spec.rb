require "rails_helper"

feature "User views all reviews for bus", %{
  As a user I want to view all the reviews for a bus
  So that I can read other people's opinions
  } do
  scenario "only see reviews associated with bus" do
    review1 = FactoryGirl.create(:review)
    review2 = FactoryGirl.create(:review)
    bus = review1.ride.bus
    visit bus_path(bus)

    if review2.ride.bus == bus
      expect(page).to have_content review2.user.username.upcase
    else
      expect(page).to_not have_content review2.user.username.upcase
    end
  end

  scenario "reviews are in order with most recent first" do
    review1 = FactoryGirl.create(:review)
    review2 = FactoryGirl.create(:review, ride: review1.ride)
    user1 = review1.user.username.upcase
    user2 = review2.user.username.upcase
    bus = review1.ride.bus
    visit bus_path(bus)
    if review1.created_at > review2.created_at
      expect(user1).to appear_before user2
    else
      expect(user2).to appear_before user1
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
