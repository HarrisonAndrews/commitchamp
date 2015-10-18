require "httparty"
require "pry"
require "commitchamp/github"
require "commithamp/repo_info"
require "commitchamp/version"
# Probably you also want to add a class for talking to github.

module Commitchamp
  class App
    def initialize
      puts "Welcome to commitchamp!"
    end








    def run
      # Your code goes here...
    end
  end
end

app = Commitchamp::App.new
app.run

