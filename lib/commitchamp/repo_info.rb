module Commitchamp
  class Repo_info
    include HTTParty
    base_uri "https://api.github.com"

    def initialize(auth_token)
      @auth = {
          "Authorization" => "token #{auth_token}",
          "User-Agent"    => "HTTParty"
      }
    end


  def repo_info(owner, repo)
    info = Repo_info.get("/repos/#{owner}/#{repo}/stats/contributors", :headers => auth)

    info['']


binding.pry


  end



   # GET /repos/:owner/:repo/stats/contributors







  end
end
