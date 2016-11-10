require "rails_helper"

RSpec.describe "GithubService" do

  it "gets repos" do
    VCR.use_cassette('github_service.repos') do
      user = create(:user)
      repos = GithubService.repos(user)
      expect(repos.count).to eq(30)
    end
  end

  it "can create a repo" do
    VCR.use_cassette('github_service.create_repo') do
      user = create(:user)
      repo_count = GithubService.repos(user).count
      new_repo = GithubService.create_repo(user, "my-new-repo-DELETE")
      expect(new_repo.name).to eq("my-new-repo-DELETE")
    end
  end

  it "can delete a repo" do
    user = create(:user)
    repo_count = GithubService.repos(user).count
    GithubService.delete_repo(user, "my-new-repo-DELETE")
    new_repo_count = GithubService.repos(user).count
    expect(new_repo_count).to eq(repo_count - 1)
  end

end
