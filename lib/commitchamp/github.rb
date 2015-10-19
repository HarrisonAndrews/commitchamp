require "httparty"
require "pry"

  module Commitchamp
    class Github
      include HTTParty
      base_uri "https://api.github.com"

    def initialize(auth_token)
      @headers = {
          "Authorization" => "token #{auth_token}"
          "User-Agent"    => "HTTParty"

      }
    end

    def find_user(username)
      Github.get("/users/#{username}", headers: @headers)

end

    def get_repo(owner, repo)
      Github.get("repos/#{owner}/#{repo}", headers: @headers)



      # GET /repos/:owner/:repo

    end










    end
  end