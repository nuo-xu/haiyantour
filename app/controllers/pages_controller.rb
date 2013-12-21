require 'net/http'
require 'json'

class PagesController < ApplicationController
  helper_method :weather, :weibo
  YAHOO_ROOT = "http://query.yahooapis.com/v1/public/yql"
  WEIBO_ROOT = "https://api.weibo.com/2/friendships/groups/timeline.json"
  
  def weather
    url = YAHOO_ROOT + "?q=select%20*%20from%20weather.forecast%20"
    url += "where%20woeid%3D2131595%20and%20u%3D'c'&format=json"
    doc = get_response_yahoo url
    doc
  end

  def get_response_yahoo url
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

  def weibo
    url = WEIBO_ROOT + "?source=1981538069&access_token=2.00mOABwB8Z1GKC817772b5f9owdscC&list_id=3657627672388520&count=2"
    doc = get_response_weibo url
    doc
  end

  def get_response_weibo url
    begin
      response = Net::HTTP.get_response(URI.parse url).body.to_s
    rescue => e
      raise "Failed to get weather [url=#{url}, e=#{e}]."
    end

    response = JSON.parse(response)
    if response.nil?
      raise "Failed to get weather [url=#{url}]."
    end
    first = feed_generator response["statuses"][0]
    second = feed_generator response["statuses"][1]
    # third = feed_generator response["statuses"][2]
    # result = "<ul><li><p> " + first + " </p></li>" + "<li><p> " + second + " </p></li>" + "<li><p> " + third + " </p></li></ul>"
    result = "<ul><li><p> " + first + " </p></li>" + "<li><p> " + second + " </p></li></ul>"
  end

  def feed_generator raw
    date = raw["created_at"].split(" ")[0..2].join(" ")
    time = raw["created_at"].split(" ")[3].split(":")[0,2].join(":")
    puts "DATETIME ______________________________ "
    puts date
    puts time
    datetime = date + " " + time
    feed = nil
    if raw.include?("retweeted_status")
      feed = raw["text"] + " -- [转发微博] -- " +  raw["retweeted_status"]["text"] + "<span> " + datetime + "</span>"
    else
      feed = raw["text"] + "<span> " + datetime + "</span>"
    end
    feed
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
