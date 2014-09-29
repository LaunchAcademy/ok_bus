require "rails_helper"

feature "User adds a review and receives email", %{
  I want to receive notice that my review has been posted

  Acceptance Criteria:

  I must be emailed after I write my review.
  } do

  let(:ride) { FactoryGirl.create(:ride) }
  let(:bus) { ride.bus }

  context "review submitted" do
    before :each do
      @user = FactoryGirl.create(:user)
      sign_in_as(@user)
    end

    scenario "review successfully added" do
      ActionMailer::Base.deliveries = []

      review = FactoryGirl.build(:review, user: @user, ride: ride)

      visit bus_path(bus)
      click_on "New Review"

      select review.ride.description, from: "review[ride_id]"
      select review.rating, from: "review[rating]"

      click_on "Create Review"

      expect(page).to have_content "Review successfully created."

      expect(ActionMailer::Base.deliveries.size).to eql(1)
      last_email = ActionMailer::Base.deliveries.last

    end
  end
end
