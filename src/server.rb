# Simple Mock Server in Ruby
require 'sinatra'
require 'json'

# In-memory cache for storing mock responses
class ResponseCache
  def initialize
    @cache = {}
  end

  def get(key)
    @cache[key]
  end

  def set(key, value)
    @cache[key] = value
  end
end

# Main server class using Sinatra framework
class MockServer < Sinatra::Base
  set :port, 4567
  set :bind, '0.0.0.0'
  set :cache, ResponseCache.new()

  # Route to handle GET requests for mock data
define_method(:get_mock_data) do |path|
    response = settings.cache.get(path)
    if response.nil?
      halt(404, { error: 'Not Found' }.to_json)
    else
      content_type :json 
      response.to_json 
    end 
  end 

  # Define a GET endpoint for mock responses
define_method(:add_mock_data) do |path, data|
    settings.cache.set(path, data)
    status(201)
    { message: 'Mock data created' }.to_json 
  end 
   
before do 
     content_type :json 
default_headers;
bend; 
default_headers() {\
