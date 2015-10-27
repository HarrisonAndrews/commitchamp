
module Commitchamp
  class Github
    include HTTParty
    base_uri "https://api.github.com"

    def initialize(token)
      @headers = {
          "Authorization"     => "token #{token}",
          "User-Agent"        => "HTTParty"
      }
    end
    # end

    def get_contributors(owner,repo)

      Github.get("/repos/#{owner}/#{repo}/stats/contributors", headers: @headers)

      # GET /repos/:owner/:repo

    end












    end
  end