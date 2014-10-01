require "rails_helper"

feature "User can view profile page", %{
  I want to be able to view my profile
  I want to be able to update my information
  I want to see the reviews I have posted
  } do

  let(:ride) { FactoryGirl.create(:ride) }
  let(:bus) { ride.bus }

  context "authenticated user" do
    before :each do
      @user = FactoryGirl.create(:user)
      @reviews = FactoryGirl.create_list(:review, 2, user: @user)
      sign_in_as(@user)
    end

    scenario "view profile page" do
      click_on "User Profile"
      expect(page).to have_content(@user.username)
      expect(page).to have_content(@user.email)
      expect(page).to have_content "Your reviews"
      @reviews.each do |review|
        expect(page).to have_content(review.body)
      end
    end

    scenario "update user info" do
      click_on "User Profile"
      click_on "Edit Info"

      fill_in "Password", with: @user.password + "1"
      fill_in "Password confirmation", with: @user.password + "1"
      fill_in "Current password", with: @user.password
      attach_file "Profile photo", "app/assets/images/sushi.jpg"

      click_on "Update"
      expect(page).to have_content "You updated your account successfully"
    end
  end
end
