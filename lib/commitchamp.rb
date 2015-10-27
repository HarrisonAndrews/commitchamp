require "httparty"
require "pry"
require "commitchamp/github"
require "commitchamp/version"
# Probably you also want to add a class for talking to github.

module Commitchamp

  class App

    def initialize
      @githubber = Github.new
    end


    def run
      # owner = prompt "whose repository are you looking for?"
      #
      # repo = prompt "which repository do you want?"

      @githubber.get_contributors
    end
  end
end

app = Commitchamp::App.new
app.run












