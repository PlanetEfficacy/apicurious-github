require "rails_helper"

RSpec.describe "repo" do
  context ".all_by(user)" do
    it "returns an array of repositories" do
      VCR.use_cassette('Repo.repos') do
        user = create(:user)
        repos = Repo.all_by(user)
        repo = repos.first

        expect(repos.count).to eq(30)
        expect(repo.name).to eq("rush-hour-skeleton")
        expect(repo.url).to eq("https://github.com/bheim6/rush-hour-skeleton")
      end
    end

    it "can delete a repository" do
      user = create(:user)
      repo = GithubService.create_repo(user, "my-new-repo-DELETE")
      repo_name = repo.name
      repo.delete
      repo_names = Repo.all_by(user).map { |repo| repo.name }
      expect(repo_names).to_not include(repo_name)
    end
  end

end
