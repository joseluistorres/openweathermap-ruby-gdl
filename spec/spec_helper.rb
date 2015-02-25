require 'rubygems'
require 'webmock/rspec'
require 'vcr'
require 'openweathermap-ruby-gdl'

VCR.configure do |c|
  c.cassette_library_dir = 'fixtures/vcr_cassettes'
  c.hook_into :webmock
  c.allow_http_connections_when_no_cassette = true
end
VCR.turn_off! # turn off VCR by default

RSpec.configure do |config|

  config.treat_symbols_as_metadata_keys_with_true_values = true

  config.before(:all, :vcr_on) do
    VCR.turn_on!
  end


end
