require "sinatra/base"
require "httparty"
require "pry"

require "myhub/version"
require "myhub/github"


module Myhub                 
  class App < Sinatra::Base
    set :logging, true

    get "/" do
      api = Github.new
      results = api.get_issues("TIY-ATL-ROR-2015-Sep","assignments",{assignee:"rmcwilliam", state: "all"})
      erb :index, locals: {results: results}
    end

    post "/issue/reopen/:id" do   
      api = Github.new
      api.reopen_issue("TIY-ATL-ROR-2015-Sep","assignments",params["id"].to_i)
      "It's open"
    end

    post "/issue/close/:id" do     
      api = Github.new
      api.close_issue("TIY-ATL-ROR-2015-Sep","assignments",params["id"].to_i)
      "It's closed"
    end
    run! if app_file == $0
  end
end

