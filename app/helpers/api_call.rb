class ApiCall

  def initialize(end_url, parameters, method)
    @url = ENV["VIDEO_KEN_API_URL"] + "#{end_url}"
    @params = parameters
    @method = method
  end

  def make_call
    HTTParty.send(@method, @url, body: @params.as_json)
  end
end
