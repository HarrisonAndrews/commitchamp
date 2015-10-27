require "httparty"
require "pry"
require "commitchamp/github"
require "commitchamp/version"
# Probably you also want to add a class for talking to github.

module Commitchamp

  class App

    def initialize
      token = prompt("What is your auth token?")
      @githubber = Github.new(token)

    end

    def prompt(message)
      puts message
      gets.chomp
    end


    def get_pretty_stats
      @response.map {|contribution| extract_results(contribution)}

    end

    def extract_results(contribution)
      user      = get_author(contribution)
      additions = get_stats(contribution, "a")
      deletions = get_stats(contribution, "d")
      changes   = get_stats(contribution, "c")
      {user => [additions, deletions, changes]}
    end

    def run
      owner = prompt "whose repository are you looking for?"
      repo = prompt "which repository do you want?"
      @response = @githubber.get_contributors(owner, repo)
      list = get_pretty_stats
      puts list

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



  end
end

app = Commitchamp::App.new
app.run






binding.pry





