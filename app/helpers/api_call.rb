# Helper class to interact witht the VideKen-server
# params {
#   end_url => action name for the endpoint eg. "users" or "appointments"
#   method => Protocol to be used to make the request eg. "get" or "post"
#   parametes => Parametes hash to be sent if a POST request
# }

class ApiCall
  def initialize(end_url, method, parameters=nil)
    @url = ENV["VIDEO_KEN_API_URL"] + "#{end_url}"
    @params = parameters
    @method = method
  end

  def make_call
    HTTParty.send(@method, @url, body: @params.as_json)
  end
end
