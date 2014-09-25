require "rails_helper"

feature "Admin fuctionality", %{
  As an admin, I should be identified as such
  I should have more functions than a regular user
  So that I can maintain order on the site.

  Acceptance Criteria:

  I must be logged in and identified as an admin
} do

let(:user) { FactoryGirl.create(:user) }
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



  end

  scenario "admin deletes another user's account" do


  end

end
end
