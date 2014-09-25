feature "User views list of buses", %{
  As a user I want to view a bus page
  So that I can see the bus' information
  } do

  scenario "views bus page" do
    ride = FactoryGirl.create(:ride)
    reviews = FactoryGirl.create_list(:review, 3, ride: ride)
    bus = ride.bus

    visit bus_path(bus)
    expect(page).to have_content bus.number
    expect(page).to have_content bus.inbound
    expect(page).to have_content bus.outbound

    reviews.each do |review|
      expect(page).to have_content review.body
    end
  end
end
