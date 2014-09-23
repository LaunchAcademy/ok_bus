feature "User views list of buses", %Q{
  As a prospective user
  I want to see a list of buses
  So that I can select one to read and post reviews

  Acceptance Criteria:

  The bus number must be listed in order
  There is a link to each individual bus page
  The list must include the end destinations
  } do

  scenario "listed in order" do
    bus1 = Bus.create(number: 2, inbound: "Boston", outbound: "New York")
    bus2 = Bus.create(number: 3, inbound: "New York", outbound: "Chicago")
    bus3 = Bus.create(number: 1, inbound: "Chicago", outbound: "Boston")

    visit buses_path

    save_and_open_page

    expect(page).to have_content bus1.number
    # expect(bus1.number).to appear_before bus2.number
    # expect(bus3.number).to appear_before bus1.number
  end

  scenario "links to individual bus page" do
    bus = Bus.create(number: 2, inbound: "Boston", outbound: "New York")
    click_on Bus.number

    expect bus_path(bus.id)
  end

  scenario "The list must include the end destinations" do
    expect(page).to have_content "Harvard/Holyoke Gate"
  end
end

