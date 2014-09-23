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
    bus = Bus.create(number:)
    visit buses_path

    expect(page).to have_content "117"
  end

  scenario "links to individual bus page" do
    click_on "1 - Harvard/Holyoke Gate - Dudley Station via Massachusetts Avenue"

    expect bus_path
  end

  scenario "The list must include the end destinations" do
    expect(page).to have_content "Harvard/Holyoke Gate"
  end
end

