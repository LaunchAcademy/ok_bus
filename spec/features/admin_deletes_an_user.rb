require "rails_helper"

context "authenticated admin" do
  before :each do
    @user = FactoryGirl.create(:user)
    @admin = FactoryGirl.create(:user)
    @review = Review.create(body: "aaa",user_id: @user.id, rating: rand(1..5))
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
