feature "User views list of buses", %Q{
  As a user I want to view a bus page
  So that I can see the bus' information
  } do

  scenario "bus number listed" do
    bus = Bus.create(number: "1", inbound: "Boston", outbound: "New York")

    visit bus_path(bus)

    expect(page).to have_content bus.number
  end

  scenario "bus line ends listed" do
    bus = Bus.create(number: "1", inbound: "Boston", outbound: "New York")

    visit bus_path(bus)

    expect(page).to have_content bus.inbound
    expect(page).to have_content bus.outbound
  end
end

