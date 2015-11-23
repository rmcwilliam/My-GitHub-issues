#**My Hub**

This is a simple program written using HTTParty to make http requests via the [github api](https://api.github.com) to retrieve and or manipulate an owners repository related issues. 

##**Example**

```module Myhub
  class Github
    include HTTParty
    base_uri "https://api.github.com"

    def initialize
      @headers = {
        "Authorization" => "token #{ENV["AUTH_TOKEN"]}", 
        "User-Agent" => "HTTParty"
      }
    end

    def get_issues(owner, repo, options={})     
    issues = Github.get("/repos/#{owner}/#{repo}/issues", :headers => @headers, :query => options)
    map = issues.map {|issue| {id: issue["number"], title: issue["title"], url: issue["html_url"], state: issue["state"]} }
    end```