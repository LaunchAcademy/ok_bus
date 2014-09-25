require "rails_helper"
feature "admin functions: the admin should be able to delete an user and to delete any review" do

<<<<<<< HEAD
  let(:user) { FactoryGirl.create(:user)}
  let(:review) { Review.create(body: "aaa",user_id: user.id,rating: rand(1..5)) }
  context "authenticated admin" do
    before :each do
      @admin = FactoryGirl.create(:user)
      @admin.update_attribute :admin,true
      sign_in_as(@admin)
    end
    scenario "admin is logged in as an admin" do
      @admin.admin?
    end
    scenario "admin deletes someone else's review" do

=======
feature "Admin fuctionality", %{
  As an admin, I should be identified as such
  I should have more functions than a regular user
  So that I can maintain order on the site.

  Acceptance Criteria:

  I must be logged in and identified as an admin
<<<<<<< HEAD
} do

let(:user) { FactoryGirl.create(:user) }
let(:review) { Review.create(body: "aaa",user_id: user.id,rating: rand(1..5)) }

context "authenticated admin" do
  before :each do
    @admin = FactoryGirl.create(:user)
    @admin.update_attribute :admin,true
    sign_in_as(@admin)
  end

  scenario "admin is logged in as an admin, user is logged in as an user." do
    @admin.admin?
    !user.admin?
  end

  scenario "admin deletes someone else's review" do
>>>>>>> 5f3bb88b394d7047ba110f82e06c03b352b303c5


    end

    scenario "admin deletes another user's account" do


    end

  end
end
=======
  } do

  context "authenticated admin" do
    before :each do
      @admin = FactoryGirl.create(:user, admin: true)
      # @admin.update_attribute :admin, true
      @user = FactoryGirl.create(:user)
    end

    scenario "admin visits user index" do
      sign_in_as(@admin)
      visit "/admin/users"
      save_and_open_page
      expect(page).to have_content(@user.email)
    end

    scenario "Unauthorized users cannot access user index" do
      sign_in_as(@user)
      visit "/admin/users"
      expect(page).to have_content("not authorized")
    end

    scenario "admin deletes another user's account" do
      sign_in_as(@admin)
      visit "/admin/users"
      # binding.pry
      # save_and_open_page
      click_on "Delete"
    end
  end
>>>>>>> 062974743b8b9739f2255f787d921a6cdae29f23
end
