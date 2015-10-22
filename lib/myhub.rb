require "sinatra/base"
require "httparty"
require "pry"

require "myhub/version"
require "myhub/github"


module Myhub                  # Server / controller 
  class App < Sinatra::Base
    set :logging, true

binding.pry
    get "/" do
      api = Github.new
      results = api.get_issues("TIY-ATL-ROR-2015-Sep","assignments",{mentioned:"rmcwilliam", state: "all"})
      erb :index, locals: {issues: results}
    end

    post "issue/reopen/:id" do    # owner, repo
      api = Github.new
      api.reopen_issue("TIY-ATL-ROR-2015-Sep","assignments",params["id"].to_i)
      "It's open"
    end

    post "issue/close/:id" do      # owner, repo
      api = Github.new
      api.close_issue("TIY-ATL-ROR-2015-Sep","assignments",params["id"].to_i)
      "It's closed"
    end

    run! if app_file == $0
  end

end

# when I start the application do ->  AUTH_TOKEN=your_auth_token_here bundle exec ruby lib/myhub.rb     Sets auth token ENV
