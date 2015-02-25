class OpenweathermapRubyGdl
  attr_accessor :url

  def initialize(url)
    @url = url || 'http://api.openweathermap.org/data/2.5/weather?id=4005539'
  end

  def get_response
    call_url(@url)
  end

  def call_url(url)
    Net::HTTP.get(URI.parse(url))
  end

  def parse_response
    JSON.parse get_response
  end
end
