#**My Hub**

This is a simple program written using Sinatra and HTTParty to make http requests via the [github api](https://api.github.com) to retrieve and or manipulate an owners repository related issues. 

##**Example**
```
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
  end
end
```