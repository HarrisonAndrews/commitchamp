require "httparty"
require "pry"

  module Commitchamp
    class Github
      include HTTParty
      base_uri "https://api.github.com"

    def initialize

      token = promt"what is your auth token?"
      @headers = {
          "Authorization" => "token #{token}"
          "User-Agent"    => "HTTParty"
      }
    end

    # def find_user(username)
    #   Github.get("/users/#{username}", headers: @headers)
    #
    # end

    def get_contributors(owner, repo)
      Github.get("repos/#{owner}/#{repo}/stats/contributors", headers: @headers)

      # GET /repos/:owner/:repo

    end

      def get_pretty_stats(owner, repo)
        response  = self.get_contributors(owner, repo)
        response.map {|contribution| extract_results(contribution)}

      end

      def extract_results(contribution)
        user      = get_author(contribution)
        additions = get_stats(response, "a")
        deletions = get_stats(response, "d")
        changes   = get_stats(response, "c")
        {user => [additions, deletions, changes]}
      end

      private
      def get_author(contribution)
        contribution["author"]["login"]

      end

      def get_stats(contribution, stat)
        weeks = contribution["weeks"]
        weeks.inject(0) {|sum, item| sum + item[stat]}
        # sum = 0
        # weeks.map { |hash| hash[stat]}.each do |stat|
        #   sum += stat
        # end
        # sum
      end


      def prompt(message)
        puts message
        gets.chomp
      end










    end
  end