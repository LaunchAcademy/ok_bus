module VotesHelper
  def change_or_vote(bus, review, direction)
    vote = Vote.find_by(review_id: review.id, user_id: current_user.id)
    if vote
      if vote.direction != direction.downcase
        link_to direction,
        bus_review_vote_path(bus,
                             review,
                             vote), method: :PUT
      else
        direction
      end
    else
      link_to direction,
      bus_review_votes_path(bus,
                            review,
                            direction: direction), method: :POST
    end
  end
end
