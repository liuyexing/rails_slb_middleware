require "rails_slb_middleware/version"
require 'rack'

class RailsSlbMiddleware
  def initialize(app, force_rewrite_https = true)
    @app = app
    @force_rewrite_https = force_rewrite_https
  end

  def call(env)
    req = Rack::Request.new(env)

    if @force_rewrite_https && req.get_header("HTTP_X_FORWARDED_PROTO") == "https" && req.scheme == "http"
      return [301, {"Location" => req.url.gsub(/^http/, "https")}, []]
    end

    if req.path == "/ping"
      return [200, {"Content-Type" => "text/plain"}, ["PONG"]]
    end

    @app.call(req.env)
  end
end
