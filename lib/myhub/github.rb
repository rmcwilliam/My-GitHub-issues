module Myhub
  class Github
    include HTTParty
    base_uri "https://api.github.com"

    def initialize
      @headers = {
        "Authorization" => "token #{ENV["AUTH_TOKEN"]}", 
        "User-Agent" => "HTTParty"
      }
    end

    def get_issues(owner, repo, options={})    # GET /repos/:owner/:repo/issues    assignee 
    issues = Github.get("/repos/#{owner}/#{repo}/issues", :headers => @headers, :query => options)
    map = issues.map {|issue| {id: issue["number"], title: issue["title"], url: issue["html_url"], state: issue["state"]} }
    end
        # Enumerate each, map... need to drill down and hand back options 
    
    def reopen_issue(owner, repo, id) #need ID        #PATCH /repos/:owner/:repo/issues/:number
    Github.patch("/repos/#{owner}/#{repo}/issues/#{number}", :headers => @headers, :body => {state: "open"}.to_json)
    end

    def close_issue(owner, repo, id)   #need ID         #PATCH /repos/:owner/:repo/issues/:number
    Github.patch("/repos/#{owner}/#{repo}/issues/#{id}", :headers => @headers, :body => {state: "closed"}.to_json)
    end
     
  end
end
   