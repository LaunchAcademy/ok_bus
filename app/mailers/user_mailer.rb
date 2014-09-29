class UserMailer < ActionMailer::Base
  default from: "admin@okbus.com"

  def welcome_email(user)
    @user = user
    @url = root_path
    mail(to: @user.email, subject: "Welcome to OkBus!")
  end

  def review_email(review)
    @review = review
    @username = @review.user.username
    @email = @review.user.email
    @ride = @review.ride
    @bus = @ride.bus
    mail(to: @email, subject: "Thank you for your review on OkBus!")
  end

  def vote_email(review)
    @review = review
    @username = @review.user.username
    @email = @review.user.email
    @ride = @review.ride
    @bus = @ride.bus
    @vote = @review.votes[0]
    binding.pry
    mail(to: @email, subject: "Someone just voted on your OkBus review!")
  end
end
