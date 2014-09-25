require "rails_helper"

feature "User votes on a review", %{
  As a User, I want to vote on reviews
  So that I can shame really nasty reviewers
  } do
  scenario "can vote up or down on a review"
  scenario "must be logged on to vote"
  scenario "vote is added to vote count"
end
