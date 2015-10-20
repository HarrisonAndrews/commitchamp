require "httparty"
require "pry"
require "commitchamp/github"
require "commithamp/repo_info"
require "commitchamp/version"
# Probably you also want to add a class for talking to github.

module Commitchamp

  @auth =

  class App
    def initialize
      puts "Welcome to commitchamp!"
      @auth = {
          "Authorization" => "token #{auth_token}",
          "User-Agent"    => "HTTParty"
      }
      if @auth
    end

    def get_user
      puts "Please give us your username"
      find_user
      username = get.chomp
      puts "Welcome #{username}"
    end


  def get_repo
    puts "What repository are you looking for?  Put the repository name!"
    get_repo
    getrepo = get.chomp
    puts "You have slected #{getrepo} as your repository!"
  end

  end





    def run
      # Your code goes here...
    end
  end
end

app = Commitchamp::App.new
app.run













module Commitchamp
  class Github
    include HTTParty
    base_uri" "https://api.github.com

    def initialize
      token = prompt("What is your auth token?")
      @headers = {
          'Authroization'  => "token #{token}"
      "User_Agent"    =>  "HTTParty"

      def get_contributors
        Github.get("/repos/#{owner}/#{repo}/")
      end

      }
    end
  end
end

