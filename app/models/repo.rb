class Repo
  attr_reader :name,
              :url,
              :id

  def initialize(attrs)
    @attrs = attrs
    @name = attrs["name"]
    @url = attrs["html_url"]
    @id = attrs["id"]
  end

  def self.all_by(user)
    GithubService.repos(user).map do |raw_repo|
      Repo.new(raw_repo)
    end
  end

  def delete(user)
    GithubService.delete_repo(user, self.name)
  end

  private

    def attrs
      @attrs
    end
end
