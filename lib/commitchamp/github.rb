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












    end
  end