
require "httparty"
require "pry"

module Commitchamp
  class Repo_info
    include HTTParty
    base_uri "https://api.github.com"

    def initialize
       @auth = {
           "Authorization" => "token #{auth_token}",
           "User-Agent"    => "HTTParty"
       }
    end


  def repo_info(owner, repo)
    info = Repo_info.get("/repos/#{owner}/#{repo}/stats/contributors", :headers => @auth)
    info.each do |contributor|
    info_a = contributor["weeks"].map  {|x| x ["a"]}.sum
    info_d = contributor["weeks"].map  {|x| x ["d"]}.sum
    info_c = contributor["weeks"].map  {|x| x ["c"]}.sum

    end
    puts "Number of Additons: #{info_a}"
    puts "Number of Deletions: #{info_d}"
    puts "Number of Commits:  #{info_c}"



   # GET /repos/:owner/:repo/stats/contributors


# def what_the_stuff(what_the_stuff)
#   what_the_stuff = 42
# end




  end
end
end
