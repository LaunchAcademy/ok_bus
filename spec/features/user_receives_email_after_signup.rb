require "rails_helper"

feature "User is sent confirmation email after sign up", %Q{
  As a user
  I want to receive an email after I successfully sign up

  Acceptance Criteria:
  After successful sign up, I should receive an email
} do

  scenario "user signs up" do
    user = FactoryGirl.build(:user)
    ActionMailer::Base.deliveries = []
    
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
    expect(ActionMailer::Base.deliveries.size).to eql(1)

    last_email = ActionMailer::Base.deliveries.last
    expect(last_email).to have_subject("Welcome to OkBus!")
    expect(last_email).to deliver_to(user.email)
  end
