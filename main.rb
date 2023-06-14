$: << File.expand_path("..", __FILE__)

require "rack"
require "base"

class MainController < Base
  
  get "/" do
    "<b>Hellow world</b>"
  end
  
  get "/test" do
    @headers["Content-type"] = "text/plain"
    "<b>Hello world</b>"
  end
  
  get "/view" do
    @var = "muni"
    render
  end

  error 404 do
    @status = 404
    "<b>Not found</b>"
  end
    
end

Rack::Handler.get("webrick").run(MainController, :Port => 3000)