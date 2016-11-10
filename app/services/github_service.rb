class GithubService
  def self.repos(user)
    response = conn.get do |req|
      req.url '/user/repos'
      req.params['access_token'] = user.token
    end
    JSON.parse(response.body)
  end

  def self.conn
    Faraday.new(url: "https://api.github.com") do |faraday|
      faraday.request :url_encoded
      faraday.response :logger
      faraday.adapter Faraday.default_adapter
      # faraday.params['access_token'] =
    end
  end

  def self.create_repo(user, name)
    response = conn.post do |req|
      req.url '/user/repos'
      req.params['access_token'] = user.token
      req.body = JSON.generate({name: name})
    end
    repo = Repo.new(JSON.parse(response.body))
  end

  def self.delete_repo(user, repo_name)
    conn.delete do |req|
      req.url "/repos/#{user.username}/repo_name"
      req.params['access_token'] = user.token
    end
  end
end
