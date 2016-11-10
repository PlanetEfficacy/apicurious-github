FactoryGirl.define do
  factory :user do
    username "PlanetEfficacy"
    uid "15135934"
    token ENV['github_test_token']
  end
end
