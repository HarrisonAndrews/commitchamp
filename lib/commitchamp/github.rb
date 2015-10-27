
module Commitchamp
  class Github
    include HTTParty
    base_uri "https://api.github.com"

    def initialize
      token = prompt("What is your auth token?")
      @headers = {
          "Authorization"     => "token #{token}",
          "User-Agent"        => "HTTParty"
      }
    end
    # end

    def get_contributors

        owner = prompt "whose repository are you looking for?"

        repo = prompt "which repository do you want?"

      Github.get("repos/#{owner}/#{repo}/stats/contributors", headers: @headers)

      # GET /repos/:owner/:repo

    end

      def get_pretty_stats
        response  = self.get_contributors
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