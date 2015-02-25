require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe OpenweathermapRubyGdl, :vcr_on do
  let(:openweathermap_ruby_gdl) { OpenweathermapRubyGdl.new(nil) }

  it "should read the response of the service" do
    VCR.use_cassette('service_rest', :record => :new_episodes) do
      expect(openweathermap_ruby_gdl.url).to eq('http://api.openweathermap.org/data/2.5/weather?id=4005539')
      expect(openweathermap_ruby_gdl.get_response).to match(/Guadalajara/)
      expect(openweathermap_ruby_gdl.parse_response['coord'].to_s).to eq("{\"lon\"=>-103.33, \"lat\"=>20.67}")
    end
  end

end
