require 'rails_helper'

RSpec.feature "user logs in" do
  scenario "using github oauth2" do
    stub_omniauth
    visit root_path
    expect(page).to have_link("Sign in with GitHub")
    click_link "Sign in with GitHub"
    within ".user-area" do
      expect(page).to have_content("PlanetEfficacy")
    end
    expect(page).to have_link("Logout")
  end

  def stub_omniauth
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
      provider: 'github',
      uid: '15135934',
      credentials: {
        token: ENV['github_test_token']
      },
      info: {
        nickname: 'PlanetEfficacy'
      }
    })
  end
end
