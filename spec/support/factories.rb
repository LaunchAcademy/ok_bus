FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "person#{n}" }
    sequence(:email) { |n| "person#{n}@email.com" }
    password "abcd12345"
  end

  factory :bus do
    number "23"
    inbound "Boston"
    outbound "New York"
  end

  factory :ride do
    timeframe "9AM-12PM"
    direction "inbound"
    day "weekday"
    bus
  end
end
