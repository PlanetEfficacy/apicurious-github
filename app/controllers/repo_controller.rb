class RepoController < ApplicationController
  def create
    repo = GithubService.create_repo(current_user, params[:name])
    redirect_to root_path
  end

  def destroy
    binding.pry
    GithubService.delete_repo(current_user, params[:repo_name])
    redirect_to root_path
  end
end
