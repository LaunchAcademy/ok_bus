require 'rails_helper'

feature "User creates an account", %Q{
  As a prospective user
  I want to create an account
  So that I can read and post bus reviews

  Acceptance Criteria:

   I must provide a username, and email address.
   If I do not provide the required information, I receive an error message.
   If my email address is already in use, I receive an error message.
   I must not be logged in to create an account.
  } do

  scenario "with required information" do
    # previous_count = User.count

    visit root_path
    click_on "Sign up"

    fill_in "Email", with: "testperson@example.com"
    fill_in "Password", with: "abcd12345"
    fill_in "Password confirmation", with: "abcd12345"

    within ".new_user" do
      click_on "Sign up"
    end

    expect(page).to have_content "Welcome! You have signed up successfully."
    # expect(User.count).to eq previous_count + 1
  end

  scenario "without required information" do
    visit root_path
    click_on "Sign up"

    within ".new_user" do
      click_on "Sign up"
    end

    expect(page).to have_content "Email can't be blank"
    expect(page).to have_content "Password can't be blank"
  end

  scenario "email already in use"

  scenario "user is already logged in"

end
