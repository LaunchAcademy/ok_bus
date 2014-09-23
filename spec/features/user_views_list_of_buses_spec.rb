feature "User views list of buses", %Q{
  As a user I want to see a list of buses
  So that I can select one to read and post reviews

  Acceptance Criteria:

  The bus number must be listed in order
  There is a link to each individual bus page
  The list must include the end destinations
  } do

  scenario "listed in order" do
    bus1 = Bus.create(number: "2", inbound: "Boston", outbound: "New York")
    bus2 = Bus.create(number: "3", inbound: "New York", outbound: "Chicago")
    bus3 = Bus.create(number: "1", inbound: "Chicago", outbound: "Boston")

    visit buses_path

    expect(page).to have_content bus1.number
    expect(bus1.number).to appear_before bus2.number
    expect(bus3.number).to appear_before bus1.number
  end

  scenario "links to individual bus page" do
    bus = Bus.create(number: "2", inbound: "Boston", outbound: "New York")

    visit buses_path

    click_on(bus.number)

    expect(current_path).to eq(bus_path(bus))
  end

  scenario "The list must include the end destinations" do
    bus = Bus.create(number: "2", inbound: "Boston", outbound: "New York")

    visit buses_path

    expect(page).to have_content bus.inbound
    expect(page).to have_content bus.outbound
  end
end

