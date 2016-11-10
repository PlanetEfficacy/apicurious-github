class HomeController < ApplicationController
  def index
    @current_user = current_user
    @repos = Repo.all_by(current_user) if current_user
  end
end
