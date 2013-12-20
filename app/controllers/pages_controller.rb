require 'net/http'
require 'json'

class PagesController < ApplicationController
  helper_method :weather
  ROOT = "http://query.yahooapis.com/v1/public/yql"
  
  def weather
    url = ROOT + "?q=select%20*%20from%20weather.forecast%20"
    url += "where%20woeid%3D2131595%20and%20u%3D'c'&format=json"
    doc = get_response url
    doc
  end

  def get_response url
    begin
      response = Net::HTTP.get_response(URI.parse url).body.to_s
    rescue => e
      raise "Failed to get weather [url=#{url}, e=#{e}]."
    end

    response = JSON.parse(response)
    if response.nil?
      raise "Failed to get weather [url=#{url}]."
    end
    result = response["query"]["results"]["channel"]["item"]["description"]
    result
  end
  
  def home
  end

  def story
  end

  def news
  end

  def media
  end

  def discovery
  end

  def contact
  end
end
