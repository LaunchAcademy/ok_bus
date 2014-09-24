require 'rails_helper'

feature "User creates an account", %Q{
  As a prospective user
  I want to create an account
  So that I can read and post bus reviews

  Acceptance Criteria:

   I must provide a username, email address, and password.
   If I do not provide the required information, I receive an error message.
   If my email address is already in use, I receive an error message.
   If password does not match password confirmation, I receive an error message.
   I must not be logged in to create an account.
   I can optionally upload a profile photo.
  } do

  scenario "with required information" do
    user = FactoryGirl.build(:user)
    visit root_path
    click_on "Sign up"

    fill_in "Username", with: user.username
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    fill_in "Password confirmation", with: user.password

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

  scenario "email already in use" do
    existing_user = FactoryGirl.create(:user)
    visit root_path
    click_on "Sign up"

    fill_in "Username", with: existing_user.username
    fill_in "Email", with: existing_user.email
    fill_in "Password", with: existing_user.password
    fill_in "Password confirmation", with: existing_user.password

    within ".new_user" do
      click_on "Sign up"
    end

    expect(page).to have_content "Email has already been taken"
  end

  scenario "username already taken" do
    existing_user = FactoryGirl.create(:user)
    visit root_path
    click_on "Sign up"

    fill_in "Username", with: existing_user.username
    fill_in "Email", with: existing_user.email + "1"
    fill_in "Password", with: existing_user.password
    fill_in "Password confirmation", with: existing_user.password

    within ".new_user" do
      click_on "Sign up"
    end

    expect(page).to have_content "Username has already been taken"
  end

  scenario "password confirmation does not match password" do
    user = FactoryGirl.build(:user)
    visit root_path
    click_on "Sign up"

    fill_in "Username", with: user.username
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    fill_in "Password confirmation", with: user.password + "1"

    within ".new_user" do
      click_on "Sign up"
    end
  end

  scenario "user is already logged in" do
    # log in a user
    user = FactoryGirl.create(:user)
    sign_in_as(user)

    # make sure Sign Up button isn't on page
    expect(page).to_not have_content "Sign up"
  end

  scenario "user uploads a photo" do
    user = FactoryGirl.build(:user)
    visit root_path
    click_on "Sign up"

    fill_in "Username", with: user.username
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    fill_in "Password confirmation", with: user.password
    attach_file "Profile photo", 'app/assets/images/sushi.jpg'

    within ".new_user" do
      click_on "Sign up"
    end

    expect(page).to have_content "Welcome! You have signed up successfully."
    end
end
